pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with z3_api_h;
with System;

package z3_optimization_h is

   function Z3_mk_optimize (c : z3_api_h.Z3_context) return z3_api_h.Z3_optimize  -- z3/src/api/z3_optimization.h:38
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_optimize";

   procedure Z3_optimize_inc_ref (c : z3_api_h.Z3_context; d : z3_api_h.Z3_optimize)  -- z3/src/api/z3_optimization.h:45
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_inc_ref";

   procedure Z3_optimize_dec_ref (c : z3_api_h.Z3_context; d : z3_api_h.Z3_optimize)  -- z3/src/api/z3_optimization.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_dec_ref";

   procedure Z3_optimize_assert
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      a : z3_api_h.Z3_ast)  -- z3/src/api/z3_optimization.h:62
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_assert";

   procedure Z3_optimize_assert_and_track
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      a : z3_api_h.Z3_ast;
      t : z3_api_h.Z3_ast)  -- z3/src/api/z3_optimization.h:73
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_assert_and_track";

   function Z3_optimize_assert_soft
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      a : z3_api_h.Z3_ast;
      weight : z3_api_h.Z3_string;
      id : z3_api_h.Z3_symbol) return unsigned  -- z3/src/api/z3_optimization.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_assert_soft";

   function Z3_optimize_maximize
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      t : z3_api_h.Z3_ast) return unsigned  -- z3/src/api/z3_optimization.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_maximize";

   function Z3_optimize_minimize
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      t : z3_api_h.Z3_ast) return unsigned  -- z3/src/api/z3_optimization.h:112
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_minimize";

   procedure Z3_optimize_push (c : z3_api_h.Z3_context; d : z3_api_h.Z3_optimize)  -- z3/src/api/z3_optimization.h:124
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_push";

   procedure Z3_optimize_pop (c : z3_api_h.Z3_context; d : z3_api_h.Z3_optimize)  -- z3/src/api/z3_optimization.h:135
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_pop";

   function Z3_optimize_check
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      num_assumptions : unsigned;
      assumptions : System.Address) return z3_api_h.Z3_lbool  -- z3/src/api/z3_optimization.h:151
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_check";

   function Z3_optimize_get_reason_unknown (c : z3_api_h.Z3_context; d : z3_api_h.Z3_optimize) return z3_api_h.Z3_string  -- z3/src/api/z3_optimization.h:161
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_reason_unknown";

   function Z3_optimize_get_model (c : z3_api_h.Z3_context; o : z3_api_h.Z3_optimize) return z3_api_h.Z3_model  -- z3/src/api/z3_optimization.h:172
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_model";

   function Z3_optimize_get_unsat_core (c : z3_api_h.Z3_context; o : z3_api_h.Z3_optimize) return z3_api_h.Z3_ast_vector  -- z3/src/api/z3_optimization.h:180
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_unsat_core";

   procedure Z3_optimize_set_params
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      p : z3_api_h.Z3_params)  -- z3/src/api/z3_optimization.h:194
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_set_params";

   function Z3_optimize_get_param_descrs (c : z3_api_h.Z3_context; o : z3_api_h.Z3_optimize) return z3_api_h.Z3_param_descrs  -- z3/src/api/z3_optimization.h:207
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_param_descrs";

   function Z3_optimize_get_lower
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      idx : unsigned) return z3_api_h.Z3_ast  -- z3/src/api/z3_optimization.h:222
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_lower";

   function Z3_optimize_get_upper
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      idx : unsigned) return z3_api_h.Z3_ast  -- z3/src/api/z3_optimization.h:237
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_upper";

   function Z3_optimize_get_lower_as_vector
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      idx : unsigned) return z3_api_h.Z3_ast_vector  -- z3/src/api/z3_optimization.h:256
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_lower_as_vector";

   function Z3_optimize_get_upper_as_vector
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      idx : unsigned) return z3_api_h.Z3_ast_vector  -- z3/src/api/z3_optimization.h:271
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_upper_as_vector";

   function Z3_optimize_to_string (c : z3_api_h.Z3_context; o : z3_api_h.Z3_optimize) return z3_api_h.Z3_string  -- z3/src/api/z3_optimization.h:284
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_to_string";

   procedure Z3_optimize_from_string
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      s : z3_api_h.Z3_string)  -- z3/src/api/z3_optimization.h:300
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_from_string";

   procedure Z3_optimize_from_file
     (c : z3_api_h.Z3_context;
      o : z3_api_h.Z3_optimize;
      s : z3_api_h.Z3_string)  -- z3/src/api/z3_optimization.h:316
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_from_file";

   function Z3_optimize_get_help (c : z3_api_h.Z3_context; t : z3_api_h.Z3_optimize) return z3_api_h.Z3_string  -- z3/src/api/z3_optimization.h:326
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_help";

   function Z3_optimize_get_statistics (c : z3_api_h.Z3_context; d : z3_api_h.Z3_optimize) return z3_api_h.Z3_stats  -- z3/src/api/z3_optimization.h:333
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_statistics";

   function Z3_optimize_get_assertions (c : z3_api_h.Z3_context; o : z3_api_h.Z3_optimize) return z3_api_h.Z3_ast_vector  -- z3/src/api/z3_optimization.h:340
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_assertions";

   function Z3_optimize_get_objectives (c : z3_api_h.Z3_context; o : z3_api_h.Z3_optimize) return z3_api_h.Z3_ast_vector  -- z3/src/api/z3_optimization.h:352
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_objectives";

end z3_optimization_h;
