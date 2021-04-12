with AUnit.Assertions;

package body Z3.Tests is

   use AUnit.Assertions;

   subtype LLI is Long_Long_Integer;
   subtype LLU is Long_Long_Unsigned;

   function Simp (V : Bool_Type) return Bool_Type is
   begin
      return V.Simplified;
   end Simp;

   function Simp (V : Int_Type) return Int_Type is
   begin
      return V.Simplified;
   end Simp;

   function Simp (V : Bit_Vector_Type) return Bit_Vector_Type is
   begin
      return V.Simplified;
   end Simp;

   function Bv (V : Long_Long_Integer) return Bit_Vector_Type is
      (Bit_Vector (V, 65));

   function Bv (V : Long_Long_Unsigned) return Bit_Vector_Type is
      (Bit_Vector (V, 65));

   function Bv (V : String) return Bit_Vector_Type is
      (Bit_Vector (V, 65));

   ---------------------------------------------------------------------------

   procedure Test_Set_Param_Value (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced  (T);
   begin
      Set_Param_Value ("unsat_core", "true");
      --  We cannot really test anything here - there is not API to read
      --  back parameters or to check a result
   end Test_Set_Param_Value;

   ---------------------------------------------------------------------------

   procedure Test_Booleans (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced  (T);
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

   procedure Test_Bit_Vector (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced  (T);
   begin
      Assert (Simp (Bv (LLI'(1)) = Bv (LLI'(1))) = Bool (True), "1 != 1");
      Assert (Simp (Bv (LLI'(1)) = Bv (LLI'(2))) = Bool (False), "1 == 2");
      Assert (Simp (Bv (LLI'(1)) /= Bv (LLI'(2))) = Bool (True), "1 == 2");
      Assert (Simp (Bv (LLI'(1)) /= Bv (LLI'(1))) = Bool (False), "1 != 2");
      Assert (Simp (Bv (LLI'(1)) + Bv (LLI'(2))) = Bv (LLI'(3)), "1 + 2 != 3");
      Assert (Simp (Bv (LLI'(1)) + Bv (LLI'(2)) + Bv (LLI'(3))) = Bv (LLI'(6)), "1 + 2 + 3 != 6");
      Assert (Simp (Bv (LLI'(1)) + Bv (LLI'(2)) + Bv (LLI'(3)) /= Bv (LLI'(7))) = Bool (True), "1 + 2 + 3 == 7");
      Assert (Simp (Bv (LLI'(0)) + Bv ("X") = Bv ("X")) = Bool (True), "0 + X != X");
      Assert (Simp (Bv (LLI'(2)) * Bv (LLI'(4)) = Bv (LLI'(8))) = Bool (True), "2 * 4 != 8");
      Assert (Simp (Bv (LLI'(0)) * Bv (LLI'(124)) = Bv (LLI'(0))) = Bool (True), "0 * 124 != 0");
      Assert (Simp (Bv (LLI'(0)) * Bv ("X") = Bv (LLI'(0))) = Bool (True), "0 * X != 0");
      Assert (Simp (Bv (LLI'(5)) - Bv (LLI'(3)) = Bv (LLI'(2))) = Bool (True), "5 - 3 != 2");
      Assert (Simp (Bv (LLI'(5)) - Bv (LLI'(30)) = Bv (LLI'(-25))) = Bool (True), "5 - 30 != 25");
      Assert (Simp (Bv ("X") - Bv (LLI'(0)) = Bv ("X")) = Bool (True), "X - 0 != X");
      Assert (Simp (Bv (LLI'(6)) / Bv (LLI'(2)) = Bv (LLI'(3))) = Bool (True), "6 / 2 != 3");
      Assert (Simp (Bv (LLI'(0)) / Bv (LLI'(15)) = Bv (LLI'(0))) = Bool (True), "0 / 15 != 0");
      Assert (Simp (Bv (LLI'(10)) / Bv (LLI'(3)) = Bv (LLI'(3))) = Bool (True), "10 / 3 != 3");
      Assert (Simp (Bv (LLI'(16)) mod Bv (LLI'(8)) = Bv (LLI'(0))) = Bool (True), "16 % 8 != 0");
      Assert (Simp (Bv (LLI'(17)) mod Bv (LLI'(8)) = Bv (LLI'(1))) = Bool (True), "17 % 8 != 1");
      Assert (Simp (-Bv (LLI'(5)) + Bv (LLI'(5)) = Bv (LLI'(0))) = Bool (True), "-5 + 5 != 0");
      Assert (Simp (Bv (LLI'(2)) < Bv (LLI'(0))) = Bool (False), "2 < 0 != false");
      Assert (Simp (Bv (LLI'(0)) < Bv (LLI'(10))) = Bool (True), "0 < 10 != true");
      Assert (Simp (Bv (LLI'(2)) <= Bv (LLI'(0))) = Bool (False), "2 <= 0 != false");
      Assert (Simp (Bv (LLI'(0)) <= Bv (LLI'(10))) = Bool (True), "0 <= 10 != true");
      Assert (Simp (Bv (LLI'(3)) <= Bv (LLI'(3))) = Bool (True), "3 <= 3 != true");
      Assert (Simp (Bv (LLI'(0)) > Bv (LLI'(2))) = Bool (False), "2 > 0 != false");
      Assert (Simp (Bv (LLI'(10)) > Bv (LLI'(0))) = Bool (True), "10 > 0 != true");
      Assert (Simp (Bv (LLI'(0)) >= Bv (LLI'(2))) = Bool (False), "0 >= 2 != false");
      Assert (Simp (Bv (LLI'(10)) >= Bv (LLI'(0))) = Bool (True), "10 >= 0 != true");
      Assert (Simp (Bv (LLI'(3)) >= Bv (LLI'(3))) = Bool (True), "3 >= 3 != true");
   end Test_Bit_Vector;

   ---------------------------------------------------------------------------

   procedure Test_Unsigned_Bit_Vector (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (Simp (Bv (LLU'(1)) = Bv (LLU'(1))) = Bool (True), "1 != 1");
      Assert (Simp (Bv (LLU'(1)) = Bv (LLU'(2))) = Bool (False), "1 == 2");
      Assert (Simp (Bv (LLU'(1)) /= Bv (LLU'(2))) = Bool (True), "1 == 2");
      Assert (Simp (Bv (LLU'(1)) /= Bv (LLU'(1))) = Bool (False), "1 != 2");
      Assert (Simp (Bv (LLU'(1)) + Bv (LLU'(2))) = Bv (LLU'(3)), "1 + 2 != 3");
      Assert (Simp (Bv (LLU'(1)) + Bv (LLU'(2)) + Bv (LLU'(3))) = Bv (LLU'(6)), "1 + 2 + 3 != 6");
      Assert (Simp (Bv (LLU'(1)) + Bv (LLU'(2)) + Bv (LLU'(3)) /= Bv (LLU'(7))) = Bool (True), "1 + 2 + 3 == 7");
      Assert (Simp (Bv (LLU'(0)) + Bv ("X") = Bv ("X")) = Bool (True), "0 + X != X");
      Assert (Simp (Bv (LLU'(2)) * Bv (LLU'(4)) = Bv (LLU'(8))) = Bool (True), "2 * 4 != 8");
      Assert (Simp (Bv (LLU'(0)) * Bv (LLU'(124)) = Bv (LLU'(0))) = Bool (True), "0 * 124 != 0");
      Assert (Simp (Bv (LLU'(0)) * Bv ("X") = Bv (LLU'(0))) = Bool (True), "0 * X != 0");
      Assert (Simp (Bv (LLU'(5)) - Bv (LLU'(3)) = Bv (LLU'(2))) = Bool (True), "5 - 3 != 2");
      Assert (Simp (Bv (LLU'(5)) - Bv (LLU'(30)) = Bv (LLI'(-25))) = Bool (True), "5 - 30 != 25");
      Assert (Simp (Bv ("X") - Bv (LLU'(0)) = Bv ("X")) = Bool (True), "X - 0 != X");
      Assert (Simp (Bv (LLU'(6)) / Bv (LLU'(2)) = Bv (LLU'(3))) = Bool (True), "6 / 2 != 3");
      Assert (Simp (Bv (LLU'(0)) / Bv (LLU'(15)) = Bv (LLU'(0))) = Bool (True), "0 / 15 != 0");
      Assert (Simp (Bv (LLU'(10)) / Bv (LLU'(3)) = Bv (LLU'(3))) = Bool (True), "10 / 3 != 3");
      Assert (Simp (Bv (LLU'(16)) mod Bv (LLU'(8)) = Bv (LLU'(0))) = Bool (True), "16 % 8 != 0");
      Assert (Simp (Bv (LLU'(17)) mod Bv (LLU'(8)) = Bv (LLU'(1))) = Bool (True), "17 % 8 != 1");
      Assert (Simp (-Bv (LLU'(5)) + Bv (LLU'(5)) = Bv (LLU'(0))) = Bool (True), "-5 + 5 != 0");
      Assert (Simp (Bv (LLU'(2)) < Bv (LLU'(0))) = Bool (False), "2 < 0 != false");
      Assert (Simp (Bv (LLU'(0)) < Bv (LLU'(10))) = Bool (True), "0 < 10 != true");
      Assert (Simp (Bv (LLU'(2)) <= Bv (LLU'(0))) = Bool (False), "2 <= 0 != false");
      Assert (Simp (Bv (LLU'(0)) <= Bv (LLU'(10))) = Bool (True), "0 <= 10 != true");
      Assert (Simp (Bv (LLU'(3)) <= Bv (LLU'(3))) = Bool (True), "3 <= 3 != true");
      Assert (Simp (Bv (LLU'(0)) > Bv (LLU'(2))) = Bool (False), "2 > 0 != false");
      Assert (Simp (Bv (LLU'(10)) > Bv (LLU'(0))) = Bool (True), "10 > 0 != true");
      Assert (Simp (Bv (LLU'(0)) >= Bv (LLU'(2))) = Bool (False), "0 >= 2 != false");
      Assert (Simp (Bv (LLU'(10)) >= Bv (LLU'(0))) = Bool (True), "10 >= 0 != true");
      Assert (Simp (Bv (LLU'(3)) >= Bv (LLU'(3))) = Bool (True), "3 >= 3 != true");
      Assert (Simp (Add (Bv (LLU'(1)) & Bv (LLU'(3)) & Bv (LLI'(-2)))) = Bv (LLU'(2)), "1 + 3 - 2 /= 2");
      Assert (Simp (Mul (Bv (LLU'(1)) & Bv (LLU'(3)) & Bv (LLI'(4)))) = Bv (LLU'(12)), "1 * 3 * 4 /= 12 ");
   end Test_Unsigned_Bit_Vector;

   ---------------------------------------------------------------------------

   procedure Test_Solver (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced  (T);
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
   begin
      Assert (+Int (LLI'(234)) = "234", "invalid boolean string representation");
      Assert (+(Int (LLI'(7)) + Int (LLI'(15))) = "(+ 7 15)", "invalid integer string representation");
      Assert (+Bool (True) = "true", "invalid boolean string representation");
      Assert (+(Bool ("X") or Bool ("Y")) = "(or X Y)", "invalid boolean string representation");
   end Test_String_Representation;

   ---------------------------------------------------------------------------

   procedure Value_Of_Addition
   is
      I      : constant Int_Type := Int (LLI'(-1000)) + Int (LLI'(5000));
      Unused : constant Long_Long_Integer := I.Value;
   begin
      null; --  GCOV_EXCL_LINE
   end Value_Of_Addition;

   procedure Negative_Unsigned
   is
      Unused : constant LLU := Int (LLI'(-1)).Value;
   begin
      null; --  GCOV_EXCL_LINE
   end Negative_Unsigned;

   procedure Negative_Bit_Vector
   is
      Unused : constant LLU := Bv (LLI'(-1)).Value;
   begin
      null; --  GCOV_EXCL_LINE
   end Negative_Bit_Vector;

   procedure Test_Value (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced  (T);
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
      Assert (Bv (LLU'(234)).Value = 234, "invalid unsigned bit vector value");
      Assert (Bv (LLU'(0)).Value = 0, "invalid zero unsigned bit vector value");
      Assert (Bv (LLU'First).Value = LLU'First, "invalid first unsigned bit vector value");
      Assert (Bv (LLU'Last).Value = LLU'Last, "invalid last unsigned bit vector value");
      Assert (Bv (LLI'(234)).Value = 234, "invalid bit vector value");
      Assert (Bv (LLI'Last).Value = LLU (LLI'Last), "invalid last bit vector value");
      Assert (Simp (Bv (LLI'(-5)) + Bv (LLU'(13))).Value = 8, "invalid calculated bit vector ");
      Assert_Exception (Negative_Bit_Vector'Access, "negative bit vector raised no error");
   end Test_Value;

   ---------------------------------------------------------------------------

   procedure Test_Substitute (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
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
      Result   := Bool (Substitute (Expr, Bool ("A") & Bool ("B"), Bool ("C") & Bool (False)));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Expr     := Int (LLI'(1)) + Int ("A") < Int ("B");
      Expected := Int (LLI'(1)) + Int ("C") < Int (LLI'(42));
      Result   := Bool (Substitute (Expr, Int ("A") & Int ("B"), Int ("C") & Int (LLI'(42))));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Expr     := Bv (LLI'(1)) + Bv ("A") < Bv ("B");
      Expected := Bv (LLI'(1)) + Bv ("C") < Bv (LLI'(42));
      Result   := Bool (Substitute (Expr, Bv ("A") & Bv ("B"), Bv ("C") & Bv (LLI'(42))));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Expr     := Bv (LLI'(1)) < Bv ("A");
      Expected := Bv (LLI'(1)) < Bv ("B");
      Result   := Bool (Substitute (Expr, Bv ("A"), Bv ("B")));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Result   := Bool (Substitute (Expr, Bit_Vector_Array'(1 => Bv ("A")), Bit_Vector_Array'(1 => Bv ("B"))));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
   end Test_Substitute;

   ---------------------------------------------------------------------------

   procedure Term_Out_Of_Bounds
   is
      Unused : Int_Type := Int ("A") + Int ("B");
   begin
      Unused := Int (Term (Unused, 2));
   end Term_Out_Of_Bounds;

   procedure Test_Terms (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      I_Arg_1 : constant Int_Type   := Int ("A");
      I_Arg_2 : constant Int_Type   := Int ("B");
      I_Arg_3 : constant Int_Type   := Int (LLU'(2));
      B_Arg_1 : constant Bool_Type  := Bool ("A");
      B_Arg_2 : constant Bool_Type  := Bool ("B");
      B_Arg_3 : constant Bool_Type  := Bool (True);
      I_0     : constant Int_Type   := I_Arg_1;
      I_2     : constant Int_Type   := I_Arg_1 + I_Arg_2;
      I_3     : constant Int_Type   := Add (I_Arg_1 & I_Arg_2 & I_Arg_3);
      B_0     : constant Bool_Type  := B_Arg_1;
      B_1     : constant Bool_Type  := not B_Arg_1;
      B_2     : constant Bool_Type  := I_Arg_1 < I_Arg_2;
      B_3     : constant Bool_Type  := Conjunction (B_Arg_1 & B_Arg_2 & B_Arg_3);
      I_Args  : constant Int_Array  := I_Arg_1 & I_Arg_2 & I_Arg_3;
      B_Args  : constant Bool_Array := B_Arg_1 & B_Arg_2 & B_Arg_3;
      Index   : Natural;
   begin
      Assert (Terms (Int (LLU'(0))) = 0, "invalid argument count 0");
      Assert (Terms (Bool (True)) = 0, "invalid argument count True");
      Assert (Terms (I_0) = 0, "invalid argument count I_0");
      Assert (Terms (I_2) = 2, "invalid argument count I_2");
      Assert (Terms (I_3) = 3, "invalid argument count I_3");
      Assert (Terms (B_0) = 0, "invalid argument count B_0");
      Assert (Terms (B_1) = 1, "invalid argument count B_1");
      Assert (Terms (B_2) = 2, "invalid argument count B_2");
      Assert (Terms (B_3) = 3, "invalid argument count B_3");
      Assert (Int (Term (I_2, 0)) = I_Arg_1, "I_2 (0) /= I_Arg_1");
      Assert (Int (Term (I_2, 1)) = I_Arg_2, "I_2 (1) /= I_Arg_2");
      Assert (Int (Term (I_3, 0)) = I_Arg_1, "I_3 (0) /= I_Arg_1");
      Assert (Int (Term (I_3, 1)) = I_Arg_2, "I_3 (1) /= I_Arg_2");
      Assert (Int (Term (I_3, 2)) = I_Arg_3, "I_3 (2) /= I_Arg_3");
      Assert (Bool (Term (B_1, 0)) = B_Arg_1, "B_1 (0) /= B_Arg_1");
      Assert (Int (Term (B_2, 0)) = I_Arg_1, "B_2 (0) /= I_Arg_1");
      Assert (Int (Term (B_2, 1)) = I_Arg_2, "B_2 (1) /= I_Arg_2");
      Assert (Bool (Term (B_3, 0)) = B_Arg_1, "B_3 (0) /= B_Arg_1");
      Assert (Bool (Term (B_3, 1)) = B_Arg_2, "B_3 (1) /= B_Arg_2");
      Assert (Bool (Term (B_3, 2)) = B_Arg_3, "B_3 (2) /= B_Arg_3");
      for T of I_0 loop
         Assert (False, "Atom should not have subterms");  --  GCOV_EXCL_LINE
      end loop;
      for T of B_0 loop
         Assert (False, "Atom should not have subterms");  --  GCOV_EXCL_LINE
      end loop;
      Index := I_Args'First;
      for T of I_3 loop
         Assert (Int (T) = I_Args (Index), "Invalid term at index " & Index'Img);
         Index := Index + 1;
      end loop;
      Assert (Index > I_Args'Last, "Failed to iterate over all terms");
      Index := B_Args'First;
      for T of B_3 loop
         Assert (Bool (T) = B_Args (Index), "Invalid term at index " & Index'Img);
         Index := Index + 1;
      end loop;
      Assert (Index > B_Args'Last, "Failed to iterate over all terms");
      Assert_Exception (Term_Out_Of_Bounds'Access, "Out of bounds term access not detected");
   end Test_Terms;

   ---------------------------------------------------------------------------

   procedure Test_Kind (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (Kind (Bool (True)) = Kind_Constant, "invalid bool constant");
      Assert (Kind (Bool (False)) = Kind_Constant, "invalid bool constant");
      Assert (Kind (Int (LLU'(1))) = Kind_Constant, "invalid int constant");
      Assert (Kind (Bv (LLU'(1))) = Kind_Constant, "invalid bit vector constant");
      Assert (Kind (Bool ("A")) = Kind_Var, "invalid bool var " & Kind (Bool ("A"))'Img);
      Assert (Kind (Int ("A")) = Kind_Var, "invalid int var " & Kind (Int ("A"))'Img);
      Assert (Kind (Bv ("A")) = Kind_Var, "invalid bit vector var" & Kind (Bv ("A"))'Img);
      Assert (Kind (Int ("A") = Int ("B")) = Kind_Equal, "invalid int equal");
      Assert (Kind (Bool ("A") = Bool ("B")) = Kind_Equal, "invalid bool equal");
      Assert (Kind (Int ("A") >= Int ("B")) = Kind_Greater_Equal, "invalid greater equal");
      Assert (Kind (Int ("A") > Int ("B")) = Kind_Greater_Than, "invalid greater than");
      Assert (Kind (Int ("A") <= Int ("B")) = Kind_Less_Equal, "invalid less equal");
      Assert (Kind (Int ("A") < Int ("B")) = Kind_Less_Than, "invalid less than");
      Assert (Kind (Bv ("A") >= Bv ("B")) = Kind_Greater_Equal, "invalid greater equal");
      Assert (Kind (Bv ("A") > Bv ("B")) = Kind_Greater_Than, "invalid greater than");
      Assert (Kind (Bv ("A") <= Bv ("B")) = Kind_Less_Equal, "invalid less equal");
      Assert (Kind (Bv ("A") < Bv ("B")) = Kind_Less_Than, "invalid less than");
      Assert (Kind (Bool ("A") and Bool ("B")) = Kind_And, "invalid and");
      Assert (Kind (Conjunction (Bool ("A") & Bool ("B") & Bool ("C"))) = Kind_And,
              "invalid conjunction");
      Assert (Kind (Bool ("A") or Bool ("B")) = Kind_Or, "invalid or");
      Assert (Kind (Disjunction (Bool ("A") & Bool ("B") & Bool ("C"))) = Kind_Or,
              "invalid disjunction");
      Assert (Kind (not Bool ("A")) = Kind_Not, "invalid not");
      Assert (Kind (Int ("A") + Int ("B")) = Kind_Add, "invalid add");
      Assert (Kind (Add (Int ("A") & Int ("B") & Int ("C"))) = Kind_Add,
              "invalid add (multiple)");
      Assert (Kind (Int ("A") * Int ("B")) = Kind_Mul, "invalid mul");
      Assert (Kind (Mul (Int ("A") & Int ("B") & Int ("C"))) = Kind_Mul,
              "invalid mul (multiple)");
      Assert (Kind (Int ("A") - Int ("B")) = Kind_Sub, "invalid sub");
      Assert (Kind (Int ("A") / Int ("B")) = Kind_Div, "invalid div");
      Assert (Kind (Int ("A") mod Int ("B")) = Kind_Mod, "invalid mod");
      Assert (Kind (Int ("A") ** Int ("B")) = Kind_Power, "invalid power");
      Assert (Kind (Bv ("A") + Bv ("B")) = Kind_Add, "invalid add");
      Assert (Kind (Bv ("A") * Bv ("B")) = Kind_Mul, "invalid mul");
      Assert (Kind (Bv ("A") - Bv ("B")) = Kind_Sub, "invalid sub");
      Assert (Kind (Bv ("A") / Bv ("B")) = Kind_Div, "invalid div");
      Assert (Kind (Bv ("A") mod Bv ("B")) = Kind_Mod, "invalid mod");
      Assert (Kind (Add (Bv ("A") & Bv ("B") & Bv ("C"))) = Kind_Add,
              "invalid add (multiple)");
      Assert (Kind (Mul (Bv ("A") & Bv ("B") & Bv ("C"))) = Kind_Mul,
              "invalid mul (multiple)");
   end Test_Kind;

   ---------------------------------------------------------------------------

   procedure Test_Optimize (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Optimize : Z3.Optimize := Create;
      Result   : Z3.Result;
   begin
      Optimize.Set_Timeout (100);
      Optimize.Assert (Int ("X") ** Int ("Y") >= Int ("X"));
      Optimize.Check (Result);
      Assert (Result = Result_Undef, "Optimize not undef");
      Optimize.Assert (Int ("X") < Int (LLU'(3)) and Int ("X") > Int (LLU'(100)));
      Optimize.Check (Result);
      Assert (Result = Result_False, "contradiction not found");
      Optimize.Reset;
      Optimize.Assert ((Int ("A") >= Int (LLU'(10)))
                       and (Int ("A") < Int (LLU'(50))));
      Optimize.Assert ((Int ("B") >= Int (LLU'(20)))
                       and (Int ("B") <= Int (LLU'(42))));
      Optimize.Minimize (Int ("A"));
      Optimize.Maximize (Int ("B"));
      Optimize.Check (Result);
      Assert (Result = Result_True, "Optimize not sat");
      Assert (Sort (Optimize.Lower (Int ("A"))) = Sort_Int, "Invalid sort");
      Assert (Sort (Optimize.Upper (Int ("B"))) = Sort_Int, "Invalid sort");
      Assert (Int (Optimize.Lower (Int ("A"))) = Int (LLU'(10)), "Invalid lower");
      Assert (Int (Optimize.Upper (Int ("B"))) = Int (LLU'(42)), "Invalid upper");
      Optimize.Assert (Int ("C") > Int (LLU'(100)));
      Optimize.Maximize (Int ("C"));
      Optimize.Check (Result);
      Assert (Result = Result_True, "Optimize not sat ");
      Assert (Kind (Optimize.Lower (Int ("C"))) /= Kind_Constant, "Invalid constant result");
      Optimize.Reset;
      Optimize.Assert (Int ("C") < Int (LLU'(100)));
      Optimize.Minimize (Int ("C"));
      Optimize.Check (Result);
      Assert (Result = Result_True, "Optimize not sat ");
      Assert (Kind (Optimize.Upper (Int ("C"))) /= Kind_Constant, "Invalid constant result");
      Optimize.Reset;
      Optimize.Assert ((Bv ("A") >= Bv (LLU'(10)))
                       and (Bv ("A") < Bv (LLU'(50))));
      Optimize.Minimize (Bv ("A"));
      Optimize.Check (Result);
      Assert (Result = Result_True, "Optimize not sat");
      Assert (Sort (Optimize.Lower (Bv ("A"))) = Sort_Int,
              "Invalid sort " & Sort (Optimize.Lower (Bv ("A")))'Img);
      Assert (Int (Optimize.Lower (Bv ("A"))) = Int (LLU'(10)), "Invalid lower");
   end Test_Optimize;

   ---------------------------------------------------------------------------

   procedure Invalid_Bool
   is
      B      : constant Expr_Type'Class := Bool ("B");
      Ignore : Int_Type;
   begin
      Ignore := Int (B);
   end Invalid_Bool;

   procedure Invalid_Int
   is
      I      : constant Expr_Type'Class := Int ("I");
      Ignore : Bool_Type;
   begin
      Ignore := Bool (I);
   end Invalid_Int;

   procedure Test_Sort (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      B : constant Expr_Type'Class := Bool ("B");
      I : constant Expr_Type'Class := Int ("I");
   begin
      Assert (Int ("A").Sort = Sort_Int, "Invalid int sort");
      Assert (Int (LLU'(1)).Sort = Sort_Int, "Invalid int sort");
      Assert (Bool ("A").Sort = Sort_Bool, "Invalid bool sort");
      Assert (Bool (True).Sort = Sort_Bool, "Invalid bool sort");
      Assert (B.Sort = Sort_Bool, "Invalid bool sort");
      Assert (I.Sort = Sort_Int, "Invalid int sort");
      Assert_Exception (Invalid_Bool'Access, "Invalid bool conversion not detected");
      Assert_Exception (Invalid_Int'Access, "Invalid int conversion not detected");
   end Test_Sort;

   procedure Test_Invalid_Big_Int_Base_16
   is
      Ignore : Int_Type;
   begin
      Ignore := Big_Int ("1234_ABCD_EFG", 16);
   end Test_Invalid_Big_Int_Base_16; --  GCOV_EXCL_LINE

   procedure Test_Invalid_Big_Int_Base_8
   is
      Ignore : Int_Type;
   begin
      Ignore := Big_Int ("43583912", 8);
   end Test_Invalid_Big_Int_Base_8; --  GCOV_EXCL_LINE

   procedure Test_Invalid_Big_Int_Base_2
   is
      Ignore : Int_Type;
   begin
      Ignore := Big_Int ("110011104111", 2);
   end Test_Invalid_Big_Int_Base_2; --  GCOV_EXCL_LINE

   procedure Test_Invalid_Big_Int_Leading_Underscore
   is
      Ignore : Int_Type;
   begin
      Ignore := Big_Int ("_a53f_ffff_912e", 16);
   end Test_Invalid_Big_Int_Leading_Underscore; --  GCOV_EXCL_LINE

   procedure Test_Invalid_Big_Int_Trailing_Underscore
   is
      Ignore : Int_Type;
   begin
      Ignore := Big_Int ("a53f_ffff_912e_", 16);
   end Test_Invalid_Big_Int_Trailing_Underscore; --  GCOV_EXCL_LINE

   procedure Test_Invalid_Big_Int_Double_Underscore
   is
      Ignore : Int_Type;
   begin
      Ignore := Big_Int ("a53f__ffff_912e", 16);
   end Test_Invalid_Big_Int_Double_Underscore; --  GCOV_EXCL_LINE

   procedure Test_Big_Int (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Assert (Big_Int ("0") = Int (LLU'(0)), "Invalid big integer (0)");
      Assert (Big_Int ("1") = Int (LLU'(1)), "Invalid big integer (1)");
      Assert (Big_Int ("42") = Int (LLU'(42)), "Invalid big integer (42)");
      Assert (Big_Int ("FFFF_FFFF_FFFF_FFFF", 16) = Int (LLU'(16#FFFF_FFFF_FFFF_FFFF#)),
              "Invalid big integer (2^64-1, upper case)");
      Assert (Big_Int ("ffff_ffff_ffff_ffff", 16) = Int (LLU'(16#FFFF_FFFF_FFFF_FFFF#)),
              "Invalid big integer (2^64-1, lower case)");
      Assert (Simp ((Big_Int ("FFFF_FFFF_FFFF_FFFF_FFFF", 16) + Int (LLU'(1)))
                     / Int (LLU'(16#10_0000#)))
              = Int (LLU'(16#1000_0000_0000_0000#)),
              "Invalid big integer (2^80)");
      Assert_Exception (Test_Invalid_Big_Int_Base_16'Access,
                        "Invalid digit in big integer not detected (base 16)");
      Assert_Exception (Test_Invalid_Big_Int_Base_8'Access,
                        "Invalid digit in big integer not detected (base 8)");
      Assert_Exception (Test_Invalid_Big_Int_Base_2'Access,
                        "Invalid digit in big integer not detected (base 2)");
      Assert_Exception (Test_Invalid_Big_Int_Leading_Underscore'Access,
                        "Leading underscore in big integer not detected");
      Assert_Exception (Test_Invalid_Big_Int_Trailing_Underscore'Access,
                        "Trailing underscore in big integer not detected");
      Assert_Exception (Test_Invalid_Big_Int_Double_Underscore'Access,
                        "Trailing underscore in big integer not detected");
   end Test_Big_Int;

   ---------------------------------------------------------------------------

   procedure Test_Logic (T : in out Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      procedure Test_Create (Logic : Solver_Logic)
      is
         Ignore_Solver : constant Solver := Create (Logic);
      begin
         null;
      end Test_Create;
   begin
      Test_Create (Logic_AUFLIA);
      Test_Create (Logic_AUFLIRA);
      Test_Create (Logic_AUFNIRA);
      Test_Create (Logic_LRA);
      Test_Create (Logic_QF_ABV);
      Test_Create (Logic_QF_AUFBV);
      Test_Create (Logic_QF_UFBV);
      Test_Create (Logic_QF_DT);
      Test_Create (Logic_QF_AUFLIA);
      Test_Create (Logic_QF_AX);
      Test_Create (Logic_QF_BV);
      Test_Create (Logic_QF_IDL);
      Test_Create (Logic_QF_RDL);
      Test_Create (Logic_QF_LIA);
      Test_Create (Logic_QF_LRA);
      Test_Create (Logic_QF_NIA);
      Test_Create (Logic_QF_NRA);
      Test_Create (Logic_QF_UF);
      Test_Create (Logic_QF_UFIDL);
      Test_Create (Logic_QF_UFLIA);
      Test_Create (Logic_QF_UFLRA);
      Test_Create (Logic_QF_UFNRA);
      Test_Create (Logic_UFLRA);
      Test_Create (Logic_UFNIA);
      Test_Create (Logic_UFBV);
      Test_Create (Logic_QF_S);
      Test_Create (Logic_QF_SLIA);
      Test_Create (Logic_QF_FD);
      Test_Create (Logic_SMTPD);
   end Test_Logic;

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
      Register_Routine (T, Test_Bit_Vector'Access, "Bit Vector");
      Register_Routine (T, Test_Unsigned_Bit_Vector'Access, "Unsigned Bit Vector");
      Register_Routine (T, Test_Solver'Access, "Solver");
      Register_Routine (T, Test_Conflicting_Contexts'Access, "Conflicting contexts");
      Register_Routine (T, Test_String_Representation'Access, "String representation");
      Register_Routine (T, Test_Value'Access, "Value");
      Register_Routine (T, Test_Substitute'Access, "Substitute");
      Register_Routine (T, Test_Terms'Access, "Terms");
      Register_Routine (T, Test_Kind'Access, "Kind");
      Register_Routine (T, Test_Optimize'Access, "Optimize");
      Register_Routine (T, Test_Sort'Access, "Sort");
      Register_Routine (T, Test_Big_Int'Access, "Big Integer");
      Register_Routine (T, Test_Logic'Access, "Logic");
   end Register_Tests;

   ---------------------------------------------------------------------------

   overriding
   function Name (T : Test_Case) return Test_String
   is
      pragma Unreferenced  (T);
   begin
      return Format ("Z3 Tests");
   end Name;

end Z3.Tests;
