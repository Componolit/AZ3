with Z3;
with AUnit.Assertions;

package body AZ3_Tests is

   use AUnit.Assertions;

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
      Assert (Simp (Int (1) = Int (1)) = Bool (True), "1 != 1");
      Assert (Simp (Int (1) = Int (2)) = Bool (False), "1 == 2");
      Assert (Simp (Int (1) /= Int (2)) = Bool (True), "1 == 2");
      Assert (Simp (Int (1) /= Int (1)) = Bool (False), "1 != 2");
      Assert (Simp (Int (1) + Int (2)) = Int (3), "1 + 2 != 3");
      Assert (Simp (Int (1) + Int (2) + Int (3)) = Int (6), "1 + 2 + 3 != 6");
      Assert (Simp (Int (1) + Int (2) + Int (3) /= Int (7)) = Bool (True), "1 + 2 + 3 == 7");
      Assert (Simp (Int (0) + Int ("X") = Int ("X")) = Bool (True), "0 + X != X");
      Assert (Simp (Int (2) * Int (4) = Int (8)) = Bool (True), "2 * 4 != 8");
      Assert (Simp (Int (0) * Int (124) = Int (0)) = Bool (True), "0 * 124 != 0");
      Assert (Simp (Int (0) * Int ("X") = Int (0)) = Bool (True), "0 * X != 0");
      Assert (Simp (Int (5) - Int (3) = Int (2)) = Bool (True), "5 - 3 != 2");
      Assert (Simp (Int (5) - Int (30) = Int (-25)) = Bool (True), "5 - 30 != 25");
      Assert (Simp (Int ("X") - Int (0) = Int ("X")) = Bool (True), "X - 0 != X");
      Assert (Simp (Int (6) / Int (2) = Int (3)) = Bool (True), "6 / 2 != 3");
      Assert (Simp (Int (0) / Int (15) = Int (0)) = Bool (True), "0 / 15 != 0");
      Assert (Simp (Int (10) / Int (3) = Int (3)) = Bool (True), "10 / 3 != 3");
      Assert (Simp (Int (16) mod Int (8) = Int (0)) = Bool (True), "16 % 8 != 0");
      Assert (Simp (Int (17) mod Int (8) = Int (1)) = Bool (True), "17 % 8 != 1");
      Assert (Simp (-Int (5) + Int (5) = Int (0)) = Bool (True), "-5 + 5 != 0");
      Assert (Simp (Int (2) ** Int (4) = Int (16)) = Bool (True), "2^4 != 16");
      Assert (Simp (Int (2) ** Int (0) = Int (1)) = Bool (True), "2^0 != 1");
      Assert (Simp (Int (2) < Int (0)) = Bool (False), "2 < 0 != false");
      Assert (Simp (Int (0) < Int (10)) = Bool (True), "0 < 10 != true");
      Assert (Simp (Int (2) <= Int (0)) = Bool (False), "2 <= 0 != false");
      Assert (Simp (Int (0) <= Int (10)) = Bool (True), "0 <= 10 != true");
      Assert (Simp (Int (3) <= Int (3)) = Bool (True), "3 <= 3 != true");
      Assert (Simp (Int (0) > Int (2)) = Bool (False), "2 > 0 != false");
      Assert (Simp (Int (10) > Int (0)) = Bool (True), "10 > 0 != true");
      Assert (Simp (Int (0) >= Int (2)) = Bool (False), "0 >= 2 != false");
      Assert (Simp (Int (10) >= Int (0)) = Bool (True), "10 >= 0 != true");
      Assert (Simp (Int (3) >= Int (3)) = Bool (True), "3 >= 3 != true");
   end Test_Integer;

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
      S.Assert (Int ("X") < Int (3) and Int ("X") > Int (100));
      Assert (S.Check = Result_False, "contradiction not found");
      S.Reset;
      S.Assert (Int ("X") >= Int (3) and Int ("X") <= Int (100));
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
      Assert (+Int (234) = "234", "invalid boolean string representation");
      Assert (+(Int (7) + Int (15)) = "(+ 7 15)", "invalid integer string representation");
      Assert (+Bool (True) = "true", "invalid boolean string representation");
      Assert (+(Bool ("X") or Bool ("Y")) = "(or X Y)", "invalid boolean string representation");
   end Test_String_Representation;

   ---------------------------------------------------------------------------

   procedure Value_Of_Addition
   is
      use Z3;
      I      : constant Int_Type := Int (-1000) + Int (5000);
      Unused : constant Long_Long_Integer := I.Value;
   begin
      null; --  GCOV_EXCL_LINE
   end Value_Of_Addition;

   procedure Test_Value (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced  (T);
      use Z3;
   begin
      Assert (Int (234).Value = 234, "invalid integer value");
      Assert (Int (-1234567).Value = -1234567, "invalid negative integer value");
      Assert (Int (0).Value = 0, "invalid zero integer value");
      Assert (Int (Long_Long_Integer'First).Value = Long_Long_Integer'First,
              "invalid first integer value");
      Assert (Int (Long_Long_Integer'Last).Value = Long_Long_Integer'Last,
              "invalid last integer value");
      Assert_Exception (Value_Of_Addition'Access, "value of addition raised no error");
   end Test_Value;

   ---------------------------------------------------------------------------

   overriding
   procedure Register_Tests (T : in out Test_Case)
   is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Set_Param_Value'Access, "Set configuration parameters");
      Register_Routine (T, Test_Booleans'Access, "Booleans");
      Register_Routine (T, Test_Integer'Access, "Integer");
      Register_Routine (T, Test_Solver'Access, "Solver");
      Register_Routine (T, Test_Conflicting_Contexts'Access, "Conflicting contexts");
      Register_Routine (T, Test_String_Representation'Access, "String representation");
      Register_Routine (T, Test_Value'Access, "Value");
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
