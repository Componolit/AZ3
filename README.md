# AZ3 - Z3 Binding for Ada

AZ3 is an Ada binding to the [Z3 theorem prover](https://github.com/Z3Prover/z3).

NOTE: **This binding is not complete, yet. If you are missing a feature, feel free to open an issue or contribute through a pull request on GitHub.**

# Usage

```Ada
with Ada.Text_IO; use Ada.Text_IO;
with Z3; use Z3;

procedure Use_Z3
is
   S : Solver := Create;
begin
   S.Assert (Int ("X") < Int (3) and Int ("X") > Int (100));
   if S.Check = Result_False then
      Put_Line ("Contradiction found");
   end if;
end Use_Z3;
```

# Background

The thin-binding was extracted from the Z3 sources using

```
$ gcc -fdump-ada-spec -c z3/z3/src/api/z3.h
```

GNAT version:

```
$ gcc --version
gcc (GCC) 9.3.1 20200430 (for GNAT Community 2020 20200429)
Copyright (C) 2019 Free Software Foundation, Inc.
```

# License

MIT License (same as Z3). See LICENSE.txt for details.
