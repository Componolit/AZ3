with Interfaces.C.Extensions;
with Ada.Strings.Hash;
with z3_optimization_h;
with System;

package body Z3
is
   use Interfaces.C.Strings;

   procedure Set_Param_Value (ID : String; Value : String)
   is
      C_ID    : chars_ptr := New_String (ID);
      C_Value : chars_ptr := New_String (Value);
   begin
      z3_api_h.Z3_set_param_value (c           => Default_Config.Data,
                                   param_id    => z3_api_h.Z3_string (C_ID),
                                   param_value => z3_api_h.Z3_string (C_Value));
      Free (C_ID);
      Free (C_Value);
   end Set_Param_Value;

   ------------------------------------------------------------------------------------------------

   function Bool (Name : String; Context : Z3.Context := Default_Context) return Bool_Type
   is
      C_Name : constant chars_ptr := New_String (Name);
      Symbol : constant z3_api_h.Z3_symbol :=
         z3_api_h.Z3_mk_string_symbol (c => Context.Data,
                                       s => z3_api_h.Z3_string (C_Name));
   begin
      return (Data    => z3_api_h.Z3_mk_const (c  => Context.Data,
                                               s  => Symbol,
                                               ty => z3_api_h.Z3_mk_bool_sort (Context.Data)),
              Context => Context);
   end Bool;

   ------------------------------------------------------------------------------------------------

   function Bool (Value : Boolean; Context : Z3.Context := Default_Context) return Bool_Type
   is
   begin
      if Value then
         return (Data    => z3_api_h.Z3_mk_true (Context.Data),
                 Context => Context);
      end if;
      return (Data    => z3_api_h.Z3_mk_false (Context.Data),
              Context => Context);
   end Bool;

   ------------------------------------------------------------------------------------------------

   function Bool (Expr : Expr_Type'Class) return Bool_Type is
      (Data    => Expr.Data,
       Context => Expr.Context);

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

   function Substitute (Expr : Expr_Type'Class;
                        From : Bool_Array;
                        To   : Bool_Array) return Expr_Type'Class
   is
      From_Ast : constant Z3_ast_array := To_Z3_ast_array (From);
      To_Ast   : constant Z3_ast_array := To_Z3_ast_array (To);
   begin
      if From'Length = 0 then
         return Expr;
      end if;
      return Expr_Type'(Data    => z3_api_h.Z3_substitute (Expr.Context.Data,
                                                           Expr.Data,
                                                           From_Ast'Length,
                                                           From_Ast'Address,
                                                           To_Ast'Address),
                        Context => Expr.Context);
   end Substitute;

   ------------------------------------------------------------------------------------------------

   function Substitute (Expr : Expr_Type'Class;
                        From : Int_Array;
                        To   : Int_Array) return Expr_Type'Class
   is
      From_Ast : constant Z3_ast_array := To_Z3_ast_array (From);
      To_Ast   : constant Z3_ast_array := To_Z3_ast_array (To);
   begin
      if From'Length = 0 then
         return Expr;
      end if;
      return Expr_Type'(Data    => z3_api_h.Z3_substitute (Expr.Context.Data,
                                                           Expr.Data,
                                                           From_Ast'Length,
                                                           From_Ast'Address,
                                                           To_Ast'Address),
                        Context => Expr.Context);
   end Substitute;

   ------------------------------------------------------------------------------------------------

   function New_Context return Context is ((Data => z3_api_h.Z3_mk_context (z3_api_h.Z3_mk_config)));

   ------------------------------------------------------------------------------------------------

   function "not" (Value : Bool_Type) return Bool_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_not (c => Value.Context.Data,
                                             a => Value.Data),
              Context => Value.Context);
   end "not";

   ------------------------------------------------------------------------------------------------

   function Conjunction (Terms : Bool_Array) return Bool_Type
   is
      type Z3_Bool_Array is array (Terms'Range) of z3_api_h.Z3_ast;
      Args  : Z3_Bool_Array;
      First : constant Bool_Type := Terms (Terms'First);
   begin
      for I in Terms'Range loop
         Args (I) := Terms (I).Data;
      end loop;

      return (Data    => z3_api_h.Z3_mk_and (c        => First.Context.Data,
                                             num_args => Args'Length,
                                             args     => Args'Address),
              Context => First.Context);
   end Conjunction;

   ------------------------------------------------------------------------------------------------

   function "and" (Left, Right : Bool_Type) return Bool_Type
   is
   begin
      return Conjunction ((Left, Right));
   end "and";

   ------------------------------------------------------------------------------------------------

   function Disjunction (Terms : Bool_Array) return Bool_Type
   is
      type Z3_Bool_Array is array (Terms'Range) of z3_api_h.Z3_ast;
      Args  : Z3_Bool_Array;
      First : constant Bool_Type := Terms (Terms'First);
   begin
      for I in Terms'Range loop
         Args (I) := Terms (I).Data;
      end loop;

      return (Data    => z3_api_h.Z3_mk_or (c        => First.Context.Data,
                                            num_args => Args'Length,
                                            args     => Args'Address),
              Context => First.Context);
   end Disjunction;

   ------------------------------------------------------------------------------------------------

   function "or" (Left, Right : Bool_Type) return Bool_Type
   is
   begin
      return Disjunction ((Left, Right));
   end "or";

   ------------------------------------------------------------------------------------------------

   function Int (Name : String; Context : Z3.Context := Default_Context) return Int_Type
   is
      C_Name : constant chars_ptr := New_String (Name);
      Symbol : constant z3_api_h.Z3_symbol :=
         z3_api_h.Z3_mk_string_symbol (c => Context.Data,
                                       s => z3_api_h.Z3_string (C_Name));
   begin
      return (Data    => z3_api_h.Z3_mk_const (c  => Context.Data,
                                               s  => Symbol,
                                               ty => z3_api_h.Z3_mk_int_sort (Context.Data)),
              Context => Context);
   end Int;

   ------------------------------------------------------------------------------------------------

   function Int (Value   : Long_Long_Integer;
                 Context : Z3.Context := Default_Context) return Int_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_int64 (c  => Context.Data,
                                               v  => Value,
                                               ty => z3_api_h.Z3_mk_int_sort (Context.Data)),
              Context => Context);
   end Int;

   ------------------------------------------------------------------------------------------------

   function Int (Expr : Expr_Type'Class) return Int_Type is
      (Data    => Expr.Data,
       Context => Expr.Context);

   ------------------------------------------------------------------------------------------------

   function Int (Value   : Long_Long_Unsigned;
                 Context : Z3.Context := Default_Context) return Int_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_unsigned_int64 (c  => Context.Data,
                                                        v  => Interfaces.C.Extensions.unsigned_long_long (Value),
                                                        ty => z3_api_h.Z3_mk_int_sort (Context.Data)),
              Context => Context);
   end Int;

   ------------------------------------------------------------------------------------------------

   function Add (Values : Int_Array) return Int_Type
   is
      type Z3_Int_Array is array (Values'Range) of z3_api_h.Z3_ast;
      Args : Z3_Int_Array;
      First : constant Int_Type := Values (Values'First);
   begin
      for I in Values'Range loop
         Args (I) := Values (I).Data;
      end loop;

      return (Data    => z3_api_h.Z3_mk_add (c        => First.Context.Data,
                                             num_args => Args'Length,
                                             args     => Args'Address),
              Context => First.Context);
   end Add;

   ------------------------------------------------------------------------------------------------

   function "+" (Left : Int_Type; Right : Int_Type) return Int_Type
   is
   begin
      return Add ((Left, Right));
   end "+";

   ------------------------------------------------------------------------------------------------

   function Mul (Values : Int_Array) return Int_Type
   is
      type Z3_Int_Array is array (Values'Range) of z3_api_h.Z3_ast;
      Args : Z3_Int_Array;
      First : constant Int_Type := Values (Values'First);
   begin
      for I in Values'Range loop
         Args (I) := Values (I).Data;
      end loop;

      return (Data    => z3_api_h.Z3_mk_mul (c        => First.Context.Data,
                                             num_args => Args'Length,
                                             args     => Args'Address),
              Context => First.Context);
   end Mul;

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

   function "**" (Left : Int_Type; Right : Int_Type) return Int_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_power (c    => Left.Context.Data,
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

   function Create (Context : Z3.Context := Default_Context) return Solver
   is
   begin
      return (Data    => z3_api_h.Z3_mk_solver (Context.Data),
              Context => Context);
   end Create;

   ------------------------------------------------------------------------------------------------

   function Create (Logic   : Solver_Logic;
                    Context : Z3.Context := Default_Context) return Solver
   is
   begin
      return (Data    => z3_api_h.Z3_mk_solver_for_logic
                           (Context.Data,
                            z3_api_h.Z3_mk_string_symbol (Context.Data, z3_api_h.Z3_string (Logic))),
              Context => Context);
   end Create;

   ------------------------------------------------------------------------------------------------

   procedure Assert (Solver  : in out Z3.Solver;
                     Fact    :        Bool_Type'Class;
                     Context :        Z3.Context := Default_Context)
   is
   begin
      z3_api_h.Z3_solver_assert (c => Context.Data,
                                 s => Solver.Data,
                                 a => Fact.Data);
   end Assert;

   ------------------------------------------------------------------------------------------------

   function Check (Solver  : Z3.Solver;
                   Context : Z3.Context := Default_Context) return Result
   is
      Check_Result : z3_api_h.Z3_lbool;
   begin
      Check_Result := z3_api_h.Z3_solver_check (c => Context.Data, s => Solver.Data);
      case Check_Result is
         when z3_api_h.Z3_L_FALSE => return Result_False;
         when z3_api_h.Z3_L_TRUE  => return Result_True;
         when z3_api_h.Z3_L_UNDEF => return Result_Undef;
         when others => raise Z3.Internal_Error; --  GCOV_EXCL_LINE
      end case;
   end Check;

   ------------------------------------------------------------------------------------------------

   procedure Reset (Solver  : in out Z3.Solver;
                    Context :        Z3.Context := Default_Context)
   is
   begin
      z3_api_h.Z3_solver_reset (c => Context.Data, s => Solver.Data);
   end Reset;

   ------------------------------------------------------------------------------------------------

   function Same_Context (Left, Right : Expr_Type'Class) return Boolean
   is
   begin
      return Left.Context = Right.Context;
   end Same_Context;

   ------------------------------------------------------------------------------------------------

   function Same_Context (Terms : Bool_Array) return Boolean
   is
      First : Bool_Type;
   begin
      if Terms'Length <= 1 then
         return True;
      end if;
      First := Terms (Terms'First);
      return (for all T of Terms (Terms'First + 1 .. Terms'Last) => Same_Context (T, First));
   end Same_Context;

   ------------------------------------------------------------------------------------------------

   function Same_Context (Values : Int_Array) return Boolean
   is
      First : Int_Type;
   begin
      if Values'Length <= 1 then
         return True;
      end if;
      First := Values (Values'First);
      return (for all T of Values (Values'First + 1 .. Values'Last) => Same_Context (T, First));
   end Same_Context;

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

   function To_Z3_ast_array (Value : Bool_Array) return Z3_ast_array
   is
      Result : Z3_ast_array (Value'First .. Value'Last);
   begin
      for I in Value'Range loop
         Result (I) := Value (I).Data;
      end loop;
      return Result;
   end To_Z3_ast_array;

   ------------------------------------------------------------------------------------------------

   function To_Z3_ast_array (Value : Int_Array) return Z3_ast_array
   is
      Result : Z3_ast_array (Value'First .. Value'Last);
   begin
      for I in Value'Range loop
         Result (I) := Value (I).Data;
      end loop;
      return Result;
   end To_Z3_ast_array;

   ------------------------------------------------------------------------------------------------

   function To_Z3_ast_array (Value : Bit_Vector_Array) return Z3_ast_array
   is
      Result : Z3_ast_array (Value'First .. Value'Last);
   begin
      for I in Value'Range loop
         Result (I) := Value (I).Data;
      end loop;
      return Result;
   end To_Z3_ast_array;

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

   function Create (Context : Z3.Context := Default_Context) return Optimize
   is
      Opt : constant z3_api_h.Z3_optimize := z3_optimization_h.Z3_mk_optimize (Context.Data);
   begin
      --  ISSUE: Componolit/AZ3#9
      z3_optimization_h.Z3_optimize_inc_ref (Context.Data, Opt);
      z3_optimization_h.Z3_optimize_push (Context.Data, Opt);
      return Optimize'(Data               => Opt,
                       Context            => Context,
                       Objectives         => Int_Maps.Empty_Map,
                       Backtracking_Count => 0);
   end Create;

   ------------------------------------------------------------------------------------------------

   procedure Set_Timeout (Optimize : in out Z3.Optimize;
                          Timeout  :        Natural := 1000)
   is
      Param_Name : constant chars_ptr := New_String ("timeout");
      Params     : constant z3_api_h.Z3_params := z3_api_h.Z3_mk_params (Optimize.Context.Data);
   begin
      z3_api_h.Z3_params_set_uint
         (Optimize.Context.Data,
          Params,
          z3_api_h.Z3_mk_string_symbol (Optimize.Context.Data, z3_api_h.Z3_string (Param_Name)),
          Interfaces.C.unsigned (Timeout));
      z3_optimization_h.Z3_optimize_set_params (Optimize.Context.Data, Optimize.Data, Params);
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

   procedure Minimize (Optimize : in out Z3.Optimize;
                       Term     :        Z3.Arith_Type'Class)
   is
      Index : Interfaces.C.unsigned;
   begin
      Index := z3_optimization_h.Z3_optimize_minimize (Optimize.Context.Data, Optimize.Data, Term.Data);
      Optimize.Objectives.Insert (Term, (Index, Optimize.Backtracking_Count));
   end Minimize;

   ------------------------------------------------------------------------------------------------

   procedure Maximize (Optimize : in out Z3.Optimize;
                       Term     :        Z3.Arith_Type'Class)
   is
      Index : Interfaces.C.unsigned;
   begin
      Index := z3_optimization_h.Z3_optimize_maximize (Optimize.Context.Data, Optimize.Data, Term.Data);
      Optimize.Objectives.Insert (Term, (Index, Optimize.Backtracking_Count));
   end Maximize;

   ------------------------------------------------------------------------------------------------

   procedure Check (Optimize : in out Z3.Optimize;
                    Result   :    out Z3.Result)
   is
      Check_Result : z3_api_h.Z3_lbool;
   begin
      Check_Result := z3_optimization_h.Z3_optimize_check
         (Optimize.Context.Data, Optimize.Data, 0, System.Null_Address);
      case Check_Result is
         when z3_api_h.Z3_L_FALSE => Result := Result_False;
         when z3_api_h.Z3_L_TRUE  => Result := Result_True;
         when z3_api_h.Z3_L_UNDEF => Result := Result_Undef;
         when others => raise Z3.Internal_Error; --  GCOV_EXCL_LINE
      end case;
   end Check;

   ------------------------------------------------------------------------------------------------

   function Lower (Optimize  : Z3.Optimize;
                   Objective : Z3.Arith_Type'Class) return Z3.Int_Type'Class
   is
   begin
      return Z3.Int_Type'(Data    => z3_optimization_h.Z3_optimize_get_lower (Optimize.Context.Data,
                                                                              Optimize.Data,
                                                                              Optimize.Objectives (Objective).Index),
                          Context => Optimize.Context);
   end Lower;

   ------------------------------------------------------------------------------------------------

   function Upper (Optimize  : Z3.Optimize;
                   Objective : Z3.Arith_Type'Class) return Z3.Int_Type'Class
   is
   begin
      return Z3.Int_Type'(Data    => z3_optimization_h.Z3_optimize_get_upper (Optimize.Context.Data,
                                                                              Optimize.Data,
                                                                              Optimize.Objectives (Objective).Index),
                          Context => Optimize.Context);
   end Upper;

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
                     Base    : Positive   := 10;
                     Context : Z3.Context := Default_Context) return Int_Type
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
            return Int (Long_Long_Unsigned (Character'Pos (Digit) - Character'Pos ('0')));
         elsif Digit >= 'a' and Digit <= 'f' then
            return Int (Long_Long_Unsigned (Character'Pos (Digit) - Character'Pos ('a') + 10));
         else
            return Int (Long_Long_Unsigned (Character'Pos (Digit) - Character'Pos ('A') + 10));
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
               Result := Result + Int (Long_Long_Unsigned (Base)) ** Int (Position) * Val (C);
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
                        Context : Z3.Context := Default_Context) return Bit_Vector_Type
   is
      C_Name : constant chars_ptr := New_String (Name);
      Symbol : constant z3_api_h.Z3_symbol :=
         z3_api_h.Z3_mk_string_symbol (c => Context.Data,
                                       s => z3_api_h.Z3_string (C_Name));
   begin
      return (Data    => z3_api_h.Z3_mk_const (c  => Context.Data,
                                               s  => Symbol,
                                               ty => z3_api_h.Z3_mk_bv_sort
                                                  (Context.Data, Interfaces.C.unsigned (Size))),
              Context => Context);
   end Bit_Vector;

   ------------------------------------------------------------------------------------------------

   function Bit_Vector (Value   : Long_Long_Unsigned;
                        Size    : Natural;
                        Context : Z3.Context := Default_Context) return Bit_Vector_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_unsigned_int64 (c  => Context.Data,
                                                        v  => Interfaces.C.Extensions.unsigned_long_long (Value),
                                                        ty => z3_api_h.Z3_mk_bv_sort
                                                           (Context.Data, Interfaces.C.unsigned (Size))),
              Context => Context);
   end Bit_Vector;

   ------------------------------------------------------------------------------------------------

   function Bit_Vector (Value   : Long_Long_Integer;
                        Size    : Natural;
                        Context : Z3.Context := Default_Context) return Bit_Vector_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_int64 (c  => Context.Data,
                                               v  => Value,
                                               ty => z3_api_h.Z3_mk_bv_sort
                                                  (Context.Data, Interfaces.C.unsigned (Size))),
              Context => Context);
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

   function Same_Context (Values : Bit_Vector_Array) return Boolean
   is
      First : Bit_Vector_Type;
   begin
      if Values'Length <= 1 then
         return True;
      end if;
      First := Values (Values'First);
      return (for all T of Values (Values'First + 1 .. Values'Last) => Same_Context (T, First));
   end Same_Context;

   ------------------------------------------------------------------------------------------------

   function Substitute (Expr : Expr_Type'Class;
                        From : Bit_Vector_Array;
                        To   : Bit_Vector_Array) return Expr_Type'Class
   is
      From_Ast : constant Z3_ast_array := To_Z3_ast_array (From);
      To_Ast   : constant Z3_ast_array := To_Z3_ast_array (To);
   begin
      if From'Length = 0 then
         return Expr;
      end if;
      return Expr_Type'(Data    => z3_api_h.Z3_substitute (Expr.Context.Data,
                                                           Expr.Data,
                                                           From_Ast'Length,
                                                           From_Ast'Address,
                                                           To_Ast'Address),
                        Context => Expr.Context);
   end Substitute;

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

end Z3;
