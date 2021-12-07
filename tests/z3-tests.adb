with AUnit.Assertions;

package body Z3.Tests is  --  GCOV_EXCL_LINE

   use AUnit.Assertions;

   subtype LLI is Long_Long_Integer;
   subtype LLU is Long_Long_Unsigned;

   Ctx : Context;

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
      (Bit_Vector (V, 65, Ctx));

   function Bv (V : Long_Long_Unsigned) return Bit_Vector_Type is
      (Bit_Vector (V, 65, Ctx));

   function Bv (V : String) return Bit_Vector_Type is
      (Bit_Vector (V, 65, Ctx));

   function Bv (V : Int_Type'Class) return Bit_Vector_Type is
      (Bit_Vector (V, 65));

   ---------------------------------------------------------------------------

   procedure Test_Booleans (Unused_T : in out Test_Cases.Test_Case'Class)
   is
      X : constant Bool_Type := Bool ("X", Ctx);
   begin
      Assert (Simp (Bool (True, Ctx) = Bool (False, Ctx)) = Bool (False, Ctx), "Contradiction not false");
      Assert (Simp (Bool (True, Ctx) = Bool (True, Ctx)) = Bool (True, Ctx), "Tautology not true");
      Assert (Simp (Bool (True, Ctx) /= Bool (False, Ctx)) = Bool (True, Ctx), "true = false");
      Assert (Simp (not Bool (True, Ctx)) = Bool (False, Ctx), "not false is not true");
      Assert (Simp (not Bool (False, Ctx)) = Bool (True, Ctx), "not true is not false");
      Assert (Simp (not X = X) = Bool (False, Ctx), "not X = X not false");
      Assert (Simp (X = X) = Bool (True, Ctx), "X = X not true");
      Assert (Simp (Bool (True, Ctx) and Bool (False, Ctx)) = Bool (False, Ctx), "true and false not false");
      Assert (Simp (X and Bool (False, Ctx)) = Bool (False, Ctx), "X and false not false");
      Assert (Simp (X and not X) = Bool (False, Ctx), "X and not X not false");
      Assert (Simp (Bool (True, Ctx) or Bool (False, Ctx)) = Bool (True, Ctx), "true or false not true");
      Assert (Simp (X or Bool (True, Ctx)) = Bool (True, Ctx), "X or true not true");
      Assert (Simp (X or Bool (False, Ctx)) = X, "X or false not X");
      Assert (Simp (X or not X) = Bool (True, Ctx), "X or not X not true");
      Assert (Simp (Conjunction ((Bool (True, Ctx), Bool (False, Ctx), Bool (True, Ctx)))) = Bool (False, Ctx),
              "Conjunction invalid");
      Assert (Simp (Disjunction ((Bool (True, Ctx), Bool (False, Ctx), Bool (True, Ctx)))) = Bool (True, Ctx),
              "Disjunction invalid");
      Assert (Value (Bool (True, Ctx)) = Result_True, "Invalid true");
      Assert (Value (Bool (False, Ctx)) = Result_False, "Invalid false");
      Assert (Value (Bool ("A", Ctx)) = Result_Undef, "Invalid undef");
   end Test_Booleans;

   ---------------------------------------------------------------------------

   procedure Test_Integer (Unused_T : in out Test_Cases.Test_Case'Class)
   is
   begin
      Assert (Simp (Int (LLI'(1), Ctx) = Int (LLI'(1), Ctx)) = Bool (True, Ctx), "1 != 1");
      Assert (Simp (Int (LLI'(1), Ctx) = Int (LLI'(2), Ctx)) = Bool (False, Ctx), "1 == 2");
      Assert (Simp (Int (LLI'(1), Ctx) /= Int (LLI'(2), Ctx)) = Bool (True, Ctx), "1 == 2");
      Assert (Simp (Int (LLI'(1), Ctx) /= Int (LLI'(1), Ctx)) = Bool (False, Ctx), "1 != 2");
      Assert (Simp (Int (LLI'(1), Ctx) + Int (LLI'(2), Ctx)) = Int (LLI'(3), Ctx), "1 + 2 != 3");
      Assert (Simp (Int (LLI'(1), Ctx) + Int (LLI'(2), Ctx) + Int (LLI'(3), Ctx))
              = Int (LLI'(6), Ctx), "1 + 2 + 3 != 6");
      Assert (Simp (Int (LLI'(1), Ctx) + Int (LLI'(2), Ctx) + Int (LLI'(3), Ctx)
              /= Int (LLI'(7), Ctx)) = Bool (True, Ctx), "1 + 2 + 3 == 7");
      Assert (Simp (Int (LLI'(0), Ctx) + Int ("X", Ctx) = Int ("X", Ctx)) = Bool (True, Ctx), "0 + X != X");
      Assert (Simp (Int (LLI'(2), Ctx) * Int (LLI'(4), Ctx) = Int (LLI'(8), Ctx)) = Bool (True, Ctx), "2 * 4 != 8");
      Assert (Simp (Int (LLI'(0), Ctx) * Int (LLI'(124), Ctx) = Int (LLI'(0), Ctx))
              = Bool (True, Ctx), "0 * 124 != 0");
      Assert (Simp (Int (LLI'(0), Ctx) * Int ("X", Ctx) = Int (LLI'(0), Ctx)) = Bool (True, Ctx), "0 * X != 0");
      Assert (Simp (Int (LLI'(5), Ctx) - Int (LLI'(3), Ctx) = Int (LLI'(2), Ctx)) = Bool (True, Ctx), "5 - 3 != 2");
      Assert (Simp (Int (LLI'(5), Ctx) - Int (LLI'(30), Ctx) = Int (LLI'(-25), Ctx))
              = Bool (True, Ctx), "5 - 30 != 25");
      Assert (Simp (Int ("X", Ctx) - Int (LLI'(0), Ctx) = Int ("X", Ctx)) = Bool (True, Ctx), "X - 0 != X");
      Assert (Simp (Int (LLI'(6), Ctx) / Int (LLI'(2), Ctx) = Int (LLI'(3), Ctx)) = Bool (True, Ctx), "6 / 2 != 3");
      Assert (Simp (Int (LLI'(0), Ctx) / Int (LLI'(15), Ctx) = Int (LLI'(0), Ctx)) = Bool (True, Ctx), "0 / 15 != 0");
      Assert (Simp (Int (LLI'(10), Ctx) / Int (LLI'(3), Ctx) = Int (LLI'(3), Ctx)) = Bool (True, Ctx), "10 / 3 != 3");
      Assert (Simp (Int (LLI'(16), Ctx) mod Int (LLI'(8), Ctx) = Int (LLI'(0), Ctx))
              = Bool (True, Ctx), "16 % 8 != 0");
      Assert (Simp (Int (LLI'(17), Ctx) mod Int (LLI'(8), Ctx) = Int (LLI'(1), Ctx))
              = Bool (True, Ctx), "17 % 8 != 1");
      Assert (Simp (-Int (LLI'(5), Ctx) + Int (LLI'(5), Ctx) = Int (LLI'(0), Ctx)) = Bool (True, Ctx), "-5 + 5 != 0");
      Assert (Simp (Int (LLI'(2), Ctx) ** Int (LLI'(4), Ctx) = Int (LLI'(16), Ctx)) = Bool (True, Ctx), "2^4 != 16");
      Assert (Simp (Int (LLI'(2), Ctx) ** Int (LLI'(0), Ctx) = Int (LLI'(1), Ctx)) = Bool (True, Ctx), "2^0 != 1");
      Assert (Simp (Int (LLI'(2), Ctx) < Int (LLI'(0), Ctx)) = Bool (False, Ctx), "2 < 0 != false");
      Assert (Simp (Int (LLI'(0), Ctx) < Int (LLI'(10), Ctx)) = Bool (True, Ctx), "0 < 10 != true");
      Assert (Simp (Int (LLI'(2), Ctx) <= Int (LLI'(0), Ctx)) = Bool (False, Ctx), "2 <= 0 != false");
      Assert (Simp (Int (LLI'(0), Ctx) <= Int (LLI'(10), Ctx)) = Bool (True, Ctx), "0 <= 10 != true");
      Assert (Simp (Int (LLI'(3), Ctx) <= Int (LLI'(3), Ctx)) = Bool (True, Ctx), "3 <= 3 != true");
      Assert (Simp (Int (LLI'(0), Ctx) > Int (LLI'(2), Ctx)) = Bool (False, Ctx), "2 > 0 != false");
      Assert (Simp (Int (LLI'(10), Ctx) > Int (LLI'(0), Ctx)) = Bool (True, Ctx), "10 > 0 != true");
      Assert (Simp (Int (LLI'(0), Ctx) >= Int (LLI'(2), Ctx)) = Bool (False, Ctx), "0 >= 2 != false");
      Assert (Simp (Int (LLI'(10), Ctx) >= Int (LLI'(0), Ctx)) = Bool (True, Ctx), "10 >= 0 != true");
      Assert (Simp (Int (LLI'(3), Ctx) >= Int (LLI'(3), Ctx)) = Bool (True, Ctx), "3 >= 3 != true");
   end Test_Integer;

   ---------------------------------------------------------------------------

   procedure Test_Unsigned (Unused_T : in out Test_Cases.Test_Case'Class)
   is
   begin
      Assert (Simp (Int (LLU'(1), Ctx) = Int (LLU'(1), Ctx)) = Bool (True, Ctx), "1 != 1");
      Assert (Simp (Int (LLU'(1), Ctx) = Int (LLU'(2), Ctx)) = Bool (False, Ctx), "1 == 2");
      Assert (Simp (Int (LLU'(1), Ctx) /= Int (LLU'(2), Ctx)) = Bool (True, Ctx), "1 == 2");
      Assert (Simp (Int (LLU'(1), Ctx) /= Int (LLU'(1), Ctx)) = Bool (False, Ctx), "1 != 2");
      Assert (Simp (Int (LLU'(1), Ctx) + Int (LLU'(2), Ctx)) = Int (LLU'(3), Ctx), "1 + 2 != 3");
      Assert (Simp (Int (LLU'(1), Ctx) + Int (LLU'(2), Ctx) + Int (LLU'(3), Ctx))
              = Int (LLU'(6), Ctx), "1 + 2 + 3 != 6");
      Assert (Simp (Int (LLU'(1), Ctx) + Int (LLU'(2), Ctx) + Int (LLU'(3), Ctx) /= Int (LLU'(7), Ctx))
              = Bool (True, Ctx), "1 + 2 + 3 == 7");
      Assert (Simp (Int (LLU'(0), Ctx) + Int ("X", Ctx) = Int ("X", Ctx)) = Bool (True, Ctx), "0 + X != X");
      Assert (Simp (Int (LLU'(2), Ctx) * Int (LLU'(4), Ctx) = Int (LLU'(8), Ctx)) = Bool (True, Ctx), "2 * 4 != 8");
      Assert (Simp (Int (LLU'(0), Ctx) * Int (LLU'(124), Ctx) = Int (LLU'(0), Ctx))
              = Bool (True, Ctx), "0 * 124 != 0");
      Assert (Simp (Int (LLU'(0), Ctx) * Int ("X", Ctx) = Int (LLU'(0), Ctx)) = Bool (True, Ctx), "0 * X != 0");
      Assert (Simp (Int (LLU'(5), Ctx) - Int (LLU'(3), Ctx) = Int (LLU'(2), Ctx)) = Bool (True, Ctx), "5 - 3 != 2");
      Assert (Simp (Int (LLU'(5), Ctx) - Int (LLU'(30), Ctx) = Int (LLI'(-25), Ctx))
              = Bool (True, Ctx), "5 - 30 != 25");
      Assert (Simp (Int ("X", Ctx) - Int (LLU'(0), Ctx) = Int ("X", Ctx)) = Bool (True, Ctx), "X - 0 != X");
      Assert (Simp (Int (LLU'(6), Ctx) / Int (LLU'(2), Ctx) = Int (LLU'(3), Ctx)) = Bool (True, Ctx), "6 / 2 != 3");
      Assert (Simp (Int (LLU'(0), Ctx) / Int (LLU'(15), Ctx) = Int (LLU'(0), Ctx)) = Bool (True, Ctx), "0 / 15 != 0");
      Assert (Simp (Int (LLU'(10), Ctx) / Int (LLU'(3), Ctx) = Int (LLU'(3), Ctx)) = Bool (True, Ctx), "10 / 3 != 3");
      Assert (Simp (Int (LLU'(16), Ctx) mod Int (LLU'(8), Ctx) = Int (LLU'(0), Ctx))
              = Bool (True, Ctx), "16 % 8 != 0");
      Assert (Simp (Int (LLU'(17), Ctx) mod Int (LLU'(8), Ctx) = Int (LLU'(1), Ctx))
              = Bool (True, Ctx), "17 % 8 != 1");
      Assert (Simp (-Int (LLU'(5), Ctx) + Int (LLU'(5), Ctx) = Int (LLU'(0), Ctx)) = Bool (True, Ctx), "-5 + 5 != 0");
      Assert (Simp (Int (LLU'(2), Ctx) ** Int (LLU'(4), Ctx) = Int (LLU'(16), Ctx)) = Bool (True, Ctx), "2^4 != 16");
      Assert (Simp (Int (LLU'(2), Ctx) ** Int (LLU'(0), Ctx) = Int (LLU'(1), Ctx)) = Bool (True, Ctx), "2^0 != 1");
      Assert (Simp (Int (LLU'(2), Ctx) < Int (LLU'(0), Ctx)) = Bool (False, Ctx), "2 < 0 != false");
      Assert (Simp (Int (LLU'(0), Ctx) < Int (LLU'(10), Ctx)) = Bool (True, Ctx), "0 < 10 != true");
      Assert (Simp (Int (LLU'(2), Ctx) <= Int (LLU'(0), Ctx)) = Bool (False, Ctx), "2 <= 0 != false");
      Assert (Simp (Int (LLU'(0), Ctx) <= Int (LLU'(10), Ctx)) = Bool (True, Ctx), "0 <= 10 != true");
      Assert (Simp (Int (LLU'(3), Ctx) <= Int (LLU'(3), Ctx)) = Bool (True, Ctx), "3 <= 3 != true");
      Assert (Simp (Int (LLU'(0), Ctx) > Int (LLU'(2), Ctx)) = Bool (False, Ctx), "2 > 0 != false");
      Assert (Simp (Int (LLU'(10), Ctx) > Int (LLU'(0), Ctx)) = Bool (True, Ctx), "10 > 0 != true");
      Assert (Simp (Int (LLU'(0), Ctx) >= Int (LLU'(2), Ctx)) = Bool (False, Ctx), "0 >= 2 != false");
      Assert (Simp (Int (LLU'(10), Ctx) >= Int (LLU'(0), Ctx)) = Bool (True, Ctx), "10 >= 0 != true");
      Assert (Simp (Int (LLU'(3), Ctx) >= Int (LLU'(3), Ctx)) = Bool (True, Ctx), "3 >= 3 != true");
   end Test_Unsigned;

   ---------------------------------------------------------------------------

   procedure Test_Bit_Vector (Unused_T : in out Test_Cases.Test_Case'Class)
   is
   begin
      Assert (Simp (Bv (LLI'(1)) = Bv (LLI'(1))) = Bool (True, Ctx), "1 != 1");
      Assert (Simp (Bv (LLI'(1)) = Bv (LLI'(2))) = Bool (False, Ctx), "1 == 2");
      Assert (Simp (Bv (LLI'(1)) /= Bv (LLI'(2))) = Bool (True, Ctx), "1 == 2");
      Assert (Simp (Bv (LLI'(1)) /= Bv (LLI'(1))) = Bool (False, Ctx), "1 != 2");
      Assert (Simp (Bv (LLI'(1)) + Bv (LLI'(2))) = Bv (LLI'(3)), "1 + 2 != 3");
      Assert (Simp (Bv (LLI'(1)) + Bv (LLI'(2)) + Bv (LLI'(3))) = Bv (LLI'(6)), "1 + 2 + 3 != 6");
      Assert (Simp (Bv (LLI'(1)) + Bv (LLI'(2)) + Bv (LLI'(3)) /= Bv (LLI'(7))) = Bool (True, Ctx), "1 + 2 + 3 == 7");
      Assert (Simp (Bv (LLI'(0)) + Bv ("X") = Bv ("X")) = Bool (True, Ctx), "0 + X != X");
      Assert (Simp (Bv (LLI'(2)) * Bv (LLI'(4)) = Bv (LLI'(8))) = Bool (True, Ctx), "2 * 4 != 8");
      Assert (Simp (Bv (LLI'(0)) * Bv (LLI'(124)) = Bv (LLI'(0))) = Bool (True, Ctx), "0 * 124 != 0");
      Assert (Simp (Bv (LLI'(0)) * Bv ("X") = Bv (LLI'(0))) = Bool (True, Ctx), "0 * X != 0");
      Assert (Simp (Bv (LLI'(5)) - Bv (LLI'(3)) = Bv (LLI'(2))) = Bool (True, Ctx), "5 - 3 != 2");
      Assert (Simp (Bv (LLI'(5)) - Bv (LLI'(30)) = Bv (LLI'(-25))) = Bool (True, Ctx), "5 - 30 != 25");
      Assert (Simp (Bv ("X") - Bv (LLI'(0)) = Bv ("X")) = Bool (True, Ctx), "X - 0 != X");
      Assert (Simp (Bv (LLI'(6)) / Bv (LLI'(2)) = Bv (LLI'(3))) = Bool (True, Ctx), "6 / 2 != 3");
      Assert (Simp (Bv (LLI'(0)) / Bv (LLI'(15)) = Bv (LLI'(0))) = Bool (True, Ctx), "0 / 15 != 0");
      Assert (Simp (Bv (LLI'(10)) / Bv (LLI'(3)) = Bv (LLI'(3))) = Bool (True, Ctx), "10 / 3 != 3");
      Assert (Simp (Bv (LLI'(16)) mod Bv (LLI'(8)) = Bv (LLI'(0))) = Bool (True, Ctx), "16 % 8 != 0");
      Assert (Simp (Bv (LLI'(17)) mod Bv (LLI'(8)) = Bv (LLI'(1))) = Bool (True, Ctx), "17 % 8 != 1");
      Assert (Simp (-Bv (LLI'(5)) + Bv (LLI'(5)) = Bv (LLI'(0))) = Bool (True, Ctx), "-5 + 5 != 0");
      Assert (Simp (Bv (LLI'(2)) < Bv (LLI'(0))) = Bool (False, Ctx), "2 < 0 != false");
      Assert (Simp (Bv (LLI'(0)) < Bv (LLI'(10))) = Bool (True, Ctx), "0 < 10 != true");
      Assert (Simp (Bv (LLI'(2)) <= Bv (LLI'(0))) = Bool (False, Ctx), "2 <= 0 != false");
      Assert (Simp (Bv (LLI'(0)) <= Bv (LLI'(10))) = Bool (True, Ctx), "0 <= 10 != true");
      Assert (Simp (Bv (LLI'(3)) <= Bv (LLI'(3))) = Bool (True, Ctx), "3 <= 3 != true");
      Assert (Simp (Bv (LLI'(0)) > Bv (LLI'(2))) = Bool (False, Ctx), "2 > 0 != false");
      Assert (Simp (Bv (LLI'(10)) > Bv (LLI'(0))) = Bool (True, Ctx), "10 > 0 != true");
      Assert (Simp (Bv (LLI'(0)) >= Bv (LLI'(2))) = Bool (False, Ctx), "0 >= 2 != false");
      Assert (Simp (Bv (LLI'(10)) >= Bv (LLI'(0))) = Bool (True, Ctx), "10 >= 0 != true");
      Assert (Simp (Bv (LLI'(3)) >= Bv (LLI'(3))) = Bool (True, Ctx), "3 >= 3 != true");
      Assert (Bv (Int (LLI'(20), Ctx)) = Bv (LLI'(20)), "Invalid bit vector conversion from int");
   end Test_Bit_Vector;

   ---------------------------------------------------------------------------

   procedure Test_Unsigned_Bit_Vector (Unused_T : in out Test_Cases.Test_Case'Class)
   is
   begin
      Assert (Simp (Bv (LLU'(1)) = Bv (LLU'(1))) = Bool (True, Ctx), "1 != 1");
      Assert (Simp (Bv (LLU'(1)) = Bv (LLU'(2))) = Bool (False, Ctx), "1 == 2");
      Assert (Simp (Bv (LLU'(1)) /= Bv (LLU'(2))) = Bool (True, Ctx), "1 == 2");
      Assert (Simp (Bv (LLU'(1)) /= Bv (LLU'(1))) = Bool (False, Ctx), "1 != 2");
      Assert (Simp (Bv (LLU'(1)) + Bv (LLU'(2))) = Bv (LLU'(3)), "1 + 2 != 3");
      Assert (Simp (Bv (LLU'(1)) + Bv (LLU'(2)) + Bv (LLU'(3))) = Bv (LLU'(6)), "1 + 2 + 3 != 6");
      Assert (Simp (Bv (LLU'(1)) + Bv (LLU'(2)) + Bv (LLU'(3)) /= Bv (LLU'(7))) = Bool (True, Ctx), "1 + 2 + 3 == 7");
      Assert (Simp (Bv (LLU'(0)) + Bv ("X") = Bv ("X")) = Bool (True, Ctx), "0 + X != X");
      Assert (Simp (Bv (LLU'(2)) * Bv (LLU'(4)) = Bv (LLU'(8))) = Bool (True, Ctx), "2 * 4 != 8");
      Assert (Simp (Bv (LLU'(0)) * Bv (LLU'(124)) = Bv (LLU'(0))) = Bool (True, Ctx), "0 * 124 != 0");
      Assert (Simp (Bv (LLU'(0)) * Bv ("X") = Bv (LLU'(0))) = Bool (True, Ctx), "0 * X != 0");
      Assert (Simp (Bv (LLU'(5)) - Bv (LLU'(3)) = Bv (LLU'(2))) = Bool (True, Ctx), "5 - 3 != 2");
      Assert (Simp (Bv (LLU'(5)) - Bv (LLU'(30)) = Bv (LLI'(-25))) = Bool (True, Ctx), "5 - 30 != 25");
      Assert (Simp (Bv ("X") - Bv (LLU'(0)) = Bv ("X")) = Bool (True, Ctx), "X - 0 != X");
      Assert (Simp (Bv (LLU'(6)) / Bv (LLU'(2)) = Bv (LLU'(3))) = Bool (True, Ctx), "6 / 2 != 3");
      Assert (Simp (Bv (LLU'(0)) / Bv (LLU'(15)) = Bv (LLU'(0))) = Bool (True, Ctx), "0 / 15 != 0");
      Assert (Simp (Bv (LLU'(10)) / Bv (LLU'(3)) = Bv (LLU'(3))) = Bool (True, Ctx), "10 / 3 != 3");
      Assert (Simp (Bv (LLU'(16)) mod Bv (LLU'(8)) = Bv (LLU'(0))) = Bool (True, Ctx), "16 % 8 != 0");
      Assert (Simp (Bv (LLU'(17)) mod Bv (LLU'(8)) = Bv (LLU'(1))) = Bool (True, Ctx), "17 % 8 != 1");
      Assert (Simp (-Bv (LLU'(5)) + Bv (LLU'(5)) = Bv (LLU'(0))) = Bool (True, Ctx), "-5 + 5 != 0");
      Assert (Simp (Bv (LLU'(2)) < Bv (LLU'(0))) = Bool (False, Ctx), "2 < 0 != false");
      Assert (Simp (Bv (LLU'(0)) < Bv (LLU'(10))) = Bool (True, Ctx), "0 < 10 != true");
      Assert (Simp (Bv (LLU'(2)) <= Bv (LLU'(0))) = Bool (False, Ctx), "2 <= 0 != false");
      Assert (Simp (Bv (LLU'(0)) <= Bv (LLU'(10))) = Bool (True, Ctx), "0 <= 10 != true");
      Assert (Simp (Bv (LLU'(3)) <= Bv (LLU'(3))) = Bool (True, Ctx), "3 <= 3 != true");
      Assert (Simp (Bv (LLU'(0)) > Bv (LLU'(2))) = Bool (False, Ctx), "2 > 0 != false");
      Assert (Simp (Bv (LLU'(10)) > Bv (LLU'(0))) = Bool (True, Ctx), "10 > 0 != true");
      Assert (Simp (Bv (LLU'(0)) >= Bv (LLU'(2))) = Bool (False, Ctx), "0 >= 2 != false");
      Assert (Simp (Bv (LLU'(10)) >= Bv (LLU'(0))) = Bool (True, Ctx), "10 >= 0 != true");
      Assert (Simp (Bv (LLU'(3)) >= Bv (LLU'(3))) = Bool (True, Ctx), "3 >= 3 != true");
      Assert (Simp (Add (Bv (LLU'(1)) & Bv (LLU'(3)) & Bv (LLI'(-2)))) = Bv (LLU'(2)), "1 + 3 - 2 /= 2");
      Assert (Simp (Mul (Bv (LLU'(1)) & Bv (LLU'(3)) & Bv (LLI'(4)))) = Bv (LLU'(12)), "1 * 3 * 4 /= 12 ");
      Assert (Bv (Int (LLU'(20), Ctx)) = Bv (LLU'(20)), "Invalid bit vector conversion from int");
   end Test_Unsigned_Bit_Vector;

   ---------------------------------------------------------------------------

   procedure Test_Solver (Unused_T : in out Test_Cases.Test_Case'Class)
   is
      S : Solver := Create (Ctx);
   begin
      S.Assert (Bool (False, Ctx));
      Assert (S.Check = Result_False, "false not checked as false");
      S.Reset;
      S.Assert (Bool (True, Ctx));
      Assert (S.Check = Result_True, "true not checked as true");
      S.Reset;
      S.Assert (Bool ("X", Ctx) and not Bool ("X", Ctx));
      Assert (S.Check = Result_False, "X and not X not check as false");
      S.Reset;
      S.Assert (Bool ("X", Ctx) or not Bool ("X", Ctx));
      Assert (S.Check = Result_True, "X or not X not check as true");
      S.Reset;
      S.Assert (Int ("X", Ctx) < Int (LLI'(3), Ctx) and Int ("X", Ctx) > Int (LLI'(100), Ctx));
      Assert (S.Check = Result_False, "contradiction not found");
      S.Reset;
      S.Assert (Int ("X", Ctx) >= Int (LLI'(3), Ctx) and Int ("X", Ctx) <= Int (LLI'(100), Ctx));
      Assert (S.Check = Result_True, "X >= 3 and X <= 100 not checked as true");
      S.Reset;
      S.Assert (Int (Int ("X", Ctx) ** Int ("Y", Ctx)) >= Int ("X", Ctx));
      Assert (S.Check = Result_Undef, "expected Undef");
   end Test_Solver;

   ---------------------------------------------------------------------------

   procedure Incompatible_Context
   is
      C1     : Context;
      Result : constant Bool_Type := Bool (True, Ctx) = Bool (False, C1);
   begin
      pragma Unreferenced (Result);
   end Incompatible_Context;

   procedure Test_Conflicting_Contexts (Unused_T : in out Test_Cases.Test_Case'Class)
   is
   begin
      Assert_Exception (Incompatible_Context'Access,
                        "Incompatible contexts not detected");
   end Test_Conflicting_Contexts;

   ---------------------------------------------------------------------------

   procedure Test_String_Representation (Unused_T : in out Test_Cases.Test_Case'Class)
   is
   begin
      Assert (+Int (LLI'(234), Ctx) = "234", "invalid boolean string representation");
      Assert (+(Int (LLI'(7), Ctx) + Int (LLI'(15), Ctx)) = "(+ 7 15)", "invalid integer string representation");
      Assert (+Bool (True, Ctx) = "true", "invalid boolean string representation");
      Assert (+(Bool ("X", Ctx) or Bool ("Y", Ctx)) = "(or X Y)", "invalid boolean string representation");
   end Test_String_Representation;

   ---------------------------------------------------------------------------

   procedure Value_Of_Addition
   is
      I      : constant Int_Type := Int (LLI'(-1000), Ctx) + Int (LLI'(5000), Ctx);
      Unused : constant Long_Long_Integer := I.Value;
   begin
      null; --  GCOV_EXCL_LINE
   end Value_Of_Addition;

   procedure Negative_Unsigned
   is
      Unused : constant LLU := Int (LLI'(-1), Ctx).Value;
   begin
      null; --  GCOV_EXCL_LINE
   end Negative_Unsigned;

   procedure Negative_Bit_Vector
   is
      Unused : constant LLU := Bv (LLI'(-1)).Value;
   begin
      null; --  GCOV_EXCL_LINE
   end Negative_Bit_Vector;

   procedure Test_Value (Unused_T : in out Test_Cases.Test_Case'Class)
   is
   begin
      Assert (Int (LLI'(234), Ctx).Value = LLI'(234), "invalid integer value");
      Assert (Int (LLI'(-1234567), Ctx).Value = LLI'(-1234567), "invalid negative integer value");
      Assert (Int (LLI'(0), Ctx).Value = LLI'(0), "invalid zero integer value");
      Assert (Int (LLI'First, Ctx).Value = LLI'First, "invalid first integer value");
      Assert (Int (LLI'Last, Ctx).Value = LLI'Last, "invalid last integer value");
      Assert_Exception (Value_Of_Addition'Access, "value of addition raised no error");
      Assert (Int (LLU'(234), Ctx).Value = LLU'(234), "invalid unsigned value");
      Assert (Int (LLU'(0), Ctx).Value = LLU'(0), "invalid zero unsigned value");
      Assert (Int (LLU'First, Ctx).Value = LLU'First, "invalid first unsigned value");
      Assert (Int (LLU'Last, Ctx).Value = LLU'Last, "invalid last unsigned value");
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

   procedure Test_Substitute (Unused_T : in out Test_Cases.Test_Case'Class)
   is
      Expr     : Bool_Type := Int (LLI'(1), Ctx) < Int ("A", Ctx);
      Expected : Bool_Type := Int (LLI'(1), Ctx) < Int ("B", Ctx);
      Result   : Bool_Type := Bool (Substitute (Expr, Int ("A", Ctx), Int ("B", Ctx)));
   begin
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Result   := Bool (Substitute (Expr, Int_Array'(1 => Int ("A", Ctx)), Int_Array'(1 => Int ("B", Ctx))));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Expr     := Bool (False, Ctx) or Bool ("A", Ctx);
      Expected := Bool (False, Ctx) or Bool ("B", Ctx);
      Result   := Bool (Substitute (Expr, Bool ("A", Ctx), Bool ("B", Ctx)));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Result   := Bool (Substitute (Expr, Bool_Array'(1 => Bool ("A", Ctx)), Bool_Array'(1 => Bool ("B", Ctx))));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Expected := Expr;
      Result   := Bool (Substitute (Expr,
                                    Bool_Array'(2 .. 1 => Bool (False, Ctx)), -- GCOV_EXCL_LINE
                                    Bool_Array'(2 .. 1 => Bool (True, Ctx))));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Expr     := Bool (False, Ctx) or Bool ("A", Ctx) or Bool ("B", Ctx);
      Expected := Bool (False, Ctx) or Bool ("C", Ctx) or Bool (False, Ctx);
      Result   := Bool (Substitute (Expr, Bool ("A", Ctx) & Bool ("B", Ctx), Bool ("C", Ctx) & Bool (False, Ctx)));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Expr     := Int (LLI'(1), Ctx) + Int ("A", Ctx) < Int ("B", Ctx);
      Expected := Int (LLI'(1), Ctx) + Int ("C", Ctx) < Int (LLI'(42), Ctx);
      Result   := Bool (Substitute (Expr, Int ("A", Ctx) & Int ("B", Ctx), Int ("C", Ctx) & Int (LLI'(42), Ctx)));
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
      Expr     := Bool ("A", Ctx);
      Expected := Bool ("A", Ctx);
      Result   := Bool (Substitute (Expr, Int_Array'(1 .. 0 => <>), Int_Array'(1 .. 0 => <>)));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
      Result   := Bool (Substitute (Expr, Bit_Vector_Array'(1 .. 0 => <>), Bit_Vector_Array'(1 .. 0 => <>)));
      Assert (Result = Expected, "subsitute failed: " & "+"(Result) & " /= " & "+"(Expected));
   end Test_Substitute;

   ---------------------------------------------------------------------------

   procedure Term_Out_Of_Bounds
   is
      Unused : Int_Type := Int ("A", Ctx) + Int ("B", Ctx);
   begin
      Unused := Int (Term (Unused, 2));
   end Term_Out_Of_Bounds;

   procedure Test_Terms (Unused_T : in out Test_Cases.Test_Case'Class)
   is
      I_Arg_1 : constant Int_Type   := Int ("A", Ctx);
      I_Arg_2 : constant Int_Type   := Int ("B", Ctx);
      I_Arg_3 : constant Int_Type   := Int (LLU'(2), Ctx);
      B_Arg_1 : constant Bool_Type  := Bool ("A", Ctx);
      B_Arg_2 : constant Bool_Type  := Bool ("B", Ctx);
      B_Arg_3 : constant Bool_Type  := Bool (True, Ctx);
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
      Assert (Terms (Int (LLU'(0), Ctx)) = 0, "invalid argument count 0");
      Assert (Terms (Bool (True, Ctx)) = 0, "invalid argument count True");
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

   procedure Test_Kind (Unused_T : in out Test_Cases.Test_Case'Class)
   is
   begin
      Assert (Kind (Bool (True, Ctx)) = Kind_Constant, "invalid bool constant");
      Assert (Kind (Bool (False, Ctx)) = Kind_Constant, "invalid bool constant");
      Assert (Kind (Int (LLU'(1), Ctx)) = Kind_Constant, "invalid int constant");
      Assert (Kind (Bv (LLU'(1))) = Kind_Constant, "invalid bit vector constant");
      Assert (Kind (Bool ("A", Ctx)) = Kind_Var, "invalid bool var " & Kind (Bool ("A", Ctx))'Img);
      Assert (Kind (Int ("A", Ctx)) = Kind_Var, "invalid int var " & Kind (Int ("A", Ctx))'Img);
      Assert (Kind (Bv ("A")) = Kind_Var, "invalid bit vector var" & Kind (Bv ("A"))'Img);
      Assert (Kind (Int ("A", Ctx) = Int ("B", Ctx)) = Kind_Equal, "invalid int equal");
      Assert (Kind (Bool ("A", Ctx) = Bool ("B", Ctx)) = Kind_Equal, "invalid bool equal");
      Assert (Kind (Int ("A", Ctx) >= Int ("B", Ctx)) = Kind_Greater_Equal, "invalid greater equal");
      Assert (Kind (Int ("A", Ctx) > Int ("B", Ctx)) = Kind_Greater_Than, "invalid greater than");
      Assert (Kind (Int ("A", Ctx) <= Int ("B", Ctx)) = Kind_Less_Equal, "invalid less equal");
      Assert (Kind (Int ("A", Ctx) < Int ("B", Ctx)) = Kind_Less_Than, "invalid less than");
      Assert (Kind (Bv ("A") >= Bv ("B")) = Kind_Greater_Equal, "invalid greater equal");
      Assert (Kind (Bv ("A") > Bv ("B")) = Kind_Greater_Than, "invalid greater than");
      Assert (Kind (Bv ("A") <= Bv ("B")) = Kind_Less_Equal, "invalid less equal");
      Assert (Kind (Bv ("A") < Bv ("B")) = Kind_Less_Than, "invalid less than");
      Assert (Kind (Bool ("A", Ctx) and Bool ("B", Ctx)) = Kind_And, "invalid and");
      Assert (Kind (Conjunction (Bool ("A", Ctx) & Bool ("B", Ctx) & Bool ("C", Ctx))) = Kind_And,
              "invalid conjunction");
      Assert (Kind (Bool ("A", Ctx) or Bool ("B", Ctx)) = Kind_Or, "invalid or");
      Assert (Kind (Disjunction (Bool ("A", Ctx) & Bool ("B", Ctx) & Bool ("C", Ctx))) = Kind_Or,
              "invalid disjunction");
      Assert (Kind (not Bool ("A", Ctx)) = Kind_Not, "invalid not");
      Assert (Kind (Int ("A", Ctx) + Int ("B", Ctx)) = Kind_Add, "invalid add");
      Assert (Kind (Add (Int ("A", Ctx) & Int ("B", Ctx) & Int ("C", Ctx))) = Kind_Add,
              "invalid add (multiple)");
      Assert (Kind (Int ("A", Ctx) * Int ("B", Ctx)) = Kind_Mul, "invalid mul");
      Assert (Kind (Mul (Int ("A", Ctx) & Int ("B", Ctx) & Int ("C", Ctx))) = Kind_Mul,
              "invalid mul (multiple)");
      Assert (Kind (Int ("A", Ctx) - Int ("B", Ctx)) = Kind_Sub, "invalid sub");
      Assert (Kind (Int ("A", Ctx) / Int ("B", Ctx)) = Kind_Div, "invalid div");
      Assert (Kind (Int ("A", Ctx) mod Int ("B", Ctx)) = Kind_Mod, "invalid mod");
      Assert (Kind (Int ("A", Ctx) ** Int ("B", Ctx)) = Kind_Power, "invalid power");
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

   procedure Test_Optimize (Unused_T : in out Test_Cases.Test_Case'Class)
   is
      Optimize : Z3.Optimize := Create (Ctx);
      Result   : Z3.Result;
   begin
      Optimize.Set_Timeout (100);
      Optimize.Assert (Int (Int ("X", Ctx) ** Int ("Y", Ctx)) >= Int ("X", Ctx));
      Optimize.Check (Result);
      Assert (Result = Result_Undef, "Optimize not undef");
      Optimize.Assert (Int ("X", Ctx) < Int (LLU'(3), Ctx) and Int ("X", Ctx) > Int (LLU'(100), Ctx));
      Optimize.Check (Result);
      Assert (Result = Result_False, "contradiction not found");
      Optimize.Reset;
      Optimize.Assert ((Int ("A", Ctx) >= Int (LLU'(10), Ctx))
                       and (Int ("A", Ctx) < Int (LLU'(50), Ctx)));
      Optimize.Assert ((Int ("B", Ctx) >= Int (LLU'(20), Ctx))
                       and (Int ("B", Ctx) <= Int (LLU'(42), Ctx)));
      Optimize.Minimize (Int ("A", Ctx));
      Optimize.Maximize (Int ("B", Ctx));
      Optimize.Check (Result);
      Assert (Result = Result_True, "Optimize not sat");
      Assert (Sort (Optimize.Lower (Int ("A", Ctx))) = Sort_Int, "Invalid sort");
      Assert (Sort (Optimize.Upper (Int ("B", Ctx))) = Sort_Int, "Invalid sort");
      Assert (Int (Optimize.Lower (Int ("A", Ctx))) = Int (LLU'(10), Ctx), "Invalid lower");
      Assert (Int (Optimize.Upper (Int ("B", Ctx))) = Int (LLU'(42), Ctx), "Invalid upper");
      Optimize.Assert (Int ("C", Ctx) > Int (LLU'(100), Ctx));
      Optimize.Maximize (Int ("C", Ctx));
      Optimize.Check (Result);
      Assert (Result = Result_True, "Optimize not sat ");
      Assert (Kind (Optimize.Lower (Int ("C", Ctx))) /= Kind_Constant, "Invalid constant result");
      Optimize.Reset;
      Optimize.Assert (Int ("C", Ctx) < Int (LLU'(100), Ctx));
      Optimize.Minimize (Int ("C", Ctx));
      Optimize.Check (Result);
      Assert (Result = Result_True, "Optimize not sat ");
      Assert (Kind (Optimize.Upper (Int ("C", Ctx))) /= Kind_Constant, "Invalid constant result");
      Optimize.Reset;
      Optimize.Assert ((Bv ("A") >= Bv (LLU'(10)))
                       and (Bv ("A") < Bv (LLU'(50))));
      Optimize.Minimize (Bv ("A"));
      Optimize.Check (Result);
      Assert (Result = Result_True, "Optimize not sat");
      Assert (Sort (Optimize.Lower (Bv ("A"))) = Sort_Int,
              "Invalid sort " & Sort (Optimize.Lower (Bv ("A")))'Img);
      Assert (Int (Optimize.Lower (Bv ("A"))) = Int (LLU'(10), Ctx), "Invalid lower");
   end Test_Optimize;

   ---------------------------------------------------------------------------

   procedure Optimize_Invalid_Pop
   is
      Optimize : Z3.Optimize := Create (Ctx);
   begin
      Optimize.Push;
      Optimize.Pop;
      Optimize.Pop;
   end Optimize_Invalid_Pop;

   procedure Test_Optimize_Backtrack (Unused_T : in out Test_Cases.Test_Case'Class)
   is
      Optimize : Z3.Optimize := Create (Ctx);
      Result   : Z3.Result;
   begin
      Optimize.Assert (Int ("X", Ctx) < Int (LLU'(100), Ctx));
      Optimize.Push;
      Optimize.Assert (Int ("X", Ctx) < Int (LLU'(20), Ctx));
      Optimize.Maximize (Int ("X", Ctx));
      Optimize.Check (Result);
      Assert (Result = Result_True, "Invalid result");
      Assert (Int (Optimize.Upper (Int ("X", Ctx))) = Int (LLU'(19), Ctx), "Invalid optimize value");
      Optimize.Pop;
      Optimize.Maximize (Int ("X", Ctx));
      Optimize.Check (Result);
      Assert (Result = Result_True, "Invalid result");
      Assert (Int (Optimize.Upper (Int ("X", Ctx))) = Int (LLU'(99), Ctx), "Invalid optimize value");
      Optimize.Push;
      Optimize.Reset;
      Assert_Exception (Optimize_Invalid_Pop'Access, "Too many pops not detected");
   end Test_Optimize_Backtrack;

   ---------------------------------------------------------------------------

   procedure Test_Optimize_Multiple_Values (Unused_T : in out Test_Cases.Test_Case'Class)
   is
      Optimize           : Z3.Optimize        := Create (Ctx);
      Result             : Z3.Result;
      Objective          : constant Int_Type  := Int ("A", Ctx) - Int ("B", Ctx);
      Expected_Constants : constant Int_Array := Int ("A", Ctx) & Int ("B", Ctx);
      Expected_Values    : constant Int_Array := Int (LLU'(99), Ctx) & Int (LLU'(11), Ctx);
   begin
      Optimize.Assert (Int ("A", Ctx) > Int ("B", Ctx));
      Optimize.Assert (Int ("B", Ctx) > Int (LLU'(10), Ctx));
      Optimize.Assert (Int ("A", Ctx) < Int (LLU'(100), Ctx));
      Optimize.Maximize (Objective);
      Optimize.Check (Result);
      Assert (Result = Result_True, "Invalid result");
      Assert (Int (Optimize.Upper (Objective)) = Int (LLU'(88), Ctx), "Invalid maximiize value");
      declare
         Constant_Count : constant Natural := Optimize.Get_Number_Of_Values;
         Constants      : Int_Array (1 .. Constant_Count);
         Values         : Int_Array (1 .. Constant_Count);
      begin
         Optimize.Get_Values (Constants, Values);
         Assert (Constants = Expected_Constants, "Invalid constants");
         Assert (Values = Expected_Values, "Invalid values");
      end;  --  GCOV_EXCL_LINE
   end Test_Optimize_Multiple_Values;

   ---------------------------------------------------------------------------

   procedure Test_Optimize_String (Unused_T : in out Test_Cases.Test_Case'Class)
   is
      Optimize        : Z3.Optimize := Create (Ctx);
      Ignore_Result   : Z3.Result;
      Image           : constant String :=
         "(declare-fun X () Int)" & ASCII.LF
         & "(assert (< X 100))" & ASCII.LF
         & "(maximize X)" & ASCII.LF
         & "(check-sat)" & ASCII.LF;
   begin
      Optimize.Assert (Int ("X", Ctx) < Int (LLU'(100), Ctx));
      Optimize.Maximize (Int ("X", Ctx));
      Optimize.Check (Ignore_Result);
      Assert ("+" (Optimize), Image, "Invalid image");
   end Test_Optimize_String;

   ---------------------------------------------------------------------------

   procedure Invalid_Bool
   is
      B      : constant Expr_Type'Class := Bool ("B", Ctx);
      Ignore : Int_Type;
   begin
      Ignore := Int (B);
   end Invalid_Bool;

   procedure Invalid_Int
   is
      I      : constant Expr_Type'Class := Int ("I", Ctx);
      Ignore : Bool_Type;
   begin
      Ignore := Bool (I);
   end Invalid_Int;

   procedure Test_Sort (Unused_T : in out Test_Cases.Test_Case'Class)
   is
      B : constant Expr_Type'Class := Bool ("B", Ctx);
      I : constant Expr_Type'Class := Int ("I", Ctx);
   begin
      Assert (Int ("A", Ctx).Sort = Sort_Int, "Invalid int sort");
      Assert (Int (LLU'(1), Ctx).Sort = Sort_Int, "Invalid int sort");
      Assert (Bool ("A", Ctx).Sort = Sort_Bool, "Invalid bool sort");
      Assert (Bool (True, Ctx).Sort = Sort_Bool, "Invalid bool sort");
      Assert (B.Sort = Sort_Bool, "Invalid bool sort");
      Assert (I.Sort = Sort_Int, "Invalid int sort");
      Assert_Exception (Invalid_Bool'Access, "Invalid bool conversion not detected");
      Assert_Exception (Invalid_Int'Access, "Invalid int conversion not detected");
   end Test_Sort;

   procedure Test_Invalid_Big_Int_Base_16
   is
      Ignore : Int_Type;
   begin
      Ignore := Big_Int ("1234_ABCD_EFG", 16, Ctx);
   end Test_Invalid_Big_Int_Base_16; --  GCOV_EXCL_LINE

   procedure Test_Invalid_Big_Int_Base_8
   is
      Ignore : Int_Type;
   begin
      Ignore := Big_Int ("43583912", 8, Ctx);
   end Test_Invalid_Big_Int_Base_8; --  GCOV_EXCL_LINE

   procedure Test_Invalid_Big_Int_Base_2
   is
      Ignore : Int_Type;
   begin
      Ignore := Big_Int ("110011104111", 2, Ctx);
   end Test_Invalid_Big_Int_Base_2; --  GCOV_EXCL_LINE

   procedure Test_Invalid_Big_Int_Leading_Underscore
   is
      Ignore : Int_Type;
   begin
      Ignore := Big_Int ("_a53f_ffff_912e", 16, Ctx);
   end Test_Invalid_Big_Int_Leading_Underscore; --  GCOV_EXCL_LINE

   procedure Test_Invalid_Big_Int_Trailing_Underscore
   is
      Ignore : Int_Type;
   begin
      Ignore := Big_Int ("a53f_ffff_912e_", 16, Ctx);
   end Test_Invalid_Big_Int_Trailing_Underscore; --  GCOV_EXCL_LINE

   procedure Test_Invalid_Big_Int_Double_Underscore
   is
      Ignore : Int_Type;
   begin
      Ignore := Big_Int ("a53f__ffff_912e", 16, Ctx);
   end Test_Invalid_Big_Int_Double_Underscore; --  GCOV_EXCL_LINE

   procedure Test_Big_Int (Unused_T : in out Test_Cases.Test_Case'Class)
   is
   begin
      Assert (Big_Int ("0", Ctx) = Int (LLU'(0), Ctx), "Invalid big integer (0)");
      Assert (Big_Int ("1", Ctx) = Int (LLU'(1), Ctx), "Invalid big integer (1)");
      Assert (Big_Int ("42", Ctx) = Int (LLU'(42), Ctx), "Invalid big integer (42)");
      Assert (Big_Int ("FFFF_FFFF_FFFF_FFFF", 16, Ctx) = Int (LLU'(16#FFFF_FFFF_FFFF_FFFF#), Ctx),
              "Invalid big integer (2^64-1, upper case)");
      Assert (Big_Int ("ffff_ffff_ffff_ffff", 16, Ctx) = Int (LLU'(16#FFFF_FFFF_FFFF_FFFF#), Ctx),
              "Invalid big integer (2^64-1, lower case)");
      Assert (Simp ((Big_Int ("FFFF_FFFF_FFFF_FFFF_FFFF", 16, Ctx) + Int (LLU'(1), Ctx))
                     / Int (LLU'(16#10_0000#), Ctx))
              = Int (LLU'(16#1000_0000_0000_0000#), Ctx),
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

   procedure Test_Logic (Unused_T : in out Test_Cases.Test_Case'Class)
   is
      procedure Test_Create (Logic : Solver_Logic)
      is
         Ignore_Solver : constant Solver := Create (Ctx, Logic);
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

   procedure Test_Real (Unused_T : in out Test_Cases.Test_Case'Class)
   is
   begin
      Assert (Sort (Real ("A", Ctx)) = Sort_Real, "Invalid sort for Real");
      Assert (Real (1, Ctx) = Simplified (Real (Int (LLU'(1), Ctx))), "Real (1) /= Real (Int (1))");
      Assert (Simplified (Int (Real (1, Ctx))) = Int (LLU'(1), Ctx), "Int (Real (1)) /= Int (1)");
      Assert (Value (Simplified (Is_Int (Real (1, Ctx)))) = Result_True, "Invalid int");
      Assert (Value (Simplified (Is_Int (Real (1, 2, Ctx)))) = Result_False, "Invalid fraction");
      Assert (Value (Simplified (Is_Int (Real ("A", Ctx)))) = Result_Undef, "Invalid undef");
      Assert (Int (LLU'(1), Ctx) = Simplified (Int (Real (3, 2, Ctx))), "Invalid conversion");
   end Test_Real;

   ---------------------------------------------------------------------------

   --  This test doesn't have assertions as it only tests assignments and scoping
   --  of the types that implement reference counting. It is checked by the
   --  address sanitizer.
   procedure Test_Reference_Counting (Unused_T : in out Test_Cases.Test_Case'Class)
   is
      Context  : Z3.Context;
      Solver   : constant Z3.Solver   := Create (Context);
      Optimize : constant Z3.Optimize := Create (Context);

      procedure Copy_Ctx (Local_Ctx : Z3.Context)
      is
         Ctx2          : Z3.Context;
         Solver        : Z3.Solver := Create (Context);
         Unused_Result : Result;
      begin
         Ctx2 := Local_Ctx;
         pragma Inspection_Point (Ctx2);
         Solver.Assert (Bool ("A", Context));
         Unused_Result := Solver.Check;
      end Copy_Ctx;
      procedure Copy_Solver (Local_Solver : Z3.Solver)
      is
         Solver2 : Z3.Solver := Create (Context);
      begin
         Solver2 := Local_Solver;
         pragma Inspection_Point (Solver2);
      end Copy_Solver;
      procedure Copy_Optimize (Local_Optimize : Z3.Optimize)
      is
         Optimize2 : Z3.Optimize := Create (Context);
      begin
         Optimize2 := Local_Optimize;
         pragma Inspection_Point (Optimize2);
      end Copy_Optimize;
   begin
      Copy_Ctx (Context);
      Copy_Solver (Solver);
      Copy_Optimize (Optimize);
   end Test_Reference_Counting;

   ---------------------------------------------------------------------------

   overriding
   procedure Register_Tests (T : in out Test_Case)
   is
      use AUnit.Test_Cases.Registration;
   begin
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
      Register_Routine (T, Test_Optimize_Backtrack'Access, "Optimize Backtrack");
      Register_Routine (T, Test_Optimize_Multiple_Values'Access, "Optimize Multiple Values");
      Register_Routine (T, Test_Optimize_String'Access, "Optimize String");
      Register_Routine (T, Test_Sort'Access, "Sort");
      Register_Routine (T, Test_Big_Int'Access, "Big Integer");
      Register_Routine (T, Test_Logic'Access, "Logic");
      Register_Routine (T, Test_Real'Access, "Real");
      Register_Routine (T, Test_Reference_Counting'Access, "Reference Counting");
   end Register_Tests;

   ---------------------------------------------------------------------------

   overriding
   function Name (T : Test_Case) return Test_String
   is
   begin
      return Format ("Z3 Tests");
   end Name;

end Z3.Tests;
