with Interfaces.C.Extensions;
with Ada.Strings.Hash;
with Ada.Unchecked_Deallocation;
with z3_optimization_h;
with System;

package body Z3
is
   use Interfaces.C.Strings;

   function Convert_Bool (Value : z3_api_h.Z3_lbool) return Result is
      (case Value is
         when z3_api_h.Z3_L_FALSE => Result_False,
         when z3_api_h.Z3_L_TRUE  => Result_True,
         when z3_api_h.Z3_L_UNDEF => Result_Undef,
         when others => raise Z3.Internal_Error);  --  GCOV_EXCL_LINE

   ------------------------------------------------------------------------------------------------

   function Const (Name    : String;
                   Sort    : z3_api_h.Z3_sort;
                   Context : z3_api_h.Z3_context) return z3_api_h.Z3_ast
   is
      C_Name : chars_ptr := New_String (Name);
      Symbol : constant z3_api_h.Z3_symbol :=
         z3_api_h.Z3_mk_string_symbol (c => Context,
                                       s => z3_api_h.Z3_string (C_Name));
   begin
      Free (C_Name);
      return z3_api_h.Z3_mk_const (c  => Context,
                                   s  => Symbol,
                                   ty => Sort);
   end Const;

   ------------------------------------------------------------------------------------------------

   function Bool (Name : String; Context : Z3.Context'Class) return Bool_Type
   is
   begin
      return (Data    => Const (Name    => Name,
                                Sort    => z3_api_h.Z3_mk_bool_sort (Context.Data),
                                Context => Context.Data),
              Context => Z3.Context (Context));
   end Bool;

   ------------------------------------------------------------------------------------------------

   function Bool (Value : Boolean; Context : Z3.Context'Class) return Bool_Type
   is
   begin
      if Value then
         return (Data    => z3_api_h.Z3_mk_true (Context.Data),
                 Context => Z3.Context (Context));
      end if;
      return (Data    => z3_api_h.Z3_mk_false (Context.Data),
              Context => Z3.Context (Context));
   end Bool;

   ------------------------------------------------------------------------------------------------

   function Bool (Expr : Expr_Type'Class) return Bool_Type is
      (Data    => Expr.Data,
       Context => Expr.Context);

   ------------------------------------------------------------------------------------------------

   function Value (Data : Bool_Type) return Result is
      (Convert_Bool (z3_api_h.Z3_get_bool_value (c => Data.Context.Data,
                                                 a => Data.Data)));

   ------------------------------------------------------------------------------------------------

   function Equal (Left, Right : Expr_Type'Class) return Bool_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_eq (c => Left.Context.Data,
                                            l => Left.Data,
                                            r => Right.Data),
              Context => Left.Context);
   end Equal;

   function "=" (Left, Right : Expr_Type'Class) return Bool_Type is (Equal (Left, Right));
   function "/=" (Left, Right : Expr_Type'Class) return Bool_Type is (not Equal (Left, Right));

   ------------------------------------------------------------------------------------------------

   function Simplified (Value : Expr_Type) return Expr_Type
   is
   begin
      return (Data    => z3_api_h.Z3_simplify (c => Value.Context.Data,
                                               a => Value.Data),
              Context => Value.Context);
   end Simplified;

   ------------------------------------------------------------------------------------------------

   generic
      type Expr is new Expr_Type with private;
      type Expr_Array is array (Natural range <>) of Expr;
   function Generic_To_Z3_ast_array (Value : Expr_Array) return Z3_ast_array;

   function Generic_To_Z3_ast_array (Value : Expr_Array) return Z3_ast_array
   is
      Result : Z3_ast_array (Value'Range);
   begin
      for I in Value'Range loop
         Result (I) := Value (I).Data;
      end loop;
      return Result;
   end Generic_To_Z3_ast_array;

   ------------------------------------------------------------------------------------------------

   function To_Z3_ast_array_Bool is new Generic_To_Z3_ast_array (Bool_Type, Bool_Array);
   function To_Z3_ast_array (Value : Bool_Array) return Z3_ast_array renames To_Z3_ast_array_Bool;  -- GCOV_EXCL_LINE

   ------------------------------------------------------------------------------------------------

   function To_Z3_ast_array_Int is new Generic_To_Z3_ast_array (Int_Type, Int_Array);
   function To_Z3_ast_array (Value : Int_Array) return Z3_ast_array renames To_Z3_ast_array_Int;  -- GCOV_EXCL_LINE

   ------------------------------------------------------------------------------------------------

   function To_Z3_ast_array_Bit_Vector is new Generic_To_Z3_ast_array (Bit_Vector_Type, Bit_Vector_Array);
   function To_Z3_ast_array (Value : Bit_Vector_Array) return Z3_ast_array renames  -- GCOV_EXCL_LINE
      To_Z3_ast_array_Bit_Vector;

   ------------------------------------------------------------------------------------------------

   generic
      type Expr is new Expr_Type with private;
      type Expr_Array is array (Natural range <>) of Expr;
      with function Subst_To_Z3_ast_array (Terms : Expr_Array) return Z3_ast_array;
   function Generic_Substitute (Term : Expr_Type'Class;
                                From : Expr_Array;
                                To   : Expr_Array) return Expr_Type'Class;

   function Generic_Substitute (Term : Expr_Type'Class;
                                From : Expr_Array;
                                To   : Expr_Array) return Expr_Type'Class
   is
      From_Ast : constant Z3_ast_array := Subst_To_Z3_ast_array (From);
      To_Ast   : constant Z3_ast_array := Subst_To_Z3_ast_array (To);
   begin
      if From'Length = 0 then
         return Term;
      end if;
      return Expr_Type'(Data    => z3_api_h.Z3_substitute (Term.Context.Data,
                                                           Term.Data,
                                                           From_Ast'Length,
                                                           From_Ast'Address,
                                                           To_Ast'Address),
                        Context => Term.Context);
   end Generic_Substitute;

   ------------------------------------------------------------------------------------------------

   function Substitute_Bool is new Generic_Substitute (Bool_Type, Bool_Array, To_Z3_ast_array_Bool);
   function Substitute (Expr : Expr_Type'Class;
                        From : Bool_Array;
                        To   : Bool_Array) return Expr_Type'Class renames Substitute_Bool;

   ------------------------------------------------------------------------------------------------

   function Substitute_Int is new Generic_Substitute (Int_Type, Int_Array, To_Z3_ast_array_Int);
   function Substitute (Expr : Expr_Type'Class;
                        From : Int_Array;
                        To   : Int_Array) return Expr_Type'Class renames Substitute_Int;

   ------------------------------------------------------------------------------------------------

   overriding
   procedure Initialize (Ctx : in out Context)
   is
   begin
      Ctx.Config        := z3_api_h.Z3_mk_config;
      Ctx.Data          := z3_api_h.Z3_mk_context (Ctx.Config);
      Ctx.Ref_Count     := new Natural;
      Ctx.Ref_Count.all := 1;
   end Initialize;

   overriding
   procedure Finalize (Ctx : in out Context)
   is
      use type z3_api_h.Z3_config;
      procedure Free is new Ada.Unchecked_Deallocation (Natural, Reference_Counter);
   begin
      if Ctx.Ref_Count.all > 0 then
         Ctx.Ref_Count.all := Ctx.Ref_Count.all - 1;
      end if;
      if Ctx.Ref_Count.all > 0 then
         return;
      end if;
      z3_api_h.Z3_del_context (Ctx.Data);
      Ctx.Data := null;
      z3_api_h.Z3_del_config (Ctx.Config);
      Ctx.Config := null;
      Free (Ctx.Ref_Count);
      Ctx.Ref_Count := null;
   end Finalize;

   overriding
   procedure Adjust (Ctx : in out Context)
   is
   begin
      Ctx.Ref_Count.all := Ctx.Ref_Count.all + 1;
   end Adjust;

   ------------------------------------------------------------------------------------------------

   function "not" (Value : Bool_Type) return Bool_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_not (c => Value.Context.Data,
                                             a => Value.Data),
              Context => Value.Context);
   end "not";

   ------------------------------------------------------------------------------------------------

   generic
      with function Z3_mk_multi_op (Context : z3_api_h.Z3_context;
                                    Num     : Interfaces.C.unsigned;
                                    Args    : System.Address) return z3_api_h.Z3_ast;
      type Expr is new Expr_Type with private;
      type Expr_Array is array (Natural range <>) of Expr;
   function Z3_Multi_Op (Terms : Expr_Array) return Expr_Type;

   function Z3_Multi_Op (Terms : Expr_Array) return Expr_Type
   is
      type Z3_Array is array (Terms'Range) of z3_api_h.Z3_ast;
      Args : Z3_Array;
      Ctx  : constant Context := Terms (Terms'First).Context;
   begin
      for I in Terms'Range loop
         Args (I) := Terms (I).Data;
      end loop;

      return (Data    => Z3_mk_multi_op (Context => Ctx.Data,
                                         Num     => Args'Length,
                                         Args    => Args'Address),
              Context => Ctx);
   end Z3_Multi_Op;

   ------------------------------------------------------------------------------------------------

   function Conjunction_Instance is new Z3_Multi_Op (z3_api_h.Z3_mk_and, Bool_Type, Bool_Array);

   function Conjunction (Terms : Bool_Array) return Bool_Type is
      (Bool (Conjunction_Instance (Terms)));

   ------------------------------------------------------------------------------------------------

   function "and" (Left, Right : Bool_Type) return Bool_Type
   is
   begin
      return Conjunction ((Left, Right));
   end "and";

   ------------------------------------------------------------------------------------------------

   function Disjunction_Instance is new Z3_Multi_Op (z3_api_h.Z3_mk_or, Bool_Type, Bool_Array);

   function Disjunction (Terms : Bool_Array) return Bool_Type is
      (Bool (Disjunction_Instance (Terms)));

   ------------------------------------------------------------------------------------------------

   function "or" (Left, Right : Bool_Type) return Bool_Type
   is
   begin
      return Disjunction ((Left, Right));
   end "or";

   ------------------------------------------------------------------------------------------------

   function Int (Name : String; Context : Z3.Context'Class) return Int_Type
   is
   begin
      return (Data    => Const (Name    => Name,
                                Sort    => z3_api_h.Z3_mk_int_sort (Context.Data),
                                Context => Context.Data),
              Context => Z3.Context (Context));
   end Int;

   ------------------------------------------------------------------------------------------------

   function Int (Value   : Long_Long_Integer;
                 Context : Z3.Context'Class) return Int_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_int64 (c  => Context.Data,
                                               v  => Value,
                                               ty => z3_api_h.Z3_mk_int_sort (Context.Data)),
              Context => Z3.Context (Context));
   end Int;

   ------------------------------------------------------------------------------------------------

   function Int (Expr : Expr_Type'Class) return Int_Type
   is
   begin
      case Sort (Expr) is
         when Sort_Int =>
            return (Data    => Expr.Data,
                    Context => Expr.Context);
         when Sort_Real =>
            return (Data    => z3_api_h.Z3_mk_real2int (c  => Expr.Context.Data,
                                                        t1 => Expr.Data),
                    Context => Expr.Context);
         when others =>  --  GCOV_EXCL_LINE
            raise Z3.Value_Error with "Invalid sort: " & Sort (Expr)'Image;  --  GCOV_EXCL_LINE
      end case;
   end Int;

   ------------------------------------------------------------------------------------------------

   function Int (Value   : Long_Long_Unsigned;
                 Context : Z3.Context'Class) return Int_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_unsigned_int64 (c  => Context.Data,
                                                        v  => Interfaces.C.Extensions.unsigned_long_long (Value),
                                                        ty => z3_api_h.Z3_mk_int_sort (Context.Data)),
              Context => Z3.Context (Context));
   end Int;

   ------------------------------------------------------------------------------------------------

   function Add_Instance is new Z3_Multi_Op (z3_api_h.Z3_mk_add, Int_Type, Int_Array);

   function Add (Values : Int_Array) return Int_Type is
      (Int (Add_Instance (Values)));

   ------------------------------------------------------------------------------------------------

   function "+" (Left : Int_Type; Right : Int_Type) return Int_Type
   is
   begin
      return Add ((Left, Right));
   end "+";

   ------------------------------------------------------------------------------------------------

   function Mul_Instance is new Z3_Multi_Op (z3_api_h.Z3_mk_mul, Int_Type, Int_Array);

   function Mul (Values : Int_Array) return Int_Type is
      (Int (Mul_Instance (Values)));

   ------------------------------------------------------------------------------------------------

   function "*" (Left : Int_Type; Right : Int_Type) return Int_Type
   is
   begin
      return Mul ((Left, Right));
   end "*";

   ------------------------------------------------------------------------------------------------

   function "-" (Left : Int_Type; Right : Int_Type) return Int_Type
   is
      type Int_Array is array (1 .. 2) of z3_api_h.Z3_ast;
      Args : constant Int_Array := (Left.Data, Right.Data);
   begin
      return (Data    => z3_api_h.Z3_mk_sub (c        => Left.Context.Data,
                                             num_args => Args'Length,
                                             args     => Args'Address),
              Context => Left.Context);
   end "-";

   ------------------------------------------------------------------------------------------------

   function "/" (Left : Int_Type; Right : Int_Type) return Int_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_div (c    => Left.Context.Data,
                                             arg1 => Left.Data,
                                             arg2 => Right.Data),
              Context => Left.Context);
   end "/";

   ------------------------------------------------------------------------------------------------

   function "**" (Left : Int_Type; Right : Int_Type) return Real_Type'Class
   is
   begin
      return Real_Type'(Data    => z3_api_h.Z3_mk_power (c    => Left.Context.Data,
                                                         arg1 => Left.Data,
                                                         arg2 => Right.Data),
                        Context => Left.Context);
   end "**";

   ------------------------------------------------------------------------------------------------

   function "mod" (Left : Int_Type; Right : Int_Type) return Int_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_mod (c    => Left.Context.Data,
                                             arg1 => Left.Data,
                                             arg2 => Right.Data),
              Context => Left.Context);
   end "mod";

   ------------------------------------------------------------------------------------------------

   function "-" (Value : Int_Type) return Int_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_unary_minus (c   => Value.Context.Data,
                                                     arg => Value.Data),
              Context => Value.Context);
   end "-";

   ------------------------------------------------------------------------------------------------

   function "<" (Left : Int_Type'Class; Right : Int_Type'Class) return Bool_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_lt (c  => Left.Context.Data,
                                            t1 => Left.Data,
                                            t2 => Right.Data),
              Context => Left.Context);
   end "<";

   ------------------------------------------------------------------------------------------------

   function "<=" (Left : Int_Type'Class; Right : Int_Type'Class) return Bool_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_le (c  => Left.Context.Data,
                                            t1 => Left.Data,
                                            t2 => Right.Data),
              Context => Left.Context);
   end "<=";

   ------------------------------------------------------------------------------------------------

   function ">" (Left : Int_Type'Class; Right : Int_Type'Class) return Bool_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_gt (c  => Left.Context.Data,
                                            t1 => Left.Data,
                                            t2 => Right.Data),
              Context => Left.Context);
   end ">";

   ------------------------------------------------------------------------------------------------

   function ">=" (Left : Int_Type'Class; Right : Int_Type'Class) return Bool_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_ge (c  => Left.Context.Data,
                                            t1 => Left.Data,
                                            t2 => Right.Data),
              Context => Left.Context);
   end ">=";

   ------------------------------------------------------------------------------------------------

   overriding
   procedure Initialize (Solv : in out Solver)
   is
      use type z3_api_h.Z3_solver;
   begin
      if Solv.Data /= null then
         z3_api_h.Z3_solver_inc_ref (c => Solv.Context.Data,
                                     s => Solv.Data);
      end if;
   end Initialize;

   overriding
   procedure Adjust (Solv : in out Solver)
   is
   begin
      z3_api_h.Z3_solver_inc_ref (c => Solv.Context.Data,
                                  s => Solv.Data);
   end Adjust;

   overriding
   procedure Finalize (Solv : in out Solver)
   is
   begin
      z3_api_h.Z3_solver_dec_ref (c => Solv.Context.Data,
                                  s => Solv.Data);
   end Finalize;

   function Create (Context : Z3.Context'Class) return Solver
   is
      Solver : constant Z3.Solver :=
         Z3.Solver'(Ada.Finalization.Controlled with Data    => z3_api_h.Z3_mk_solver (Context.Data),
                                                     Context => Z3.Context (Context));
   begin
      z3_api_h.Z3_solver_inc_ref (c => Solver.Context.Data,
                                  s => Solver.Data);
      return Solver;
   end Create;

   ------------------------------------------------------------------------------------------------

   function Create (Context : Z3.Context'Class;
                    Logic   : Solver_Logic) return Solver
   is
      Z3_Logic : constant z3_api_h.Z3_symbol :=
         z3_api_h.Z3_mk_string_symbol (Context.Data, z3_api_h.Z3_string (Logic));
      Solver : constant Z3.Solver :=
         Z3.Solver'(Ada.Finalization.Controlled with Data    => z3_api_h.Z3_mk_solver_for_logic
                                                                   (Context.Data, Z3_Logic),
                                                     Context => Z3.Context (Context));
   begin
      z3_api_h.Z3_solver_inc_ref (c => Solver.Context.Data,
                                  s => Solver.Data);
      return Solver;
   end Create;

   ------------------------------------------------------------------------------------------------

   procedure Assert (Solver  : in out Z3.Solver;
                     Fact    :        Bool_Type'Class)
   is
   begin
      z3_api_h.Z3_solver_assert (c => Solver.Context.Data,
                                 s => Solver.Data,
                                 a => Fact.Data);
   end Assert;

   ------------------------------------------------------------------------------------------------

   function Check (Solver  : Z3.Solver) return Result
   is
   begin
      return Convert_Bool (z3_api_h.Z3_solver_check (c => Solver.Context.Data, s => Solver.Data));
   end Check;

   ------------------------------------------------------------------------------------------------

   procedure Reset (Solver  : in out Z3.Solver)
   is
   begin
      z3_api_h.Z3_solver_reset (c => Solver.Context.Data, s => Solver.Data);
   end Reset;

   ------------------------------------------------------------------------------------------------

   function Same_Context (Left, Right : Expr_Type'Class) return Boolean
   is
   begin
      return Left.Context = Right.Context;
   end Same_Context;

   ------------------------------------------------------------------------------------------------

   generic
      type Expr is new Expr_Type with private;
      type Expr_Array is array (Natural range <>) of Expr;
   function Generic_Same_Context (Terms : Expr_Array) return Boolean;

   function Generic_Same_Context (Terms : Expr_Array) return Boolean
   is
      First : Expr;
   begin
      if Terms'Length <= 1 then
         return True;
      end if;
      First := Terms (Terms'First);
      return (for all T of Terms (Terms'First + 1 .. Terms'Last) => Same_Context (T, First));
   end Generic_Same_Context;

   ------------------------------------------------------------------------------------------------

   function Same_Context_Bool is new Generic_Same_Context (Bool_Type, Bool_Array);
   function Same_Context (Terms : Bool_Array) return Boolean renames Same_Context_Bool;

   ------------------------------------------------------------------------------------------------

   function Same_Context_Int is new Generic_Same_Context (Int_Type, Int_Array);
   function Same_Context (Values : Int_Array) return Boolean renames Same_Context_Int;

   ------------------------------------------------------------------------------------------------

   function "+" (Value : Expr_Type) return String
   is
   begin
      return ICS.Value (chars_ptr (z3_api_h.Z3_ast_to_string (c => Value.Context.Data,
                                                              a => Value.Data)));
   end "+";

   ------------------------------------------------------------------------------------------------

   function Value (Data : Int_Type) return Long_Long_Integer
   is
      Success : z3_api_h.Z3_bool;
      Result  : aliased Long_Long_Integer;
      use type Interfaces.C.Extensions.bool;
   begin
      Success := z3_api_h.Z3_get_numeral_int64 (c => Data.Context.Data,
                                                v => Data.Data,
                                                i => Result'Access);
      if not Success then
         raise Z3.Value_Error;
      end if;
      return Result;
   end Value;

   ------------------------------------------------------------------------------------------------

   function Value (Data : Int_Type) return Long_Long_Unsigned
   is
      Success : z3_api_h.Z3_bool;
      Result  : aliased Interfaces.C.Extensions.unsigned_long_long;
      use type Interfaces.C.Extensions.bool;
   begin
      Success := z3_api_h.Z3_get_numeral_uint64 (c => Data.Context.Data,
                                                 v => Data.Data,
                                                 u => Result'Access);
      if not Success then
         raise Z3.Value_Error;
      end if;
      return Long_Long_Unsigned (Result);
   end Value;

   ------------------------------------------------------------------------------------------------

   function Terms (Value : Expr_Type) return Natural
   is
   begin
      if z3_api_h.Z3_get_ast_kind (Value.Context.Data, Value.Data) = 1 then
         return Natural (z3_api_h.Z3_get_app_num_args (Value.Context.Data,
                                                       z3_api_h.Z3_to_app (Value.Context.Data,
                                                                           Value.Data)));
      else
         return 0;
      end if;
   end Terms;

   ------------------------------------------------------------------------------------------------

   function Term (Value : Expr_Type;
                  Index : Natural) return Expr_Type'Class
   is
   begin
      if Index >= Terms (Value) then
         raise Z3.Value_Error;
      end if;
      return Expr_Type'(Context => Value.Context,
                        Data    => z3_api_h.Z3_get_app_arg (Value.Context.Data,
                                                            z3_api_h.Z3_to_app (Value.Context.Data, Value.Data),
                                                            Interfaces.C.unsigned (Index)));
   end Term;

   ------------------------------------------------------------------------------------------------

   function Kind (Value : Expr_Type) return Expr_Kind
   is
      Ctx       : constant z3_api_h.Z3_context := Value.Context.Data;
      Decl_Kind : z3_api_h.Z3_decl_kind;
   begin
      case z3_api_h.Z3_get_ast_kind (Ctx, Value.Data) is
         when 0 =>
            return Kind_Constant;
         when 1 =>
            Decl_Kind := z3_api_h.Z3_get_decl_kind
                            (Ctx, z3_api_h.Z3_get_app_decl (Ctx, z3_api_h.Z3_to_app (Ctx, Value.Data)));
            case Decl_Kind is
               when z3_api_h.Z3_OP_TRUE          => return Kind_Constant;
               when z3_api_h.Z3_OP_FALSE         => return Kind_Constant;
               when z3_api_h.Z3_OP_EQ            => return Kind_Equal;
               when z3_api_h.Z3_OP_AND           => return Kind_And;
               when z3_api_h.Z3_OP_OR            => return Kind_Or;
               when z3_api_h.Z3_OP_NOT           => return Kind_Not;
               when z3_api_h.Z3_OP_LE            => return Kind_Less_Equal;
               when z3_api_h.Z3_OP_SLEQ          => return Kind_Less_Equal;
               when z3_api_h.Z3_OP_GE            => return Kind_Greater_Equal;
               when z3_api_h.Z3_OP_SGEQ          => return Kind_Greater_Equal;
               when z3_api_h.Z3_OP_LT            => return Kind_Less_Than;
               when z3_api_h.Z3_OP_SLT           => return Kind_Less_Than;
               when z3_api_h.Z3_OP_GT            => return Kind_Greater_Than;
               when z3_api_h.Z3_OP_SGT           => return Kind_Greater_Than;
               when z3_api_h.Z3_OP_ADD           => return Kind_Add;
               when z3_api_h.Z3_OP_BADD          => return Kind_Add;
               when z3_api_h.Z3_OP_SUB           => return Kind_Sub;
               when z3_api_h.Z3_OP_BSUB          => return Kind_Sub;
               when z3_api_h.Z3_OP_MUL           => return Kind_Mul;
               when z3_api_h.Z3_OP_BMUL          => return Kind_Mul;
               when z3_api_h.Z3_OP_IDIV          => return Kind_Div;
               when z3_api_h.Z3_OP_BSDIV         => return Kind_Div;
               when z3_api_h.Z3_OP_MOD           => return Kind_Mod;
               when z3_api_h.Z3_OP_BSMOD         => return Kind_Mod;
               when z3_api_h.Z3_OP_POWER         => return Kind_Power;
               when z3_api_h.Z3_OP_UNINTERPRETED => return Kind_Var;
               when others                       => return Kind_Any;  --  GCOV_EXCL_LINE
            end case;
         when others =>  --  GCOV_EXCL_LINE
            return Kind_Any;  --  GCOV_EXCL_LINE
      end case;
   end Kind;

   ------------------------------------------------------------------------------------------------

   function Sort (Value : Expr_Type) return Expr_Sort
   is
      Ctx : constant z3_api_h.Z3_context := Value.Context.Data;
   begin
      case z3_api_h.Z3_get_sort_kind (Ctx, z3_api_h.Z3_get_sort (Ctx, Value.Data)) is
         when z3_api_h.Z3_BOOL_SORT => return Sort_Bool;
         when z3_api_h.Z3_INT_SORT  => return Sort_Int;
         when z3_api_h.Z3_REAL_SORT => return Sort_Real;
         when z3_api_h.Z3_BV_SORT   => return Sort_Bit_Vector;
         when others                => return Sort_Unknown;  --  GCOV_EXCL_LINE
      end case;
   end Sort;

   ------------------------------------------------------------------------------------------------

   overriding
   function "=" (Left, Right : Expr_Type) return Boolean
   is
   begin
      return Boolean (z3_api_h.Z3_is_eq_ast (Left.Context.Data, Left.Data, Right.Data));
   end "=";

   ------------------------------------------------------------------------------------------------

   function Create (Context : Z3.Context'Class) return Optimize
   is
      Opt : constant z3_api_h.Z3_optimize := z3_optimization_h.Z3_mk_optimize (Context.Data);
   begin
      --  ISSUE: Componolit/AZ3#9
      z3_optimization_h.Z3_optimize_inc_ref (Context.Data, Opt);
      z3_optimization_h.Z3_optimize_push (Context.Data, Opt);
      return Optimize'(Ada.Finalization.Controlled with Data               => Opt,
                                                        Context            => Z3.Context (Context),
                                                        Objectives         => Int_Maps.Empty_Map,
                                                        Backtracking_Count => 0);
   end Create;

   overriding
   procedure Initialize (Opt : in out Optimize)
   is
      use type z3_api_h.Z3_optimize;
   begin
      if Opt.Data /= null then
         z3_optimization_h.Z3_optimize_inc_ref (Opt.Context.Data, Opt.Data);
      end if;
   end Initialize;

   overriding
   procedure Adjust (Opt : in out Optimize)
   is
   begin
      z3_optimization_h.Z3_optimize_inc_ref (Opt.Context.Data, Opt.Data);
   end Adjust;

   overriding
   procedure Finalize (Opt : in out Optimize)
   is
   begin
      z3_optimization_h.Z3_optimize_inc_ref (Opt.Context.Data, Opt.Data);
   end Finalize;

   function "+" (Optimize : Z3.Optimize) return String
   is
   begin
      return ICS.Value (chars_ptr (z3_optimization_h.Z3_optimize_to_string (c => Optimize.Context.Data,
                                                                            o => Optimize.Data)));
   end "+";

   ------------------------------------------------------------------------------------------------

   procedure Set_Timeout (Optimize : in out Z3.Optimize;
                          Timeout  :        Natural := 1000)
   is
      Param_Name : chars_ptr                   := New_String ("timeout");
      Params     : constant z3_api_h.Z3_params := z3_api_h.Z3_mk_params (Optimize.Context.Data);
   begin
      z3_api_h.Z3_params_set_uint
         (Optimize.Context.Data,
          Params,
          z3_api_h.Z3_mk_string_symbol (Optimize.Context.Data, z3_api_h.Z3_string (Param_Name)),
          Interfaces.C.unsigned (Timeout));
      z3_optimization_h.Z3_optimize_set_params (Optimize.Context.Data, Optimize.Data, Params);
      Free (Param_Name);
   end Set_Timeout;

   ------------------------------------------------------------------------------------------------

   function Same_Context (Optimize : Z3.Optimize;
                          Term     : Z3.Expr_Type'Class) return Boolean is
      (Optimize.Context.Data = Term.Context.Data);

   ------------------------------------------------------------------------------------------------

   procedure Assert (Optimize : in out Z3.Optimize;
                     Fact     :        Bool_Type'Class)
   is
   begin
      z3_optimization_h.Z3_optimize_assert (Optimize.Context.Data, Optimize.Data, Fact.Data);
   end Assert;

   ------------------------------------------------------------------------------------------------

   generic
      with function Z3_optimize_op (Context : z3_api_h.Z3_context;
                                    Opt     : z3_api_h.Z3_optimize;
                                    Term    : z3_api_h.Z3_ast) return Interfaces.C.unsigned;
   procedure Generic_Optimize (Optimize : in out Z3.Optimize;
                               Term     :        Z3.Arith_Type'Class);

   procedure Generic_Optimize (Optimize : in out Z3.Optimize;
                               Term     :        Z3.Arith_Type'Class)
   is
      Index : Interfaces.C.unsigned;
   begin
      Index := Z3_optimize_op (Optimize.Context.Data, Optimize.Data, Term.Data);
      Optimize.Objectives.Insert (Term, (Index, Optimize.Backtracking_Count));
   end Generic_Optimize;

   ------------------------------------------------------------------------------------------------

   procedure Minimize_Instance is new Generic_Optimize (z3_optimization_h.Z3_optimize_minimize);

   procedure Minimize (Optimize : in out Z3.Optimize;
                       Term     :        Z3.Arith_Type'Class) renames Minimize_Instance;

   ------------------------------------------------------------------------------------------------

   procedure Maximize_Instance is new Generic_Optimize (z3_optimization_h.Z3_optimize_maximize);

   procedure Maximize (Optimize : in out Z3.Optimize;
                       Term     :        Z3.Arith_Type'Class) renames Maximize_Instance;

   ------------------------------------------------------------------------------------------------

   procedure Check (Optimize : in out Z3.Optimize;
                    Result   :    out Z3.Result)
   is
   begin
      Result := Convert_Bool (z3_optimization_h.Z3_optimize_check
                              (Optimize.Context.Data, Optimize.Data, 0, System.Null_Address));
   end Check;

   ------------------------------------------------------------------------------------------------

   generic
      with function Z3_optimize_get_value (Context : z3_api_h.Z3_context;
                                           Opt     : z3_api_h.Z3_optimize;
                                           Idx     : Interfaces.C.unsigned) return z3_api_h.Z3_ast;
   function Optimize_Get_Value (Optimize  : Z3.Optimize;
                                Objective : Arith_Type'Class) return Int_Type'Class;

   function Optimize_Get_Value (Optimize  : Z3.Optimize;
                                Objective : Arith_Type'Class) return Int_Type'Class is
      (Int_Type'(Data    => Z3_optimize_get_value (Optimize.Context.Data,
                                                   Optimize.Data,
                                                   Optimize.Objectives (Objective).Index),
                 Context => Optimize.Context));

   ------------------------------------------------------------------------------------------------

   function Lower_Instance is new Optimize_Get_Value (z3_optimization_h.Z3_optimize_get_lower);

   function Lower (Optimize  : Z3.Optimize;
                   Objective : Z3.Arith_Type'Class) return Z3.Int_Type'Class renames Lower_Instance;

   ------------------------------------------------------------------------------------------------

   function Upper_Instance is new Optimize_Get_Value (z3_optimization_h.Z3_optimize_get_upper);

   function Upper (Optimize  : Z3.Optimize;
                   Objective : Z3.Arith_Type'Class) return Z3.Int_Type'Class renames Upper_Instance;

   ------------------------------------------------------------------------------------------------

   function Hash (Key : Z3.Arith_Type'Class) return Ada.Containers.Hash_Type is (Ada.Strings.Hash (+Key));

   ------------------------------------------------------------------------------------------------

   procedure Reset (Optimize : in out Z3.Optimize)
   is
   begin
      for I in 0 .. Optimize.Backtracking_Count loop
         z3_optimization_h.Z3_optimize_pop (Optimize.Context.Data, Optimize.Data);
      end loop;
      Optimize.Backtracking_Count := 0;
      z3_optimization_h.Z3_optimize_push (Optimize.Context.Data, Optimize.Data);
      Optimize.Objectives := Int_Maps.Empty_Map;
   end Reset;

   ------------------------------------------------------------------------------------------------

   procedure Push (Optimize : in out Z3.Optimize)
   is
   begin
      z3_optimization_h.Z3_optimize_push (Optimize.Context.Data, Optimize.Data);
      Optimize.Backtracking_Count := Optimize.Backtracking_Count + 1;
   end Push;

   ------------------------------------------------------------------------------------------------

   procedure Pop (Optimize : in out Z3.Optimize)
   is
      Objectives : constant Int_Maps.Map := Optimize.Objectives;
   begin
      if Optimize.Backtracking_Count < 1 then
         raise Z3.Value_Error;
      end if;
      z3_optimization_h.Z3_optimize_pop (Optimize.Context.Data, Optimize.Data);
      Optimize.Backtracking_Count := Optimize.Backtracking_Count - 1;
      for C in Objectives.Iterate loop
         if Int_Maps.Element (C).Backtracking_Point > Optimize.Backtracking_Count then
            Optimize.Objectives.Delete (Int_Maps.Key (C));
         end if;
      end loop;
   end Pop;

   ------------------------------------------------------------------------------------------------

   function Get_Number_Of_Values (Optimize : Z3.Optimize) return Natural is
      (Natural (z3_api_h.Z3_model_get_num_consts (Optimize.Context.Data,
                                                  z3_optimization_h.Z3_optimize_get_model (Optimize.Context.Data,
                                                                                           Optimize.Data))));

   ------------------------------------------------------------------------------------------------

   procedure Get_Values (Optimize  :     Z3.Optimize;
                         Constants : out Int_Array;
                         Values    : out Int_Array)
   is
      Model : constant z3_api_h.Z3_model :=
         z3_optimization_h.Z3_optimize_get_model (Optimize.Context.Data, Optimize.Data);
      Func_Decl : z3_api_h.Z3_func_decl;
   begin
      for I in 0 .. Interfaces.C.unsigned (Constants'Length - 1) loop
         Func_Decl := z3_api_h.Z3_model_get_const_decl (Optimize.Context.Data, Model, I);
         Constants (Constants'First + Natural (I)) :=
            Int_Type'(Data    => z3_api_h.Z3_mk_app (Optimize.Context.Data,
                                                     Func_Decl,
                                                     0,
                                                     System.Null_Address),
                      Context => Optimize.Context);
         Values (Values'First + Natural (I)) :=
            Int_Type'(Data    => z3_api_h.Z3_model_get_const_interp (Optimize.Context.Data,
                                                                     Model,
                                                                     Func_Decl),
                      Context => Optimize.Context);
      end loop;
   end Get_Values;

   ------------------------------------------------------------------------------------------------

   function Term (Pos : Cursor) return Expr_Type'Class is (Pos.Expr.Term (Pos.Index));

   ------------------------------------------------------------------------------------------------

   function Has_Term (Pos : Cursor) return Boolean is (Pos.Index < Pos.Expr.Terms);

   ------------------------------------------------------------------------------------------------

   function Term_Value (Expr : Expr_Type;
                        Pos  : Cursor) return Expr_Type'Class is (Term (Pos));

   ------------------------------------------------------------------------------------------------

   function Iterate (Expr : Expr_Type) return Expr_Iterators.Forward_Iterator'Class is
      (Expr_Iterator'(Expr_Iterators.Forward_Iterator with Expr => Expr));

   ------------------------------------------------------------------------------------------------

   overriding
   function First (Object : Expr_Iterator) return Cursor is (Cursor'(Expr => Object.Expr, Index => 0));

   ------------------------------------------------------------------------------------------------

   overriding
   function Next (Object : Expr_Iterator;
                  Pos    : Cursor) return Cursor is (Cursor'(Expr => Pos.Expr, Index => Pos.Index + 1));

   ------------------------------------------------------------------------------------------------

   function Big_Int (Value   : String;
                     Context : Z3.Context'Class) return Int_Type is (Big_Int (Value, 10, Context));

   ------------------------------------------------------------------------------------------------

   function Big_Int (Value   : String;
                     Base    : Positive;
                     Context : Z3.Context'Class) return Int_Type
   is
      Position : Long_Long_Integer := 0;
      Result   : Int_Type;

      procedure Check_Digit (Digit : Character;
                             Base  : Positive)
      is
      begin
         if
            Digit not in '0' .. '9' | 'a' .. 'f' | 'A' .. 'F'
            or (Digit in '0' .. '9'
                and Base <= 10
                and Base <= Character'Pos (Digit) - Character'Pos ('0'))
            or (Digit in 'A' .. 'F'
                and Base <= 16
                and Base <= Character'Pos (Digit) - Character'Pos ('A'))
            or (Digit in 'a' .. 'f'
                and Base <= 16
                and Base <= Character'Pos (Digit) - Character'Pos ('a'))
         then
            raise Z3.Value_Error with "Invalid character '" & Digit & "' in numeric value";
         end if;
      end Check_Digit;

      function Val (Digit : Character) return Int_Type
      is
      begin
         if Digit >= '0' and Digit <= '9' then
            return Int (Long_Long_Unsigned (Character'Pos (Digit) - Character'Pos ('0')), Context);
         elsif Digit >= 'a' and Digit <= 'f' then
            return Int (Long_Long_Unsigned (Character'Pos (Digit) - Character'Pos ('a') + 10), Context);
         else
            return Int (Long_Long_Unsigned (Character'Pos (Digit) - Character'Pos ('A') + 10), Context);
         end if;
      end Val;
      Underscore_Seen : Boolean := False;
   begin
      for C of reverse Value loop
         if C = '_' then
            if Position = 0 then
               raise Z3.Value_Error with "Leading underscore in " & Value;
            end if;
            if Underscore_Seen then
               raise Z3.Value_Error with "Double underscore in " & Value;
            end if;
         else
            Check_Digit (C, Base);
            if Position = 0 then
               Result := Val (C);
            else
               Result := Result + Int (Int (Long_Long_Unsigned (Base), Context) ** Int (Position, Context)) * Val (C);
            end if;
            Position := Position + 1;
         end if;
         Underscore_Seen := C = '_';
      end loop;
      if Underscore_Seen then
         raise Z3.Value_Error with "Trailing underscore in " & Value;
      end if;
      return Simplified (Result);
   end Big_Int;

   ------------------------------------------------------------------------------------------------

   function Bit_Vector (Name    : String;
                        Size    : Natural;
                        Context : Z3.Context'Class) return Bit_Vector_Type
   is
   begin
      return (Data    => Const (Name    => Name,
                                Sort    => z3_api_h.Z3_mk_bv_sort (Context.Data, Interfaces.C.unsigned (Size)),
                                Context => Context.Data),
              Context => Z3.Context (Context));
   end Bit_Vector;

   ------------------------------------------------------------------------------------------------

   function Bit_Vector (Value   : Long_Long_Unsigned;
                        Size    : Natural;
                        Context : Z3.Context'Class) return Bit_Vector_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_unsigned_int64 (c  => Context.Data,
                                                        v  => Interfaces.C.Extensions.unsigned_long_long (Value),
                                                        ty => z3_api_h.Z3_mk_bv_sort
                                                           (Context.Data, Interfaces.C.unsigned (Size))),
              Context => Z3.Context (Context));
   end Bit_Vector;

   ------------------------------------------------------------------------------------------------

   function Bit_Vector (Value   : Long_Long_Integer;
                        Size    : Natural;
                        Context : Z3.Context'Class) return Bit_Vector_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_int64 (c  => Context.Data,
                                               v  => Value,
                                               ty => z3_api_h.Z3_mk_bv_sort
                                                  (Context.Data, Interfaces.C.unsigned (Size))),
              Context => Z3.Context (Context));
   end Bit_Vector;

   ------------------------------------------------------------------------------------------------

   function Bit_Vector (Value : Int_Type'Class;
                        Size  : Natural) return Bit_Vector_Type
   is
   begin
      return Simplified ((Data    => z3_api_h.Z3_mk_int2bv (c  => Value.Context.Data,
                                                n  => Interfaces.C.unsigned (Size),
                                                t1 => Value.Data),
                          Context => Value.Context));
   end Bit_Vector;

   ------------------------------------------------------------------------------------------------

   function Bit_Vector (Expr : Expr_Type'Class) return Bit_Vector_Type is
      (Data    => Expr.Data,
       Context => Expr.Context);

   ------------------------------------------------------------------------------------------------

   function Same_Context_Bit_Vector is new Generic_Same_Context (Bit_Vector_Type, Bit_Vector_Array);
   function Same_Context (Values : Bit_Vector_Array) return Boolean renames Same_Context_Bit_Vector;

   ------------------------------------------------------------------------------------------------

   function Substitute_Bit_Vector is new Generic_Substitute
      (Bit_Vector_Type, Bit_Vector_Array, To_Z3_ast_array_Bit_Vector);
   function Substitute (Expr : Expr_Type'Class;
                        From : Bit_Vector_Array;
                        To   : Bit_Vector_Array) return Expr_Type'Class renames Substitute_Bit_Vector;

   ------------------------------------------------------------------------------------------------

   function Value (Data : Bit_Vector_Type) return Long_Long_Unsigned
   is
      Success : z3_api_h.Z3_bool;
      Result  : aliased Interfaces.C.Extensions.unsigned_long_long;
      use type Interfaces.C.Extensions.bool;
   begin
      Success := z3_api_h.Z3_get_numeral_uint64 (c => Data.Context.Data,
                                                 v => Data.Data,
                                                 u => Result'Access);
      if not Success then
         raise Z3.Value_Error;
      end if;
      return Long_Long_Unsigned (Result);
   end Value;

   ------------------------------------------------------------------------------------------------

   function Size (Value : Bit_Vector_Type) return Natural
   is
   begin
      return Natural (z3_api_h.Z3_get_bv_sort_size (c => Value.Context.Data,
                                                    t => z3_api_h.Z3_get_sort (c => Value.Context.Data,
                                                                               a => Value.Data)));
   end Size;

   ------------------------------------------------------------------------------------------------

   function Add (Values : Bit_Vector_Array) return Bit_Vector_Type
   is
      Result : Bit_Vector_Type := Values (Values'First);
   begin
      for I in Values'First + 1 .. Values'Last loop
         Result := Result + Values (I);
      end loop;
      return Result;
   end Add;

   ------------------------------------------------------------------------------------------------

   function "+" (Left : Bit_Vector_Type; Right : Bit_Vector_Type) return Bit_Vector_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_bvadd (c  => Left.Context.Data,
                                               t1 => Left.Data,
                                               t2 => Right.Data),
              Context => Left.Context);
   end "+";

   ------------------------------------------------------------------------------------------------

   function "-" (Left : Bit_Vector_Type; Right : Bit_Vector_Type) return Bit_Vector_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_bvsub (c  => Left.Context.Data,
                                               t1 => Left.Data,
                                               t2 => Right.Data),
              Context => Left.Context);
   end "-";

   ------------------------------------------------------------------------------------------------

   function Mul (Values : Bit_Vector_Array) return Bit_Vector_Type
   is
      Result : Bit_Vector_Type := Values (Values'First);
   begin
      for I in Values'First + 1 .. Values'Last loop
         Result := Result * Values (I);
      end loop;
      return Result;
   end Mul;

   ------------------------------------------------------------------------------------------------

   function "*" (Left : Bit_Vector_Type; Right : Bit_Vector_Type) return Bit_Vector_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_bvmul (c  => Left.Context.Data,
                                               t1 => Left.Data,
                                               t2 => Right.Data),
              Context => Left.Context);
   end "*";

   ------------------------------------------------------------------------------------------------

   function "/" (Left : Bit_Vector_Type; Right : Bit_Vector_Type) return Bit_Vector_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_bvsdiv (c  => Left.Context.Data,
                                                t1 => Left.Data,
                                                t2 => Right.Data),
              Context => Left.Context);
   end "/";

   ------------------------------------------------------------------------------------------------

   function "mod" (Left : Bit_Vector_Type; Right : Bit_Vector_Type) return Bit_Vector_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_bvsmod (c  => Left.Context.Data,
                                                t1 => Left.Data,
                                                t2 => Right.Data),
              Context => Left.Context);
   end "mod";

   ------------------------------------------------------------------------------------------------

   function "-" (Value : Bit_Vector_Type) return Bit_Vector_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_bvneg (c  => Value.Context.Data,
                                               t1 => Value.Data),
              Context => Value.Context);
   end "-";

   ------------------------------------------------------------------------------------------------

   function "<" (Left : Bit_Vector_Type'Class; Right : Bit_Vector_Type'Class) return Bool_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_bvslt (c  => Left.Context.Data,
                                               t1 => Left.Data,
                                               t2 => Right.Data),
              Context => Left.Context);
   end "<";

   ------------------------------------------------------------------------------------------------

   function "<=" (Left : Bit_Vector_Type'Class; Right : Bit_Vector_Type'Class) return Bool_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_bvsle (c  => Left.Context.Data,
                                               t1 => Left.Data,
                                               t2 => Right.Data),
              Context => Left.Context);
   end "<=";

   ------------------------------------------------------------------------------------------------

   function ">" (Left : Bit_Vector_Type'Class; Right : Bit_Vector_Type'Class) return Bool_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_bvsgt (c  => Left.Context.Data,
                                               t1 => Left.Data,
                                               t2 => Right.Data),
              Context => Left.Context);
   end ">";

   ------------------------------------------------------------------------------------------------

   function ">=" (Left : Bit_Vector_Type'Class; Right : Bit_Vector_Type'Class) return Bool_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_bvsge (c  => Left.Context.Data,
                                               t1 => Left.Data,
                                               t2 => Right.Data),
              Context => Left.Context);
   end ">=";

   ------------------------------------------------------------------------------------------------

   function Real (Name    : String;
                  Context : Z3.Context'Class) return Real_Type
   is
   begin
      return (Data    => Const (Name    => Name,
                                Sort    => z3_api_h.Z3_mk_real_sort (Context.Data),
                                Context => Context.Data),
              Context => Z3.Context (Context));
   end Real;

   ------------------------------------------------------------------------------------------------

   function Real (Numerator : Integer;
                  Context   : Z3.Context'Class) return Real_Type is (Real (Numerator, 1, Context));

   ------------------------------------------------------------------------------------------------

   function Real (Numerator   : Integer;
                  Denominator : Integer;
                  Context     : Z3.Context'Class) return Real_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_real (c   => Context.Data,
                                              num => Interfaces.C.int (Numerator),
                                              den => Interfaces.C.int (Denominator)),
              Context => Z3.Context (Context));
   end Real;

   ------------------------------------------------------------------------------------------------

   function Real (Expr : Expr_Type'Class) return Real_Type
   is
   begin
      case Sort (Expr) is
         when Sort_Real =>
            return (Data    => Expr.Data,
                    Context => Expr.Context);
         when Sort_Int =>
            return (Data    => z3_api_h.Z3_mk_int2real (c  => Expr.Context.Data,
                                                        t1 => Expr.Data),
                    Context => Expr.Context);
         when others =>  --  GCOV_EXCL_LINE
            raise Z3.Value_Error with "Invalid sort: " & Sort (Expr)'Image;  --  GCOV_EXCL_LINE
      end case;
   end Real;

   ------------------------------------------------------------------------------------------------

   function Is_Int (Value : Real_Type) return Bool_Type'Class
   is
   begin
      return Bool_Type'(Data    => z3_api_h.Z3_mk_is_int (c  => Value.Context.Data,
                                                       t1 => Value.Data),
                        Context => Value.Context);
   end Is_Int;

end Z3;
