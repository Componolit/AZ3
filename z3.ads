with z3_api_h;
with Ada.Iterator_Interfaces;

private with Ada.Containers;
private with Ada.Containers.Indefinite_Hashed_Maps;
private with Interfaces.C;
private with Interfaces.C.Strings;

package Z3 is  --  GCOV_EXCL_LINE

   Internal_Error : exception;
   Value_Error    : exception;

   type Long_Long_Unsigned is mod 2 ** 64;

   type Context is private;
   type Result is (Result_True, Result_False, Result_Undef);

   type Expr_Kind is (Kind_Any,
                      Kind_Constant,
                      Kind_Var,
                      Kind_Equal,
                      Kind_Greater_Equal,
                      Kind_Greater_Than,
                      Kind_Less_Equal,
                      Kind_Less_Than,
                      Kind_And,
                      Kind_Or,
                      Kind_Not,
                      Kind_Add,
                      Kind_Mul,
                      Kind_Sub,
                      Kind_Div,
                      Kind_Mod,
                      Kind_Power);

   type Expr_Sort is (Sort_Bool, Sort_Int, Sort_Bit_Vector, Sort_Unknown);

   Default_Context : constant Context;
   function New_Context return Context;

   --  Set a global configuration parameter for default context
   procedure Set_Param_Value (ID : String; Value : String);

   type Expr_Type is tagged private with
      Default_Iterator  => Iterate,
      Iterator_Element  => Expr_Type'Class,
      Constant_Indexing => Term_Value;

   function Same_Context (Left, Right : Expr_Type'Class) return Boolean;
   function Simplified (Value : Expr_Type) return Expr_Type;
   function "+" (Value : Expr_Type) return String;
   overriding
   function "=" (Left, Right : Expr_Type) return Boolean with
      Pre => Same_Context (Left, Right);

   function Terms (Value : Expr_Type) return Natural;
   function Term (Value : Expr_Type;
                  Index : Natural) return Expr_Type'Class;
   function Kind (Value : Expr_Type) return Expr_Kind;
   function Sort (Value : Expr_Type) return Expr_Sort;

   type Cursor is private;

   function Has_Term (Pos : Cursor) return Boolean;

   package Expr_Iterators is new Ada.Iterator_Interfaces (Cursor, Has_Term);

   function Iterate (Expr : Expr_Type) return Expr_Iterators.Forward_Iterator'Class;

   function Term (Pos : Cursor) return Expr_Type'Class;

   function Term_Value (Expr : Expr_Type;
                        Pos  : Cursor) return Expr_Type'Class;

   --  Boolean expressions
   type Bool_Type is new Expr_Type with private;
   type Bool_Array is array (Natural range <>) of Bool_Type;

   function Bool (Name : String; Context : Z3.Context := Default_Context) return Bool_Type;
   function Bool (Value : Boolean; Context : Z3.Context := Default_Context) return Bool_Type;
   function Bool (Expr : Expr_Type'Class) return Bool_Type with
      Pre => Sort (Expr) = Sort_Bool;
   function Same_Context (Terms : Bool_Array) return Boolean;
   function Has_Context (Value : Bool_Type; Context : Z3.Context) return Boolean;
   overriding
   function Simplified (Value : Bool_Type) return Bool_Type;

   function Substitute (Expr : Expr_Type'Class;
                        From : Bool_Type;
                        To   : Bool_Type) return Expr_Type'Class with
      Pre => Same_Context (Expr, From)
             and then Same_Context (From, To);
   function Substitute (Expr : Expr_Type'Class;
                        From : Bool_Array;
                        To   : Bool_Array) return Expr_Type'Class with
      Pre => From'Length = To'Length
             and then (if
                          From'Length > 0
                       then
                          Same_Context (Expr, From (From'First))
                          and then Same_Context (From & To));

   overriding
   function "&" (Left, Right : Bool_Type) return Bool_Array with
      Pre => Same_Context (Left, Right);

   function "=" (Left, Right : Expr_Type'Class) return Bool_Type with
      Pre => Same_Context (Left, Right);

   function "/=" (Left, Right : Expr_Type'Class) return Bool_Type with
      Pre => Same_Context (Left, Right);

   function "not" (Value : Bool_Type) return Bool_Type;

   function Conjunction (Terms : Bool_Array) return Bool_Type with
      Pre => Same_Context (Terms);

   function "and" (Left, Right : Bool_Type) return Bool_Type with
      Pre => Same_Context (Left, Right);

   function Disjunction (Terms : Bool_Array) return Bool_Type with
      Pre => Same_Context (Terms);

   function "or" (Left, Right : Bool_Type) return Bool_Type with
      Pre => Same_Context (Left, Right);

   type Arith_Type is new Expr_Type with private;

   --  Integer expressions
   type Int_Type is new Arith_Type with private;
   type Int_Array is array (Natural range <>) of Int_Type;

   function Int (Name : String; Context : Z3.Context := Default_Context) return Int_Type;
   function Int (Value   : Long_Long_Integer;
                 Context : Z3.Context := Default_Context) return Int_Type;
   function Int (Value   : Long_Long_Unsigned;
                 Context : Z3.Context := Default_Context) return Int_Type;
   function Int (Expr : Expr_Type'Class) return Int_Type with
      Pre => Sort (Expr) = Sort_Int;

   function Big_Int (Value   : String;
                     Base    : Positive   := 10;
                     Context : Z3.Context := Default_Context) return Int_Type with
      Pre => Base >= 2 and Base <= 16;

   function Same_Context (Values : Int_Array) return Boolean;
   overriding
   function Simplified (Value : Int_Type) return Int_Type;

   function Substitute (Expr : Expr_Type'Class;
                        From : Int_Type;
                        To   : Int_Type) return Expr_Type'Class with
      Pre => Same_Context (Expr, From)
             and then Same_Context (From, To);
   function Substitute (Expr : Expr_Type'Class;
                        From : Int_Array;
                        To   : Int_Array) return Expr_Type'Class with
      Pre => From'Length = To'Length
             and then (if
                          From'Length > 0
                       then
                          Same_Context (Expr, From (From'First))
                          and then Same_Context (From & To));

   function Value (Data : Int_Type) return Long_Long_Integer;

   function Value (Data : Int_Type) return Long_Long_Unsigned;

   overriding
   function "&" (Left, Right : Int_Type) return Int_Array with
      Pre => Same_Context (Left, Right);

   function Add (Values : Int_Array) return Int_Type with
      Pre => Same_Context (Values);

   function "+" (Left : Int_Type; Right : Int_Type) return Int_Type with
      Pre => Same_Context (Left, Right);

   function "-" (Left : Int_Type; Right : Int_Type) return Int_Type with
      Pre => Same_Context (Left, Right);

   function Mul (Values : Int_Array) return Int_Type with
      Pre => Same_Context (Values);

   function "*" (Left : Int_Type; Right : Int_Type) return Int_Type with
      Pre => Same_Context (Left, Right);

   function "/" (Left : Int_Type; Right : Int_Type) return Int_Type with
      Pre => Same_Context (Left, Right);

   function "**" (Left : Int_Type; Right : Int_Type) return Int_Type with
      Pre => Same_Context (Left, Right);

   function "mod" (Left : Int_Type; Right : Int_Type) return Int_Type with
      Pre => Same_Context (Left, Right);

   function "-" (Value : Int_Type) return Int_Type;

   function "<" (Left : Int_Type'Class; Right : Int_Type'Class) return Bool_Type with
      Pre => Same_Context (Left, Right);

   function "<=" (Left : Int_Type'Class; Right : Int_Type'Class) return Bool_Type with
      Pre => Same_Context (Left, Right);

   function ">" (Left : Int_Type'Class; Right : Int_Type'Class) return Bool_Type with
      Pre => Same_Context (Left, Right);

   function ">=" (Left : Int_Type'Class; Right : Int_Type'Class) return Bool_Type with
      Pre => Same_Context (Left, Right);

   type Bit_Vector_Type is new Arith_Type with private;
   type Bit_Vector_Array is array (Natural range <>) of Bit_Vector_Type;

   function Bit_Vector (Name    : String;
                        Size    : Natural;
                        Context : Z3.Context := Default_Context) return Bit_Vector_Type;

   function Bit_Vector (Value   : Long_Long_Unsigned;
                        Size    : Natural;
                        Context : Z3.Context := Default_Context) return Bit_Vector_Type with
      Pre => Size > Value'Size;

   function Bit_Vector (Value   : Long_Long_Integer;
                        Size    : Natural;
                        Context : Z3.Context := Default_Context) return Bit_Vector_Type with
      Pre => Size >= Value'Size;

   function Bit_Vector (Value : Int_Type'Class;
                        Size  : Natural) return Bit_Vector_Type;

   function Bit_Vector (Expr : Expr_Type'Class) return Bit_Vector_Type with
      Pre => Sort (Expr) = Sort_Bit_Vector;

   function Same_Context (Values : Bit_Vector_Array) return Boolean;

   overriding
   function Simplified (Value : Bit_Vector_Type) return Bit_Vector_Type;

   function Substitute (Expr : Expr_Type'Class;
                        From : Bit_Vector_Type;
                        To   : Bit_Vector_Type) return Expr_Type'Class with
      Pre => Same_Context (Expr, From)
             and then Same_Context (From, To);

   function Substitute (Expr : Expr_Type'Class;
                        From : Bit_Vector_Array;
                        To   : Bit_Vector_Array) return Expr_Type'Class with
      Pre => From'Length = To'Length
             and then (if
                          From'Length > 0
                       then
                          Same_Context (Expr, From (From'First))
                          and then Same_Context (From & To));

   function Value (Data : Bit_Vector_Type) return Long_Long_Unsigned;

   function Size (Value : Bit_Vector_Type) return Natural;

   overriding
   function "&" (Left, Right : Bit_Vector_Type) return Bit_Vector_Array with
      Pre => Same_Context (Left, Right);

   function Add (Values : Bit_Vector_Array) return Bit_Vector_Type with
      Pre => Values'Length > 0
             and then Same_Context (Values);

   function "+" (Left : Bit_Vector_Type; Right : Bit_Vector_Type) return Bit_Vector_Type with
      Pre  => Same_Context (Left, Right)
              and Size (Left) = Size (Right),
      Post => Size ("+"'Result) = Size (Left);

   function "-" (Left : Bit_Vector_Type; Right : Bit_Vector_Type) return Bit_Vector_Type with
      Pre  => Same_Context (Left, Right)
              and Size (Left) = Size (Right),
      Post => Size ("-"'Result) = Size (Left);

   function Mul (Values : Bit_Vector_Array) return Bit_Vector_Type with
      Pre => Values'Length > 0
             and then Same_Context (Values);

   function "*" (Left : Bit_Vector_Type; Right : Bit_Vector_Type) return Bit_Vector_Type with
      Pre  => Same_Context (Left, Right)
              and Size (Left) = Size (Right),
      Post => Size ("*"'Result) = Size (Left);

   function "/" (Left : Bit_Vector_Type; Right : Bit_Vector_Type) return Bit_Vector_Type with
      Pre  => Same_Context (Left, Right)
              and Size (Left) = Size (Right),
      Post => Size ("/"'Result) = Size (Left);

   function "mod" (Left : Bit_Vector_Type; Right : Bit_Vector_Type) return Bit_Vector_Type with
      Pre  => Same_Context (Left, Right)
              and Size (Left) = Size (Right),
      Post => Size ("mod"'Result) = Size (Left);

   function "-" (Value : Bit_Vector_Type) return Bit_Vector_Type with
      Post => Size ("-"'Result) = Size (Value);

   function "<" (Left : Bit_Vector_Type'Class; Right : Bit_Vector_Type'Class) return Bool_Type with
      Pre  => Same_Context (Left, Right)
              and Size (Left) = Size (Right);

   function "<=" (Left : Bit_Vector_Type'Class; Right : Bit_Vector_Type'Class) return Bool_Type with
      Pre  => Same_Context (Left, Right)
              and Size (Left) = Size (Right);

   function ">" (Left : Bit_Vector_Type'Class; Right : Bit_Vector_Type'Class) return Bool_Type with
      Pre  => Same_Context (Left, Right)
              and Size (Left) = Size (Right);

   function ">=" (Left : Bit_Vector_Type'Class; Right : Bit_Vector_Type'Class) return Bool_Type with
      Pre  => Same_Context (Left, Right)
              and Size (Left) = Size (Right);

   --  Solver
   type Solver is tagged limited private;

   type Solver_Logic is private;

   Logic_AUFLIA    : constant Solver_Logic;
   Logic_AUFLIRA   : constant Solver_Logic;
   Logic_AUFNIRA   : constant Solver_Logic;
   Logic_LRA       : constant Solver_Logic;
   Logic_QF_ABV    : constant Solver_Logic;
   Logic_QF_AUFBV  : constant Solver_Logic;
   Logic_QF_UFBV   : constant Solver_Logic;
   Logic_QF_DT     : constant Solver_Logic;
   Logic_QF_AUFLIA : constant Solver_Logic;
   Logic_QF_AX     : constant Solver_Logic;
   Logic_QF_BV     : constant Solver_Logic;
   Logic_QF_IDL    : constant Solver_Logic;
   Logic_QF_RDL    : constant Solver_Logic;
   Logic_QF_LIA    : constant Solver_Logic;
   Logic_QF_LRA    : constant Solver_Logic;
   Logic_QF_NIA    : constant Solver_Logic;
   Logic_QF_NRA    : constant Solver_Logic;
   Logic_QF_UF     : constant Solver_Logic;
   Logic_QF_UFIDL  : constant Solver_Logic;
   Logic_QF_UFLIA  : constant Solver_Logic;
   Logic_QF_UFLRA  : constant Solver_Logic;
   Logic_QF_UFNRA  : constant Solver_Logic;
   Logic_UFLRA     : constant Solver_Logic;
   Logic_UFNIA     : constant Solver_Logic;
   Logic_UFBV      : constant Solver_Logic;
   Logic_QF_S      : constant Solver_Logic;
   Logic_QF_SLIA   : constant Solver_Logic;
   Logic_QF_FD     : constant Solver_Logic;
   Logic_SMTPD     : constant Solver_Logic;

   function Has_Context (Solver  : Z3.Solver;
                         Context : Z3.Context) return Boolean;

   function Create (Context : Z3.Context := Default_Context) return Solver;

   function Create (Logic   : Solver_Logic;
                    Context : Z3.Context := Default_Context) return Solver;

   procedure Assert (Solver  : in out Z3.Solver;
                     Fact    :        Bool_Type'Class;
                     Context :        Z3.Context := Default_Context) with
      Pre => Has_Context (Fact, Context);

   function Check (Solver  : Z3.Solver;
                   Context : Z3.Context := Default_Context) return Result with
      Pre => Has_Context (Solver, Context);

   procedure Reset (Solver  : in out Z3.Solver;
                    Context :        Z3.Context := Default_Context) with
      Pre => Has_Context (Solver, Context);

   type Optimize is tagged limited private;

   function "+" (Optimize : Z3.Optimize) return String;

   function Create (Context : Z3.Context := Default_Context) return Optimize;

   procedure Set_Timeout (Optimize : in out Z3.Optimize;
                          Timeout  :        Natural := 1000);

   function Same_Context (Optimize : Z3.Optimize;
                          Term     : Z3.Expr_Type'Class) return Boolean;

   procedure Assert (Optimize : in out Z3.Optimize;
                     Fact     :        Bool_Type'Class) with
      Pre => Same_Context (Optimize, Fact);

   procedure Minimize (Optimize : in out Z3.Optimize;
                       Term     :        Z3.Arith_Type'Class) with
      Pre => Same_Context (Optimize, Term);

   procedure Maximize (Optimize : in out Z3.Optimize;
                       Term     :        Z3.Arith_Type'Class) with
      Pre => Same_Context (Optimize, Term);

   procedure Check (Optimize : in out Z3.Optimize;
                    Result   :    out Z3.Result);

   function Lower (Optimize  : Z3.Optimize;
                   Objective : Z3.Arith_Type'Class) return Z3.Int_Type'Class;

   function Upper (Optimize  : Z3.Optimize;
                   Objective : Z3.Arith_Type'Class) return Z3.Int_Type'Class;

   procedure Reset (Optimize : in out Z3.Optimize);

   procedure Push (Optimize : in out Z3.Optimize);

   procedure Pop (Optimize : in out Z3.Optimize);

   function Get_Number_Of_Values (Optimize : Z3.Optimize) return Natural;

   procedure Get_Values (Optimize  :     Z3.Optimize;
                         Constants : out Int_Array;
                         Values    : out Int_Array) with
      Pre => Constants'Length = Get_Number_Of_Values (Optimize)
             and then Values'Length = Get_Number_Of_Values (Optimize);

private

   type Config is
      record
         Data : z3_api_h.Z3_config;
      end record;

   type Context is
      record
         Data : z3_api_h.Z3_context;
      end record;

   type Expr_Type is tagged
      record
         Data    : z3_api_h.Z3_ast;
         Context : Z3.Context;
      end record;

   type Bool_Type is new Expr_Type with null record;

   type Arith_Type is new Expr_Type with null record;

   type Int_Type is new Arith_Type with null record;

   type Bit_Vector_Type is new Arith_Type with null record;

   type Solver is tagged limited
      record
         Data : z3_api_h.Z3_solver;
         Context : Z3.Context;
      end record;

   package ICS renames Interfaces.C.Strings;

   type Solver_Logic is new ICS.chars_ptr;

   --  See z3/src/cmd_context/check_logic.cpp:set_logic
   Logic_AUFLIA    : constant Solver_Logic := Solver_Logic (ICS.New_String ("AUFLIA"));
   Logic_AUFLIRA   : constant Solver_Logic := Solver_Logic (ICS.New_String ("AUFLIRA"));
   Logic_AUFNIRA   : constant Solver_Logic := Solver_Logic (ICS.New_String ("AUFNIRA"));
   Logic_LRA       : constant Solver_Logic := Solver_Logic (ICS.New_String ("LRA"));
   Logic_QF_ABV    : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_ABV"));
   Logic_QF_AUFBV  : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_AUFBV"));
   Logic_QF_UFBV   : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_UFBV"));
   Logic_QF_DT     : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_DT"));
   Logic_QF_AUFLIA : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_AUFLIA"));
   Logic_QF_AX     : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_AX"));
   Logic_QF_BV     : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_BV"));
   Logic_QF_IDL    : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_IDL"));
   Logic_QF_RDL    : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_RDL"));
   Logic_QF_LIA    : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_LIA"));
   Logic_QF_LRA    : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_LRA"));
   Logic_QF_NIA    : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_NIA"));
   Logic_QF_NRA    : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_NRA"));
   Logic_QF_UF     : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_UF"));
   Logic_QF_UFIDL  : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_UFIDL"));
   Logic_QF_UFLIA  : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_UFLIA"));
   Logic_QF_UFLRA  : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_UFLRA"));
   Logic_QF_UFNRA  : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_UFNRA"));
   Logic_UFLRA     : constant Solver_Logic := Solver_Logic (ICS.New_String ("UFLRA"));
   Logic_UFNIA     : constant Solver_Logic := Solver_Logic (ICS.New_String ("UFNIA"));
   Logic_UFBV      : constant Solver_Logic := Solver_Logic (ICS.New_String ("UFBV"));
   Logic_QF_S      : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_S"));
   Logic_QF_SLIA   : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_SLIA"));
   Logic_QF_FD     : constant Solver_Logic := Solver_Logic (ICS.New_String ("QF_FD"));
   Logic_SMTPD     : constant Solver_Logic := Solver_Logic (ICS.New_String ("SMTFD"));

   type Z3_ast_array is array (Natural range <>) of z3_api_h.Z3_ast;

   function Hash (Key : Z3.Arith_Type'Class) return Ada.Containers.Hash_Type;

   type Objective_Data is record
      Index              : Interfaces.C.unsigned;
      Backtracking_Point : Natural;
   end record;

   use type Interfaces.C.unsigned;
   package Int_Maps is new Ada.Containers.Indefinite_Hashed_Maps
      (Z3.Arith_Type'Class, Objective_Data, Hash, "=");

   type Optimize is tagged limited record
      Data               : z3_api_h.Z3_optimize;
      Context            : Z3.Context;
      Objectives         : Int_Maps.Map;
      Backtracking_Count : Natural;
   end record;

   function To_Z3_ast_array (Value : Bool_Array) return Z3_ast_array with
      Pre  => Same_Context (Value),
      Post => Value'Length = To_Z3_ast_array'Result'Length;
   function To_Z3_ast_array (Value : Int_Array) return Z3_ast_array with
      Pre  => Same_Context (Value),
      Post => Value'Length = To_Z3_ast_array'Result'Length;
   function To_Z3_ast_array (Value : Bit_Vector_Array) return Z3_ast_array with
      Pre  => Same_Context (Value),
      Post => Value'Length = To_Z3_ast_array'Result'Length;

   Default_Config  : Z3.Config := (Data => z3_api_h.Z3_mk_config);
   Default_Context : constant Context := (Data => z3_api_h.Z3_mk_context (Default_Config.Data));

   use type z3_api_h.Z3_context;

   function Has_Context (Value   : Bool_Type;
                         Context : Z3.Context) return Boolean is (Value.Context.Data = Context.Data);
   function Has_Context (Solver  : Z3.Solver;
                         Context : Z3.Context) return Boolean is (Solver.Context.Data = Context.Data);

   overriding
   function Simplified (Value : Bool_Type) return Bool_Type is (Bool (Expr_Type (Value).Simplified));
   overriding
   function Simplified (Value : Int_Type) return Int_Type is (Int (Expr_Type (Value).Simplified));
   overriding
   function Simplified (Value : Bit_Vector_Type) return Bit_Vector_Type is (Bit_Vector (Expr_Type (Value).Simplified));

   function Substitute (Expr : Expr_Type'Class;
                        From : Bool_Type;
                        To   : Bool_Type) return Expr_Type'Class is
      (Substitute (Expr, Bool_Array'(1 => From), Bool_Array'(1 => To)));

   function Substitute (Expr : Expr_Type'Class;
                        From : Int_Type;
                        To   : Int_Type) return Expr_Type'Class is
      (Substitute (Expr, Int_Array'(1 => From), Int_Array'(1 => To)));

   function Substitute (Expr : Expr_Type'Class;
                        From : Bit_Vector_Type;
                        To   : Bit_Vector_Type) return Expr_Type'Class is
      (Substitute (Expr, Bit_Vector_Array'(1 => From), Bit_Vector_Array'(1 => To)));

   overriding
   function "&" (Left, Right : Bool_Type) return Bool_Array is (Bool_Array'(Left, Right));
   overriding
   function "&" (Left, Right : Int_Type) return Int_Array is (Int_Array'(Left, Right));
   overriding
   function "&" (Left, Right : Bit_Vector_Type) return Bit_Vector_Array is (Bit_Vector_Array'(Left, Right));

   type Cursor is record
      Expr  : Expr_Type;
      Index : Natural;
   end record;

   type Expr_Iterator is new Expr_Iterators.Forward_Iterator with record
      Expr : Expr_Type;
   end record;

   overriding
   function First (Object : Expr_Iterator) return Cursor;

   overriding
   function Next (Object : Expr_Iterator;
                  Pos    : Cursor) return Cursor;

end Z3;
