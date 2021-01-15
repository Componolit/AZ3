with Z3.Tests;

package body AZ3_Suite is

   use AUnit.Test_Suites;

   --  Statically allocate test suite:
   Result : aliased Test_Suite;

   --  Statically allocate test cases:
   Z3_Tests : aliased Z3.Tests.Test_Case;

   function Suite return Access_Test_Suite is
   begin
      Add_Test (Result'Access, Z3_Tests'Access);
      return Result'Access;
   end Suite;

end AZ3_Suite;
