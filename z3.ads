with z3_api_h;

package Z3
is
   Internal_Error : exception;
   Value_Error    : exception;

   type Context is private;
   type Result is (Result_True, Result_False, Result_Undef);

   Default_Context : constant Context;
   function New_Context return Context;

   --  Set a global configuration parameter
   procedure Set_Param_Value (ID : String; Value : String);

   type Expr_Type is tagged private;

   function Same_Context (Left, Right : Expr_Type'Class) return Boolean;
   function Simplified (Value : Expr_Type) return Expr_Type;
   function "+" (Value : Expr_Type) return String;

   --  Boolean expressions
   type Bool_Type is new Expr_Type with private;
   type Bool_Array is array (Natural range <>) of Bool_Type;

   function Bool (Name : String; Context : Z3.Context := Default_Context) return Bool_Type;
   function Bool (Value : Boolean; Context : Z3.Context := Default_Context) return Bool_Type;
   function Bool (Expr : Expr_Type'Class) return Bool_Type;
   function Same_Context (Terms : Bool_Array) return Boolean;
   function Has_Context (Value : Bool_Type; Context : Z3.Context) return Boolean;
   overriding
   function Simplified (Value : Bool_Type) return Bool_Type;

   function "=" (Left, Right : Bool_Type) return Bool_Type with
      Pre => Same_Context (Left, Right);

   function "/=" (Left, Right : Bool_Type) return Bool_Type with
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

   --  Integer expressions
   type Int_Type is new Expr_Type with private;
   type Int_Array is array (Natural range <>) of Int_Type;

   function Int (Name : String; Context : Z3.Context := Default_Context) return Int_Type;
   function Int (Value   : Long_Long_Integer;
                 Context : Z3.Context := Default_Context) return Int_Type;
   function Int (Expr : Expr_Type'Class) return Int_Type;
   function Same_Context (Values : Int_Array) return Boolean;
   overriding
   function Simplified (Value : Int_Type) return Int_Type;

   function Value (Data : Int_Type) return Long_Long_Integer;

   function "=" (Left : Int_Type'Class; Right : Int_Type'Class) return Bool_Type with
      Pre => Same_Context (Left, Right);

   function "/=" (Left : Int_Type'Class; Right : Int_Type'Class) return Bool_Type with
      Pre => Same_Context (Left, Right);

   function Add (Values : Int_Array) return Int_Type with
      Pre => Same_Context (Values);

   function "+" (Left : Int_Type; Right : Int_Type) return Int_Type with
      Pre => Same_Context (Left, Right);

   function "-" (Left : Int_Type'Class; Right : Int_Type'Class) return Int_Type with
      Pre => Same_Context (Left, Right);

   function Mul (Values : Int_Array) return Int_Type with
      Pre => Same_Context (Values);

   function "*" (Left : Int_Type; Right : Int_Type) return Int_Type with
      Pre => Same_Context (Left, Right);

   function "/" (Left : Int_Type'Class; Right : Int_Type'Class) return Int_Type with
      Pre => Same_Context (Left, Right);

   function "**" (Left : Int_Type'Class; Right : Int_Type'Class) return Int_Type with
      Pre => Same_Context (Left, Right);

   function "mod" (Left : Int_Type'Class; Right : Int_Type'Class) return Int_Type with
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

   --  Solver
   type Solver is tagged limited private;

   function Has_Context (Solver  : Z3.Solver;
                         Context : Z3.Context) return Boolean;

   function Create (Context : Z3.Context := Default_Context) return Solver;

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

   type Int_Type is new Expr_Type with null record;

   type Solver is tagged limited
      record
         Data : z3_api_h.Z3_solver;
         Context : Z3.Context;
      end record;

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

end Z3;
