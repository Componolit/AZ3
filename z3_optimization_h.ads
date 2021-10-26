pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with z3_api_h;
with System;

package z3_optimization_h is

   --  skipped function type Z3_model_eh

   function Z3_mk_optimize (c : z3_api_h.Z3_context) return z3_api_h.Z3_optimize  -- z3/z3/src/api/z3_optimization.h:43
   with Import => True,
        Convention => C,
        External_Name => "Z3_mk_optimize";

   procedure Z3_optimize_inc_ref (c : z3_api_h.Z3_context; d : z3_api_h.Z3_optimize)  -- z3/z3/src/api/z3_optimization.h:50
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_inc_ref";

   procedure Z3_optimize_dec_ref (c : z3_api_h.Z3_context; d : z3_api_h.Z3_optimize)  -- z3/z3/src/api/z3_optimization.h:57
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_dec_ref";

   procedure Z3_optimize_assert
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      a : z3_api_h.Z3_ast)  -- z3/z3/src/api/z3_optimization.h:67
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_assert";

   procedure Z3_optimize_assert_and_track
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      a : z3_api_h.Z3_ast;
      t : z3_api_h.Z3_ast)  -- z3/z3/src/api/z3_optimization.h:78
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_assert_and_track";

   function Z3_optimize_assert_soft
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      a : z3_api_h.Z3_ast;
      weight : z3_api_h.Z3_string;
      id : z3_api_h.Z3_symbol) return unsigned  -- z3/z3/src/api/z3_optimization.h:93
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_assert_soft";

   function Z3_optimize_maximize
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      t : z3_api_h.Z3_ast) return unsigned  -- z3/z3/src/api/z3_optimization.h:105
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_maximize";

   function Z3_optimize_minimize
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      t : z3_api_h.Z3_ast) return unsigned  -- z3/z3/src/api/z3_optimization.h:117
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_minimize";

   procedure Z3_optimize_push (c : z3_api_h.Z3_context; d : z3_api_h.Z3_optimize)  -- z3/z3/src/api/z3_optimization.h:129
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_push";

   procedure Z3_optimize_pop (c : z3_api_h.Z3_context; d : z3_api_h.Z3_optimize)  -- z3/z3/src/api/z3_optimization.h:140
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_pop";

   function Z3_optimize_check
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      num_assumptions : unsigned;
      assumptions : System.Address) return z3_api_h.Z3_lbool  -- z3/z3/src/api/z3_optimization.h:156
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_check";

   function Z3_optimize_get_reason_unknown (c : z3_api_h.Z3_context; d : z3_api_h.Z3_optimize) return z3_api_h.Z3_string  -- z3/z3/src/api/z3_optimization.h:166
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_get_reason_unknown";

   function Z3_optimize_get_model (c : z3_api_h.Z3_context; o : z3_api_h.Z3_optimize) return z3_api_h.Z3_model  -- z3/z3/src/api/z3_optimization.h:177
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_get_model";

   function Z3_optimize_get_unsat_core (c : z3_api_h.Z3_context; o : z3_api_h.Z3_optimize) return z3_api_h.Z3_ast_vector  -- z3/z3/src/api/z3_optimization.h:185
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_get_unsat_core";

   procedure Z3_optimize_set_params
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      p : z3_api_h.Z3_params)  -- z3/z3/src/api/z3_optimization.h:199
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_set_params";

   function Z3_optimize_get_param_descrs (c : z3_api_h.Z3_context; o : z3_api_h.Z3_optimize) return z3_api_h.Z3_param_descrs  -- z3/z3/src/api/z3_optimization.h:212
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_get_param_descrs";

   function Z3_optimize_get_lower
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      idx : unsigned) return z3_api_h.Z3_ast  -- z3/z3/src/api/z3_optimization.h:227
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_get_lower";

   function Z3_optimize_get_upper
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      idx : unsigned) return z3_api_h.Z3_ast  -- z3/z3/src/api/z3_optimization.h:242
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_get_upper";

   function Z3_optimize_get_lower_as_vector
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      idx : unsigned) return z3_api_h.Z3_ast_vector  -- z3/z3/src/api/z3_optimization.h:261
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_get_lower_as_vector";

   function Z3_optimize_get_upper_as_vector
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      idx : unsigned) return z3_api_h.Z3_ast_vector  -- z3/z3/src/api/z3_optimization.h:276
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_get_upper_as_vector";

   function Z3_optimize_to_string (c : z3_api_h.Z3_context; o : z3_api_h.Z3_optimize) return z3_api_h.Z3_string  -- z3/z3/src/api/z3_optimization.h:289
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_to_string";

   procedure Z3_optimize_from_string
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      s : z3_api_h.Z3_string)  -- z3/z3/src/api/z3_optimization.h:305
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_from_string";

   procedure Z3_optimize_from_file
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      s : z3_api_h.Z3_string)  -- z3/z3/src/api/z3_optimization.h:321
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_from_file";

   function Z3_optimize_get_help (c : z3_api_h.Z3_context; t : z3_api_h.Z3_optimize) return z3_api_h.Z3_string  -- z3/z3/src/api/z3_optimization.h:331
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_get_help";

   function Z3_optimize_get_statistics (c : z3_api_h.Z3_context; d : z3_api_h.Z3_optimize) return z3_api_h.Z3_stats  -- z3/z3/src/api/z3_optimization.h:338
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_get_statistics";

   function Z3_optimize_get_assertions (c : z3_api_h.Z3_context; o : z3_api_h.Z3_optimize) return z3_api_h.Z3_ast_vector  -- z3/z3/src/api/z3_optimization.h:345
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_get_assertions";

   function Z3_optimize_get_objectives (c : z3_api_h.Z3_context; o : z3_api_h.Z3_optimize) return z3_api_h.Z3_ast_vector  -- z3/z3/src/api/z3_optimization.h:357
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_get_objectives";

   procedure Z3_optimize_register_model_eh
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      m : z3_api_h.Z3_model;
      ctx : System.Address;
      model_eh : access procedure (arg1 : System.Address))  -- z3/z3/src/api/z3_optimization.h:363
   with Import => True,
        Convention => C,
        External_Name => "Z3_optimize_register_model_eh";

end z3_optimization_h;
