with AUnit; use AUnit;
with AUnit.Test_Cases; use AUnit.Test_Cases;

package AZ3_Tests is

   type Test_Case is new Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests (T : in out Test_Case);
   --  Register routines to be run

   overriding
   function Name (T : Test_Case) return Message_String;
   --  Provide name identifying the test case

end AZ3_Tests;
