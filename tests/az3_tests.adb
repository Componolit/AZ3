with Z3;
with AUnit.Assertions;

package body AZ3_Tests is

   use AUnit.Assertions;

   subtype LLI is Long_Long_Integer;
   subtype LLU is Z3.Long_Long_Unsigned;

   function Simp (V : Z3.Bool_Type) return Z3.Bool_Type is
   begin
      return V.Simplified;
   end Simp;

   function Simp (V : Z3.Int_Type) return Z3.Int_Type is
   begin
      return V.Simplified;
   end Simp;

   ---------------------------------------------------------------------------

   procedure Test_Set_Param_Value (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced  (T);
   begin
      Z3.Set_Param_Value ("unsat_core", "true");
      --  We cannot really test anything here - there is not API to read
      --  back parameters or to check a result
   end Test_Set_Param_Value;

   ---------------------------------------------------------------------------

   procedure Test_Booleans (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced  (T);
      use Z3;
      X : constant Bool_Type := Bool ("X");
   begin
      Assert (Simp (Bool (True) = Bool (False)) = Bool (False), "Contradiction not false");
      Assert (Simp (Bool (True) = Bool (True)) = Bool (True), "Tautology not true");
      Assert (Simp (Bool (True) /= Bool (False)) = Bool (True), "true = false");
      Assert (Simp (not Bool (True)) = Bool (False), "not false is not true");
      Assert (Simp (not Bool (False)) = Bool (True), "not true is not false");
      Assert (Simp (not X = X) = Bool (False), "not X = X not false");
      Assert (Simp (X = X) = Bool (True), "X = X not true");
      Assert (Simp (Bool (True) and Bool (False)) = Bool (False), "true and false not false");
      Assert (Simp (X and Bool (False)) = Bool (False), "X and false not false");
      Assert (Simp (X and not X) = Bool (False), "X and not X not false");
      Assert (Simp (Bool (True) or Bool (False)) = Bool (True), "true or false not true");
      Assert (Simp (X or Bool (True)) = Bool (True), "X or true not true");
      Assert (Simp (X or Bool (False)) = X, "X or false not X");
      Assert (Simp (X or not X) = Bool (True), "X or not X not true");
      Assert (Simp (Conjunction ((Bool (True), Bool (False), Bool (True)))) = Bool (False),
              "Conjunction invalid");
      Assert (Simp (Disjunction ((Bool (True), Bool (False), Bool (True)))) = Bool (True),
              "Disjunction invalid");
   end Test_Booleans;

   ---------------------------------------------------------------------------

   procedure Test_Integer (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced  (T);
      use Z3;
   begin
      Assert (Simp (Int (LLI'(1)) = Int (LLI'(1))) = Bool (True), "1 != 1");
      Assert (Simp (Int (LLI'(1)) = Int (LLI'(2))) = Bool (False), "1 == 2");
      Assert (Simp (Int (LLI'(1)) /= Int (LLI'(2))) = Bool (True), "1 == 2");
      Assert (Simp (Int (LLI'(1)) /= Int (LLI'(1))) = Bool (False), "1 != 2");
      Assert (Simp (Int (LLI'(1)) + Int (LLI'(2))) = Int (LLI'(3)), "1 + 2 != 3");
      Assert (Simp (Int (LLI'(1)) + Int (LLI'(2)) + Int (LLI'(3))) = Int (LLI'(6)), "1 + 2 + 3 != 6");
      Assert (Simp (Int (LLI'(1)) + Int (LLI'(2)) + Int (LLI'(3)) /= Int (LLI'(7))) = Bool (True), "1 + 2 + 3 == 7");
      Assert (Simp (Int (LLI'(0)) + Int ("X") = Int ("X")) = Bool (True), "0 + X != X");
      Assert (Simp (Int (LLI'(2)) * Int (LLI'(4)) = Int (LLI'(8))) = Bool (True), "2 * 4 != 8");
      Assert (Simp (Int (LLI'(0)) * Int (LLI'(124)) = Int (LLI'(0))) = Bool (True), "0 * 124 != 0");
      Assert (Simp (Int (LLI'(0)) * Int ("X") = Int (LLI'(0))) = Bool (True), "0 * X != 0");
      Assert (Simp (Int (LLI'(5)) - Int (LLI'(3)) = Int (LLI'(2))) = Bool (True), "5 - 3 != 2");
      Assert (Simp (Int (LLI'(5)) - Int (LLI'(30)) = Int (LLI'(-25))) = Bool (True), "5 - 30 != 25");
      Assert (Simp (Int ("X") - Int (LLI'(0)) = Int ("X")) = Bool (True), "X - 0 != X");
      Assert (Simp (Int (LLI'(6)) / Int (LLI'(2)) = Int (LLI'(3))) = Bool (True), "6 / 2 != 3");
      Assert (Simp (Int (LLI'(0)) / Int (LLI'(15)) = Int (LLI'(0))) = Bool (True), "0 / 15 != 0");
      Assert (Simp (Int (LLI'(10)) / Int (LLI'(3)) = Int (LLI'(3))) = Bool (True), "10 / 3 != 3");
      Assert (Simp (Int (LLI'(16)) mod Int (LLI'(8)) = Int (LLI'(0))) = Bool (True), "16 % 8 != 0");
      Assert (Simp (Int (LLI'(17)) mod Int (LLI'(8)) = Int (LLI'(1))) = Bool (True), "17 % 8 != 1");
      Assert (Simp (-Int (LLI'(5)) + Int (LLI'(5)) = Int (LLI'(0))) = Bool (True), "-5 + 5 != 0");
      Assert (Simp (Int (LLI'(2)) ** Int (LLI'(4)) = Int (LLI'(16))) = Bool (True), "2^4 != 16");
      Assert (Simp (Int (LLI'(2)) ** Int (LLI'(0)) = Int (LLI'(1))) = Bool (True), "2^0 != 1");
      Assert (Simp (Int (LLI'(2)) < Int (LLI'(0))) = Bool (False), "2 < 0 != false");
      Assert (Simp (Int (LLI'(0)) < Int (LLI'(10))) = Bool (True), "0 < 10 != true");
      Assert (Simp (Int (LLI'(2)) <= Int (LLI'(0))) = Bool (False), "2 <= 0 != false");
      Assert (Simp (Int (LLI'(0)) <= Int (LLI'(10))) = Bool (True), "0 <= 10 != true");
      Assert (Simp (Int (LLI'(3)) <= Int (LLI'(3))) = Bool (True), "3 <= 3 != true");
      Assert (Simp (Int (LLI'(0)) > Int (LLI'(2))) = Bool (False), "2 > 0 != false");
      Assert (Simp (Int (LLI'(10)) > Int (LLI'(0))) = Bool (True), "10 > 0 != true");
      Assert (Simp (Int (LLI'(0)) >= Int (LLI'(2))) = Bool (False), "0 >= 2 != false");
      Assert (Simp (Int (LLI'(10)) >= Int (LLI'(0))) = Bool (True), "10 >= 0 != true");
      Assert (Simp (Int (LLI'(3)) >= Int (LLI'(3))) = Bool (True), "3 >= 3 != true");
   end Test_Integer;

   ---------------------------------------------------------------------------

   procedure Test_Unsigned (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use Z3;
   begin
      Assert (Simp (Int (LLU'(1)) = Int (LLU'(1))) = Bool (True), "1 != 1");
      Assert (Simp (Int (LLU'(1)) = Int (LLU'(2))) = Bool (False), "1 == 2");
      Assert (Simp (Int (LLU'(1)) /= Int (LLU'(2))) = Bool (True), "1 == 2");
      Assert (Simp (Int (LLU'(1)) /= Int (LLU'(1))) = Bool (False), "1 != 2");
      Assert (Simp (Int (LLU'(1)) + Int (LLU'(2))) = Int (LLU'(3)), "1 + 2 != 3");
      Assert (Simp (Int (LLU'(1)) + Int (LLU'(2)) + Int (LLU'(3))) = Int (LLU'(6)), "1 + 2 + 3 != 6");
      Assert (Simp (Int (LLU'(1)) + Int (LLU'(2)) + Int (LLU'(3)) /= Int (LLU'(7))) = Bool (True), "1 + 2 + 3 == 7");
      Assert (Simp (Int (LLU'(0)) + Int ("X") = Int ("X")) = Bool (True), "0 + X != X");
      Assert (Simp (Int (LLU'(2)) * Int (LLU'(4)) = Int (LLU'(8))) = Bool (True), "2 * 4 != 8");
      Assert (Simp (Int (LLU'(0)) * Int (LLU'(124)) = Int (LLU'(0))) = Bool (True), "0 * 124 != 0");
      Assert (Simp (Int (LLU'(0)) * Int ("X") = Int (LLU'(0))) = Bool (True), "0 * X != 0");
      Assert (Simp (Int (LLU'(5)) - Int (LLU'(3)) = Int (LLU'(2))) = Bool (True), "5 - 3 != 2");
      Assert (Simp (Int (LLU'(5)) - Int (LLU'(30)) = Int (LLI'(-25))) = Bool (True), "5 - 30 != 25");
      Assert (Simp (Int ("X") - Int (LLU'(0)) = Int ("X")) = Bool (True), "X - 0 != X");
      Assert (Simp (Int (LLU'(6)) / Int (LLU'(2)) = Int (LLU'(3))) = Bool (True), "6 / 2 != 3");
      Assert (Simp (Int (LLU'(0)) / Int (LLU'(15)) = Int (LLU'(0))) = Bool (True), "0 / 15 != 0");
      Assert (Simp (Int (LLU'(10)) / Int (LLU'(3)) = Int (LLU'(3))) = Bool (True), "10 / 3 != 3");
      Assert (Simp (Int (LLU'(16)) mod Int (LLU'(8)) = Int (LLU'(0))) = Bool (True), "16 % 8 != 0");
      Assert (Simp (Int (LLU'(17)) mod Int (LLU'(8)) = Int (LLU'(1))) = Bool (True), "17 % 8 != 1");
      Assert (Simp (-Int (LLU'(5)) + Int (LLU'(5)) = Int (LLU'(0))) = Bool (True), "-5 + 5 != 0");
      Assert (Simp (Int (LLU'(2)) ** Int (LLU'(4)) = Int (LLU'(16))) = Bool (True), "2^4 != 16");
      Assert (Simp (Int (LLU'(2)) ** Int (LLU'(0)) = Int (LLU'(1))) = Bool (True), "2^0 != 1");
      Assert (Simp (Int (LLU'(2)) < Int (LLU'(0))) = Bool (False), "2 < 0 != false");
      Assert (Simp (Int (LLU'(0)) < Int (LLU'(10))) = Bool (True), "0 < 10 != true");
      Assert (Simp (Int (LLU'(2)) <= Int (LLU'(0))) = Bool (False), "2 <= 0 != false");
      Assert (Simp (Int (LLU'(0)) <= Int (LLU'(10))) = Bool (True), "0 <= 10 != true");
      Assert (Simp (Int (LLU'(3)) <= Int (LLU'(3))) = Bool (True), "3 <= 3 != true");
      Assert (Simp (Int (LLU'(0)) > Int (LLU'(2))) = Bool (False), "2 > 0 != false");
      Assert (Simp (Int (LLU'(10)) > Int (LLU'(0))) = Bool (True), "10 > 0 != true");
      Assert (Simp (Int (LLU'(0)) >= Int (LLU'(2))) = Bool (False), "0 >= 2 != false");
      Assert (Simp (Int (LLU'(10)) >= Int (LLU'(0))) = Bool (True), "10 >= 0 != true");
      Assert (Simp (Int (LLU'(3)) >= Int (LLU'(3))) = Bool (True), "3 >= 3 != true");
   end Test_Unsigned;

   ---------------------------------------------------------------------------

   procedure Test_Solver (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced  (T);
      use Z3;
      S : Solver := Create;
   begin
      S.Assert (Bool (False));
      Assert (S.Check = Result_False, "false not checked as false");
      S.Reset;
      S.Assert (Bool (True));
      Assert (S.Check = Result_True, "true not checked as true");
      S.Reset;
      S.Assert (Bool ("X") and not Bool ("X"));
      Assert (S.Check = Result_False, "X and not X not check as false");
      S.Reset;
      S.Assert (Bool ("X") or not Bool ("X"));
      Assert (S.Check = Result_True, "X or not X not check as true");
      S.Reset;
      S.Assert (Int ("X") < Int (LLI'(3)) and Int ("X") > Int (LLI'(100)));
      Assert (S.Check = Result_False, "contradiction not found");
      S.Reset;
      S.Assert (Int ("X") >= Int (LLI'(3)) and Int ("X") <= Int (LLI'(100)));
      Assert (S.Check = Result_True, "X >= 3 and X <= 100 not checked as true");
      S.Reset;
      S.Assert (Int ("X") ** Int ("Y") >= Int ("X"));
      Assert (S.Check = Result_Undef, "expected Undef");
   end Test_Solver;

   ---------------------------------------------------------------------------

   procedure Incompatible_Context
   is
      use Z3;
      C1     : constant Context := New_Context;
      Result : constant Bool_Type := Bool (True) = Bool (False, C1);
   begin
      pragma Unreferenced (Result);
   end Incompatible_Context;

   procedure Test_Conflicting_Contexts (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced  (T);
   begin
      Assert_Exception (Incompatible_Context'Access,
                        "Incompatible contexts not detected");
   end Test_Conflicting_Contexts;

   ---------------------------------------------------------------------------

   procedure Test_String_Representation (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced  (T);
      use Z3;
   begin
      Assert (+Int (LLI'(234)) = "234", "invalid boolean string representation");
      Assert (+(Int (LLI'(7)) + Int (LLI'(15))) = "(+ 7 15)", "invalid integer string representation");
      Assert (+Bool (True) = "true", "invalid boolean string representation");
      Assert (+(Bool ("X") or Bool ("Y")) = "(or X Y)", "invalid boolean string representation");
   end Test_String_Representation;

   ---------------------------------------------------------------------------

   procedure Value_Of_Addition
   is
      use Z3;
      I      : constant Int_Type := Int (LLI'(-1000)) + Int (LLI'(5000));
      Unused : constant Long_Long_Integer := I.Value;
   begin
      null; --  GCOV_EXCL_LINE
   end Value_Of_Addition;

   procedure Negative_Unsigned
   is
      use Z3;
      Unused : constant LLU := Int (LLI'(-1)).Value;
   begin
      null; --  GCOV_EXCL_LINE
   end Negative_Unsigned;

   procedure Test_Value (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced  (T);
      use Z3;
   begin
      Assert (Int (LLI'(234)).Value = LLI'(234), "invalid integer value");
      Assert (Int (LLI'(-1234567)).Value = LLI'(-1234567), "invalid negative integer value");
      Assert (Int (LLI'(0)).Value = LLI'(0), "invalid zero integer value");
      Assert (Int (LLI'First).Value = LLI'First, "invalid first integer value");
      Assert (Int (LLI'Last).Value = LLI'Last, "invalid last integer value");
      Assert_Exception (Value_Of_Addition'Access, "value of addition raised no error");
      Assert (Int (LLU'(234)).Value = LLU'(234), "invalid unsigned value");
      Assert (Int (LLU'(0)).Value = LLU'(0), "invalid zero unsigned value");
      Assert (Int (LLU'First).Value = LLU'First, "invalid first unsigned value");
      Assert (Int (LLU'Last).Value = LLU'Last, "invalid last unsigned value");
      Assert_Exception (Negative_Unsigned'Access, "negative unsigned raised no error");
   end Test_Value;

   ---------------------------------------------------------------------------

   procedure Test_Substitute (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use Z3;
      Expr     : Bool_Type := Int (LLI'(1)) < Int ("A");
      Expected : Bool_Type := Int (LLI'(1)) < Int ("B");
      Result   : Bool_Type := Bool (Substitute (Expr, Int ("A"), Int ("B")));
   begin
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Result   := Bool (Substitute (Expr, Int_Array'(1 => Int ("A")), Int_Array'(1 => Int ("B"))));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Expr     := Bool (False) or Bool ("A");
      Expected := Bool (False) or Bool ("B");
      Result   := Bool (Substitute (Expr, Bool ("A"), Bool ("B")));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Result   := Bool (Substitute (Expr, Bool_Array'(1 => Bool ("A")), Bool_Array'(1 => Bool ("B"))));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Expected := Expr;
      Result   := Bool (Substitute (Expr, Bool_Array'(2 .. 1 => Bool (False)), Bool_Array'(2 .. 1 => Bool (True))));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Expr     := Bool (False) or Bool ("A") or Bool ("B");
      Expected := Bool (False) or Bool ("C") or Bool (False);
      Result   := Bool (Substitute (Expr, Bool_Array'(Bool ("A"), Bool ("B")), Bool_Array'(Bool ("C"), Bool (False))));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Expr     := Int (LLI'(1)) + Int ("A") < Int ("B");
      Expected := Int (LLI'(1)) + Int ("C") < Int (LLI'(42));
      Result   := Bool (Substitute (Expr, Int_Array'(Int ("A"), Int ("B")), Int_Array'(Int ("C"), Int (LLI'(42)))));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
   end Test_Substitute;

   ---------------------------------------------------------------------------

   procedure Test_Equal (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use Z3;
      function Create_Complex_Expr return Z3.Bool_Type is
         ((Int ("E") >= Int (LLU'(0)) and Int ("E") <= Int (LLU'(0)))
          or (Int ("E") >= Int (LLU'(1)) and Int ("E") <= Int (LLU'(127)))
          or (Int ("E") >= Int (LLU'(128)) and Int ("E") <= Int (LLU'(255))));
      E1 : constant Z3.Bool_Type := Create_Complex_Expr;
      E2 : constant Z3.Bool_Type := Create_Complex_Expr;
   begin
      Assert (E1 = E2, +E1 & " /= " & "+" (E2));
      Assert (Eq (E1, E2), +E1 & " not Eq " & "+" (E2));
   end Test_Equal;

   ---------------------------------------------------------------------------

   overriding
   procedure Register_Tests (T : in out Test_Case)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Set_Param_Value'Access, "Set configuration parameters");
      Register_Routine (T, Test_Booleans'Access, "Booleans");
      Register_Routine (T, Test_Integer'Access, "Integer");
      Register_Routine (T, Test_Unsigned'Access, "Unsigned");
      Register_Routine (T, Test_Solver'Access, "Solver");
      Register_Routine (T, Test_Conflicting_Contexts'Access, "Conflicting contexts");
      Register_Routine (T, Test_String_Representation'Access, "String representation");
      Register_Routine (T, Test_Value'Access, "Value");
      Register_Routine (T, Test_Substitute'Access, "Substitute");
      Register_Routine (T, Test_Equal'Access, "Equal");
   end Register_Tests;

   ---------------------------------------------------------------------------

   overriding
   function Name (T : Test_Case) return Test_String
   is
      pragma Unreferenced  (T);
   begin
      return Format ("Z3 Tests");
   end Name;

end AZ3_Tests;
