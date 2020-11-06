with Interfaces.C.Extensions;
with Interfaces.C.Strings;

package body Z3
is
   use Interfaces.C.Strings;
   package ICS renames Interfaces.C.Strings;

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

   function "=" (Left, Right : Bool_Type) return Bool_Type is (Equal (Left, Right));
   function "/=" (Left, Right : Bool_Type) return Bool_Type is (not Equal (Left, Right));
   function "=" (Left, Right : Int_Type'Class) return Bool_Type is (Equal (Left, Right));
   function "/=" (Left, Right : Int_Type'Class) return Bool_Type is (not Equal (Left, Right));

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

   function New_Context return Context is
      ((Data => z3_api_h.Z3_mk_context (Default_Config.Data)));

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

   function "-" (Left : Int_Type'Class; Right : Int_Type'Class) return Int_Type
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

   function "/" (Left : Int_Type'Class; Right : Int_Type'Class) return Int_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_div (c    => Left.Context.Data,
                                             arg1 => Left.Data,
                                             arg2 => Right.Data),
              Context => Left.Context);
   end "/";

   ------------------------------------------------------------------------------------------------

   function "**" (Left : Int_Type'Class; Right : Int_Type'Class) return Int_Type
   is
   begin
      return (Data    => z3_api_h.Z3_mk_power (c    => Left.Context.Data,
                                               arg1 => Left.Data,
                                               arg2 => Right.Data),
              Context => Left.Context);
   end "**";

   ------------------------------------------------------------------------------------------------

   function "mod" (Left : Int_Type'Class; Right : Int_Type'Class) return Int_Type
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
      use type Interfaces.C.int;
   begin
      Success := z3_api_h.Z3_get_numeral_int64 (c => Data.Context.Data,
                                                v => Data.Data,
                                                i => Result'Access);
      if Success = 0 then
         raise Z3.Value_Error;
      end if;
      return Result;
   end Value;

   ------------------------------------------------------------------------------------------------

   function Value (Data : Int_Type) return Long_Long_Unsigned
   is
      Success : z3_api_h.Z3_bool;
      Result  : aliased Interfaces.C.Extensions.unsigned_long_long;
      use type Interfaces.C.int;
   begin
      Success := z3_api_h.Z3_get_numeral_uint64 (c => Data.Context.Data,
                                                 v => Data.Data,
                                                 u => Result'Access);
      if Success = 0 then
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

end Z3;
