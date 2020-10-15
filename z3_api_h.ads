pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;

package z3_api_h is

   --  unsupported macro: Z3_sort_opt Z3_sort
   --  unsupported macro: Z3_ast_opt Z3_ast
   --  unsupported macro: Z3_func_interp_opt Z3_func_interp
   Z3_TRUE : constant := 1;  --  /usr/include/z3_api.h:130

   Z3_FALSE : constant := 0;  --  /usr/include/z3_api.h:135

   type u_Z3_symbol is null record;   -- incomplete struct

   type Z3_symbol is access all u_Z3_symbol;  -- /usr/include/z3_api.h:25

   type u_Z3_literals is null record;   -- incomplete struct

   type Z3_literals is access all u_Z3_literals;  -- /usr/include/z3_api.h:26

   type u_Z3_theory is null record;   -- incomplete struct

   type Z3_theory is access all u_Z3_theory;  -- /usr/include/z3_api.h:27

   type u_Z3_config is null record;   -- incomplete struct

   type Z3_config is access all u_Z3_config;  -- /usr/include/z3_api.h:28

   type u_Z3_context is null record;   -- incomplete struct

   type Z3_context is access all u_Z3_context;  -- /usr/include/z3_api.h:29

   type u_Z3_sort is null record;   -- incomplete struct

   type Z3_sort is access all u_Z3_sort;  -- /usr/include/z3_api.h:30

   type u_Z3_func_decl is null record;   -- incomplete struct

   type Z3_func_decl is access all u_Z3_func_decl;  -- /usr/include/z3_api.h:32

   type u_Z3_ast is null record;   -- incomplete struct

   type Z3_ast is access all u_Z3_ast;  -- /usr/include/z3_api.h:33

   type u_Z3_app is null record;   -- incomplete struct

   type Z3_app is access all u_Z3_app;  -- /usr/include/z3_api.h:35

   type u_Z3_pattern is null record;   -- incomplete struct

   type Z3_pattern is access all u_Z3_pattern;  -- /usr/include/z3_api.h:36

   type u_Z3_model is null record;   -- incomplete struct

   type Z3_model is access all u_Z3_model;  -- /usr/include/z3_api.h:37

   type u_Z3_constructor is null record;   -- incomplete struct

   type Z3_constructor is access all u_Z3_constructor;  -- /usr/include/z3_api.h:38

   type u_Z3_constructor_list is null record;   -- incomplete struct

   type Z3_constructor_list is access all u_Z3_constructor_list;  -- /usr/include/z3_api.h:39

   type u_Z3_params is null record;   -- incomplete struct

   type Z3_params is access all u_Z3_params;  -- /usr/include/z3_api.h:42

   type u_Z3_param_descrs is null record;   -- incomplete struct

   type Z3_param_descrs is access all u_Z3_param_descrs;  -- /usr/include/z3_api.h:43

   type u_Z3_goal is null record;   -- incomplete struct

   type Z3_goal is access all u_Z3_goal;  -- /usr/include/z3_api.h:44

   type u_Z3_tactic is null record;   -- incomplete struct

   type Z3_tactic is access all u_Z3_tactic;  -- /usr/include/z3_api.h:45

   type u_Z3_probe is null record;   -- incomplete struct

   type Z3_probe is access all u_Z3_probe;  -- /usr/include/z3_api.h:46

   type u_Z3_stats is null record;   -- incomplete struct

   type Z3_stats is access all u_Z3_stats;  -- /usr/include/z3_api.h:47

   type u_Z3_solver is null record;   -- incomplete struct

   type Z3_solver is access all u_Z3_solver;  -- /usr/include/z3_api.h:48

   type u_Z3_ast_vector is null record;   -- incomplete struct

   type Z3_ast_vector is access all u_Z3_ast_vector;  -- /usr/include/z3_api.h:49

   type u_Z3_ast_map is null record;   -- incomplete struct

   type Z3_ast_map is access all u_Z3_ast_map;  -- /usr/include/z3_api.h:50

   type u_Z3_apply_result is null record;   -- incomplete struct

   type Z3_apply_result is access all u_Z3_apply_result;  -- /usr/include/z3_api.h:51

   type u_Z3_func_interp is null record;   -- incomplete struct

   type Z3_func_interp is access all u_Z3_func_interp;  -- /usr/include/z3_api.h:52

   type u_Z3_func_entry is null record;   -- incomplete struct

   type Z3_func_entry is access all u_Z3_func_entry;  -- /usr/include/z3_api.h:54

   type u_Z3_fixedpoint is null record;   -- incomplete struct

   type Z3_fixedpoint is access all u_Z3_fixedpoint;  -- /usr/include/z3_api.h:55

   type u_Z3_optimize is null record;   -- incomplete struct

   type Z3_optimize is access all u_Z3_optimize;  -- /usr/include/z3_api.h:56

   type u_Z3_rcf_num is null record;   -- incomplete struct

   type Z3_rcf_num is access all u_Z3_rcf_num;  -- /usr/include/z3_api.h:57

   type Z3_theory_data is new System.Address;  -- /usr/include/z3_api.h:58

   subtype Z3_bool is int;  -- /usr/include/z3_api.h:110

   type Z3_string is new Interfaces.C.Strings.chars_ptr;  -- /usr/include/z3_api.h:119

   type Z3_string_ptr is new System.Address;  -- /usr/include/z3_api.h:120

   subtype Z3_lbool is int;
   Z3_L_FALSE : constant int := -1;
   Z3_L_UNDEF : constant int := 0;
   Z3_L_TRUE : constant int := 1;  -- /usr/include/z3_api.h:148

   type Z3_symbol_kind is 
     (Z3_INT_SYMBOL,
      Z3_STRING_SYMBOL)
   with Convention => C;  -- /usr/include/z3_api.h:162

   type Z3_parameter_kind is 
     (Z3_PARAMETER_INT,
      Z3_PARAMETER_DOUBLE,
      Z3_PARAMETER_RATIONAL,
      Z3_PARAMETER_SYMBOL,
      Z3_PARAMETER_SORT,
      Z3_PARAMETER_AST,
      Z3_PARAMETER_FUNC_DECL)
   with Convention => C;  -- /usr/include/z3_api.h:188

   subtype Z3_sort_kind is unsigned;
   Z3_UNINTERPRETED_SORT : constant unsigned := 0;
   Z3_BOOL_SORT : constant unsigned := 1;
   Z3_INT_SORT : constant unsigned := 2;
   Z3_REAL_SORT : constant unsigned := 3;
   Z3_BV_SORT : constant unsigned := 4;
   Z3_ARRAY_SORT : constant unsigned := 5;
   Z3_DATATYPE_SORT : constant unsigned := 6;
   Z3_RELATION_SORT : constant unsigned := 7;
   Z3_FINITE_DOMAIN_SORT : constant unsigned := 8;
   Z3_FLOATING_POINT_SORT : constant unsigned := 9;
   Z3_ROUNDING_MODE_SORT : constant unsigned := 10;
   Z3_UNKNOWN_SORT : constant unsigned := 1000;  -- /usr/include/z3_api.h:208

   subtype Z3_ast_kind is unsigned;
   Z3_NUMERAL_AST : constant unsigned := 0;
   Z3_APP_AST : constant unsigned := 1;
   Z3_VAR_AST : constant unsigned := 2;
   Z3_QUANTIFIER_AST : constant unsigned := 3;
   Z3_SORT_AST : constant unsigned := 4;
   Z3_FUNC_DECL_AST : constant unsigned := 5;
   Z3_UNKNOWN_AST : constant unsigned := 1000;  -- /usr/include/z3_api.h:231

   subtype Z3_decl_kind is unsigned;
   Z3_OP_TRUE : constant unsigned := 256;
   Z3_OP_FALSE : constant unsigned := 257;
   Z3_OP_EQ : constant unsigned := 258;
   Z3_OP_DISTINCT : constant unsigned := 259;
   Z3_OP_ITE : constant unsigned := 260;
   Z3_OP_AND : constant unsigned := 261;
   Z3_OP_OR : constant unsigned := 262;
   Z3_OP_IFF : constant unsigned := 263;
   Z3_OP_XOR : constant unsigned := 264;
   Z3_OP_NOT : constant unsigned := 265;
   Z3_OP_IMPLIES : constant unsigned := 266;
   Z3_OP_OEQ : constant unsigned := 267;
   Z3_OP_INTERP : constant unsigned := 268;
   Z3_OP_ANUM : constant unsigned := 512;
   Z3_OP_AGNUM : constant unsigned := 513;
   Z3_OP_LE : constant unsigned := 514;
   Z3_OP_GE : constant unsigned := 515;
   Z3_OP_LT : constant unsigned := 516;
   Z3_OP_GT : constant unsigned := 517;
   Z3_OP_ADD : constant unsigned := 518;
   Z3_OP_SUB : constant unsigned := 519;
   Z3_OP_UMINUS : constant unsigned := 520;
   Z3_OP_MUL : constant unsigned := 521;
   Z3_OP_DIV : constant unsigned := 522;
   Z3_OP_IDIV : constant unsigned := 523;
   Z3_OP_REM : constant unsigned := 524;
   Z3_OP_MOD : constant unsigned := 525;
   Z3_OP_TO_REAL : constant unsigned := 526;
   Z3_OP_TO_INT : constant unsigned := 527;
   Z3_OP_IS_INT : constant unsigned := 528;
   Z3_OP_POWER : constant unsigned := 529;
   Z3_OP_STORE : constant unsigned := 768;
   Z3_OP_SELECT : constant unsigned := 769;
   Z3_OP_CONST_ARRAY : constant unsigned := 770;
   Z3_OP_ARRAY_MAP : constant unsigned := 771;
   Z3_OP_ARRAY_DEFAULT : constant unsigned := 772;
   Z3_OP_SET_UNION : constant unsigned := 773;
   Z3_OP_SET_INTERSECT : constant unsigned := 774;
   Z3_OP_SET_DIFFERENCE : constant unsigned := 775;
   Z3_OP_SET_COMPLEMENT : constant unsigned := 776;
   Z3_OP_SET_SUBSET : constant unsigned := 777;
   Z3_OP_AS_ARRAY : constant unsigned := 778;
   Z3_OP_BNUM : constant unsigned := 1024;
   Z3_OP_BIT1 : constant unsigned := 1025;
   Z3_OP_BIT0 : constant unsigned := 1026;
   Z3_OP_BNEG : constant unsigned := 1027;
   Z3_OP_BADD : constant unsigned := 1028;
   Z3_OP_BSUB : constant unsigned := 1029;
   Z3_OP_BMUL : constant unsigned := 1030;
   Z3_OP_BSDIV : constant unsigned := 1031;
   Z3_OP_BUDIV : constant unsigned := 1032;
   Z3_OP_BSREM : constant unsigned := 1033;
   Z3_OP_BUREM : constant unsigned := 1034;
   Z3_OP_BSMOD : constant unsigned := 1035;
   Z3_OP_BSDIV0 : constant unsigned := 1036;
   Z3_OP_BUDIV0 : constant unsigned := 1037;
   Z3_OP_BSREM0 : constant unsigned := 1038;
   Z3_OP_BUREM0 : constant unsigned := 1039;
   Z3_OP_BSMOD0 : constant unsigned := 1040;
   Z3_OP_ULEQ : constant unsigned := 1041;
   Z3_OP_SLEQ : constant unsigned := 1042;
   Z3_OP_UGEQ : constant unsigned := 1043;
   Z3_OP_SGEQ : constant unsigned := 1044;
   Z3_OP_ULT : constant unsigned := 1045;
   Z3_OP_SLT : constant unsigned := 1046;
   Z3_OP_UGT : constant unsigned := 1047;
   Z3_OP_SGT : constant unsigned := 1048;
   Z3_OP_BAND : constant unsigned := 1049;
   Z3_OP_BOR : constant unsigned := 1050;
   Z3_OP_BNOT : constant unsigned := 1051;
   Z3_OP_BXOR : constant unsigned := 1052;
   Z3_OP_BNAND : constant unsigned := 1053;
   Z3_OP_BNOR : constant unsigned := 1054;
   Z3_OP_BXNOR : constant unsigned := 1055;
   Z3_OP_CONCAT : constant unsigned := 1056;
   Z3_OP_SIGN_EXT : constant unsigned := 1057;
   Z3_OP_ZERO_EXT : constant unsigned := 1058;
   Z3_OP_EXTRACT : constant unsigned := 1059;
   Z3_OP_REPEAT : constant unsigned := 1060;
   Z3_OP_BREDOR : constant unsigned := 1061;
   Z3_OP_BREDAND : constant unsigned := 1062;
   Z3_OP_BCOMP : constant unsigned := 1063;
   Z3_OP_BSHL : constant unsigned := 1064;
   Z3_OP_BLSHR : constant unsigned := 1065;
   Z3_OP_BASHR : constant unsigned := 1066;
   Z3_OP_ROTATE_LEFT : constant unsigned := 1067;
   Z3_OP_ROTATE_RIGHT : constant unsigned := 1068;
   Z3_OP_EXT_ROTATE_LEFT : constant unsigned := 1069;
   Z3_OP_EXT_ROTATE_RIGHT : constant unsigned := 1070;
   Z3_OP_INT2BV : constant unsigned := 1071;
   Z3_OP_BV2INT : constant unsigned := 1072;
   Z3_OP_CARRY : constant unsigned := 1073;
   Z3_OP_XOR3 : constant unsigned := 1074;
   Z3_OP_PR_UNDEF : constant unsigned := 1280;
   Z3_OP_PR_TRUE : constant unsigned := 1281;
   Z3_OP_PR_ASSERTED : constant unsigned := 1282;
   Z3_OP_PR_GOAL : constant unsigned := 1283;
   Z3_OP_PR_MODUS_PONENS : constant unsigned := 1284;
   Z3_OP_PR_REFLEXIVITY : constant unsigned := 1285;
   Z3_OP_PR_SYMMETRY : constant unsigned := 1286;
   Z3_OP_PR_TRANSITIVITY : constant unsigned := 1287;
   Z3_OP_PR_TRANSITIVITY_STAR : constant unsigned := 1288;
   Z3_OP_PR_MONOTONICITY : constant unsigned := 1289;
   Z3_OP_PR_QUANT_INTRO : constant unsigned := 1290;
   Z3_OP_PR_DISTRIBUTIVITY : constant unsigned := 1291;
   Z3_OP_PR_AND_ELIM : constant unsigned := 1292;
   Z3_OP_PR_NOT_OR_ELIM : constant unsigned := 1293;
   Z3_OP_PR_REWRITE : constant unsigned := 1294;
   Z3_OP_PR_REWRITE_STAR : constant unsigned := 1295;
   Z3_OP_PR_PULL_QUANT : constant unsigned := 1296;
   Z3_OP_PR_PULL_QUANT_STAR : constant unsigned := 1297;
   Z3_OP_PR_PUSH_QUANT : constant unsigned := 1298;
   Z3_OP_PR_ELIM_UNUSED_VARS : constant unsigned := 1299;
   Z3_OP_PR_DER : constant unsigned := 1300;
   Z3_OP_PR_QUANT_INST : constant unsigned := 1301;
   Z3_OP_PR_HYPOTHESIS : constant unsigned := 1302;
   Z3_OP_PR_LEMMA : constant unsigned := 1303;
   Z3_OP_PR_UNIT_RESOLUTION : constant unsigned := 1304;
   Z3_OP_PR_IFF_TRUE : constant unsigned := 1305;
   Z3_OP_PR_IFF_FALSE : constant unsigned := 1306;
   Z3_OP_PR_COMMUTATIVITY : constant unsigned := 1307;
   Z3_OP_PR_DEF_AXIOM : constant unsigned := 1308;
   Z3_OP_PR_DEF_INTRO : constant unsigned := 1309;
   Z3_OP_PR_APPLY_DEF : constant unsigned := 1310;
   Z3_OP_PR_IFF_OEQ : constant unsigned := 1311;
   Z3_OP_PR_NNF_POS : constant unsigned := 1312;
   Z3_OP_PR_NNF_NEG : constant unsigned := 1313;
   Z3_OP_PR_NNF_STAR : constant unsigned := 1314;
   Z3_OP_PR_CNF_STAR : constant unsigned := 1315;
   Z3_OP_PR_SKOLEMIZE : constant unsigned := 1316;
   Z3_OP_PR_MODUS_PONENS_OEQ : constant unsigned := 1317;
   Z3_OP_PR_TH_LEMMA : constant unsigned := 1318;
   Z3_OP_PR_HYPER_RESOLVE : constant unsigned := 1319;
   Z3_OP_RA_STORE : constant unsigned := 1536;
   Z3_OP_RA_EMPTY : constant unsigned := 1537;
   Z3_OP_RA_IS_EMPTY : constant unsigned := 1538;
   Z3_OP_RA_JOIN : constant unsigned := 1539;
   Z3_OP_RA_UNION : constant unsigned := 1540;
   Z3_OP_RA_WIDEN : constant unsigned := 1541;
   Z3_OP_RA_PROJECT : constant unsigned := 1542;
   Z3_OP_RA_FILTER : constant unsigned := 1543;
   Z3_OP_RA_NEGATION_FILTER : constant unsigned := 1544;
   Z3_OP_RA_RENAME : constant unsigned := 1545;
   Z3_OP_RA_COMPLEMENT : constant unsigned := 1546;
   Z3_OP_RA_SELECT : constant unsigned := 1547;
   Z3_OP_RA_CLONE : constant unsigned := 1548;
   Z3_OP_FD_LT : constant unsigned := 1549;
   Z3_OP_LABEL : constant unsigned := 1792;
   Z3_OP_LABEL_LIT : constant unsigned := 1793;
   Z3_OP_DT_CONSTRUCTOR : constant unsigned := 2048;
   Z3_OP_DT_RECOGNISER : constant unsigned := 2049;
   Z3_OP_DT_ACCESSOR : constant unsigned := 2050;
   Z3_OP_DT_UPDATE_FIELD : constant unsigned := 2051;
   Z3_OP_PB_AT_MOST : constant unsigned := 2304;
   Z3_OP_PB_LE : constant unsigned := 2305;
   Z3_OP_PB_GE : constant unsigned := 2306;
   Z3_OP_FPA_RM_NEAREST_TIES_TO_EVEN : constant unsigned := 2307;
   Z3_OP_FPA_RM_NEAREST_TIES_TO_AWAY : constant unsigned := 2308;
   Z3_OP_FPA_RM_TOWARD_POSITIVE : constant unsigned := 2309;
   Z3_OP_FPA_RM_TOWARD_NEGATIVE : constant unsigned := 2310;
   Z3_OP_FPA_RM_TOWARD_ZERO : constant unsigned := 2311;
   Z3_OP_FPA_NUM : constant unsigned := 2312;
   Z3_OP_FPA_PLUS_INF : constant unsigned := 2313;
   Z3_OP_FPA_MINUS_INF : constant unsigned := 2314;
   Z3_OP_FPA_NAN : constant unsigned := 2315;
   Z3_OP_FPA_PLUS_ZERO : constant unsigned := 2316;
   Z3_OP_FPA_MINUS_ZERO : constant unsigned := 2317;
   Z3_OP_FPA_ADD : constant unsigned := 2318;
   Z3_OP_FPA_SUB : constant unsigned := 2319;
   Z3_OP_FPA_NEG : constant unsigned := 2320;
   Z3_OP_FPA_MUL : constant unsigned := 2321;
   Z3_OP_FPA_DIV : constant unsigned := 2322;
   Z3_OP_FPA_REM : constant unsigned := 2323;
   Z3_OP_FPA_ABS : constant unsigned := 2324;
   Z3_OP_FPA_MIN : constant unsigned := 2325;
   Z3_OP_FPA_MAX : constant unsigned := 2326;
   Z3_OP_FPA_FMA : constant unsigned := 2327;
   Z3_OP_FPA_SQRT : constant unsigned := 2328;
   Z3_OP_FPA_ROUND_TO_INTEGRAL : constant unsigned := 2329;
   Z3_OP_FPA_EQ : constant unsigned := 2330;
   Z3_OP_FPA_LT : constant unsigned := 2331;
   Z3_OP_FPA_GT : constant unsigned := 2332;
   Z3_OP_FPA_LE : constant unsigned := 2333;
   Z3_OP_FPA_GE : constant unsigned := 2334;
   Z3_OP_FPA_IS_NAN : constant unsigned := 2335;
   Z3_OP_FPA_IS_INF : constant unsigned := 2336;
   Z3_OP_FPA_IS_ZERO : constant unsigned := 2337;
   Z3_OP_FPA_IS_NORMAL : constant unsigned := 2338;
   Z3_OP_FPA_IS_SUBNORMAL : constant unsigned := 2339;
   Z3_OP_FPA_IS_NEGATIVE : constant unsigned := 2340;
   Z3_OP_FPA_IS_POSITIVE : constant unsigned := 2341;
   Z3_OP_FPA_FP : constant unsigned := 2342;
   Z3_OP_FPA_TO_FP : constant unsigned := 2343;
   Z3_OP_FPA_TO_FP_UNSIGNED : constant unsigned := 2344;
   Z3_OP_FPA_TO_UBV : constant unsigned := 2345;
   Z3_OP_FPA_TO_SBV : constant unsigned := 2346;
   Z3_OP_FPA_TO_REAL : constant unsigned := 2347;
   Z3_OP_FPA_TO_IEEE_BV : constant unsigned := 2348;
   Z3_OP_UNINTERPRETED : constant unsigned := 2349;  -- /usr/include/z3_api.h:1223

   type Z3_param_kind is 
     (Z3_PK_UINT,
      Z3_PK_BOOL,
      Z3_PK_DOUBLE,
      Z3_PK_SYMBOL,
      Z3_PK_STRING,
      Z3_PK_OTHER,
      Z3_PK_INVALID)
   with Convention => C;  -- /usr/include/z3_api.h:1247

   type Z3_search_failure is 
     (Z3_NO_FAILURE,
      Z3_UNKNOWN,
      Z3_TIMEOUT,
      Z3_MEMOUT_WATERMARK,
      Z3_CANCELED,
      Z3_NUM_CONFLICTS,
      Z3_THY,
      Z3_QUANTIFIERS)
   with Convention => C;  -- /usr/include/z3_api.h:1272

   type Z3_ast_print_mode is 
     (Z3_PRINT_SMTLIB_FULL,
      Z3_PRINT_LOW_LEVEL,
      Z3_PRINT_SMTLIB_COMPLIANT,
      Z3_PRINT_SMTLIB2_COMPLIANT)
   with Convention => C;  -- /usr/include/z3_api.h:1289

   type Z3_error_code is 
     (Z3_OK,
      Z3_SORT_ERROR,
      Z3_IOB,
      Z3_INVALID_ARG,
      Z3_PARSER_ERROR,
      Z3_NO_PARSER,
      Z3_INVALID_PATTERN,
      Z3_MEMOUT_FAIL,
      Z3_FILE_ACCESS_ERROR,
      Z3_INTERNAL_FATAL,
      Z3_INVALID_USAGE,
      Z3_DEC_REF_ERROR,
      Z3_EXCEPTION)
   with Convention => C;  -- /usr/include/z3_api.h:1326

   --  skipped function type Z3_error_handler

   type Z3_goal_prec is 
     (Z3_GOAL_PRECISE,
      Z3_GOAL_UNDER,
      Z3_GOAL_OVER,
      Z3_GOAL_UNDER_OVER)
   with Convention => C;  -- /usr/include/z3_api.h:1391

   procedure Z3_global_param_set (param_id : Z3_string; param_value : Z3_string)  -- /usr/include/z3_api.h:1432
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_global_param_set";

   procedure Z3_global_param_reset_all  -- /usr/include/z3_api.h:1443
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_global_param_reset_all";

   function Z3_global_param_get (param_id : Z3_string; param_value : Z3_string_ptr) return Z3_bool  -- /usr/include/z3_api.h:1458
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_global_param_get";

   function Z3_mk_config return Z3_config  -- /usr/include/z3_api.h:1502
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_config";

   procedure Z3_del_config (c : Z3_config)  -- /usr/include/z3_api.h:1511
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_del_config";

   procedure Z3_set_param_value
     (c : Z3_config;
      param_id : Z3_string;
      param_value : Z3_string)  -- /usr/include/z3_api.h:1522
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_param_value";

   function Z3_mk_context (c : Z3_config) return Z3_context  -- /usr/include/z3_api.h:1556
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_context";

   function Z3_mk_context_rc (c : Z3_config) return Z3_context  -- /usr/include/z3_api.h:1583
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_context_rc";

   procedure Z3_del_context (c : Z3_context)  -- /usr/include/z3_api.h:1594
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_del_context";

   procedure Z3_inc_ref (c : Z3_context; a : Z3_ast)  -- /usr/include/z3_api.h:1605
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_inc_ref";

   procedure Z3_dec_ref (c : Z3_context; a : Z3_ast)  -- /usr/include/z3_api.h:1614
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_dec_ref";

   procedure Z3_update_param_value
     (c : Z3_context;
      param_id : Z3_string;
      param_value : Z3_string)  -- /usr/include/z3_api.h:1624
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_update_param_value";

   procedure Z3_interrupt (c : Z3_context)  -- /usr/include/z3_api.h:1633
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_interrupt";

   function Z3_mk_params (c : Z3_context) return Z3_params  -- /usr/include/z3_api.h:1655
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_params";

   procedure Z3_params_inc_ref (c : Z3_context; p : Z3_params)  -- /usr/include/z3_api.h:1663
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_inc_ref";

   procedure Z3_params_dec_ref (c : Z3_context; p : Z3_params)  -- /usr/include/z3_api.h:1670
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_dec_ref";

   procedure Z3_params_set_bool
     (c : Z3_context;
      p : Z3_params;
      k : Z3_symbol;
      v : Z3_bool)  -- /usr/include/z3_api.h:1678
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_set_bool";

   procedure Z3_params_set_uint
     (c : Z3_context;
      p : Z3_params;
      k : Z3_symbol;
      v : unsigned)  -- /usr/include/z3_api.h:1685
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_set_uint";

   procedure Z3_params_set_double
     (c : Z3_context;
      p : Z3_params;
      k : Z3_symbol;
      v : double)  -- /usr/include/z3_api.h:1692
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_set_double";

   procedure Z3_params_set_symbol
     (c : Z3_context;
      p : Z3_params;
      k : Z3_symbol;
      v : Z3_symbol)  -- /usr/include/z3_api.h:1699
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_set_symbol";

   function Z3_params_to_string (c : Z3_context; p : Z3_params) return Z3_string  -- /usr/include/z3_api.h:1707
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_to_string";

   procedure Z3_params_validate
     (c : Z3_context;
      p : Z3_params;
      d : Z3_param_descrs)  -- /usr/include/z3_api.h:1716
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_validate";

   procedure Z3_param_descrs_inc_ref (c : Z3_context; p : Z3_param_descrs)  -- /usr/include/z3_api.h:1734
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_param_descrs_inc_ref";

   procedure Z3_param_descrs_dec_ref (c : Z3_context; p : Z3_param_descrs)  -- /usr/include/z3_api.h:1741
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_param_descrs_dec_ref";

   function Z3_param_descrs_get_kind
     (c : Z3_context;
      p : Z3_param_descrs;
      n : Z3_symbol) return Z3_param_kind  -- /usr/include/z3_api.h:1749
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_param_descrs_get_kind";

   function Z3_param_descrs_size (c : Z3_context; p : Z3_param_descrs) return unsigned  -- /usr/include/z3_api.h:1756
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_param_descrs_size";

   function Z3_param_descrs_get_name
     (c : Z3_context;
      p : Z3_param_descrs;
      i : unsigned) return Z3_symbol  -- /usr/include/z3_api.h:1765
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_param_descrs_get_name";

   function Z3_param_descrs_to_string (c : Z3_context; p : Z3_param_descrs) return Z3_string  -- /usr/include/z3_api.h:1773
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_param_descrs_to_string";

   function Z3_mk_int_symbol (c : Z3_context; i : int) return Z3_symbol  -- /usr/include/z3_api.h:1803
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_int_symbol";

   function Z3_mk_string_symbol (c : Z3_context; s : Z3_string) return Z3_symbol  -- /usr/include/z3_api.h:1814
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_string_symbol";

   function Z3_mk_uninterpreted_sort (c : Z3_context; s : Z3_symbol) return Z3_sort  -- /usr/include/z3_api.h:1838
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_uninterpreted_sort";

   function Z3_mk_bool_sort (c : Z3_context) return Z3_sort  -- /usr/include/z3_api.h:1847
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bool_sort";

   function Z3_mk_int_sort (c : Z3_context) return Z3_sort  -- /usr/include/z3_api.h:1860
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_int_sort";

   function Z3_mk_real_sort (c : Z3_context) return Z3_sort  -- /usr/include/z3_api.h:1869
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_real_sort";

   function Z3_mk_bv_sort (c : Z3_context; sz : unsigned) return Z3_sort  -- /usr/include/z3_api.h:1880
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bv_sort";

   function Z3_mk_finite_domain_sort
     (c : Z3_context;
      name : Z3_symbol;
      size : Extensions.unsigned_long_long) return Z3_sort  -- /usr/include/z3_api.h:1895
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_finite_domain_sort";

   function Z3_mk_array_sort
     (c : Z3_context;
      domain : Z3_sort;
      c_range : Z3_sort) return Z3_sort  -- /usr/include/z3_api.h:1908
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_array_sort";

   function Z3_mk_tuple_sort
     (c : Z3_context;
      mk_tuple_name : Z3_symbol;
      num_fields : unsigned;
      field_names : System.Address;
      field_sorts : System.Address;
      mk_tuple_decl : System.Address;
      proj_decl : System.Address) return Z3_sort  -- /usr/include/z3_api.h:1930
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_tuple_sort";

   function Z3_mk_enumeration_sort
     (c : Z3_context;
      name : Z3_symbol;
      n : unsigned;
      enum_names : System.Address;
      enum_consts : System.Address;
      enum_testers : System.Address) return Z3_sort  -- /usr/include/z3_api.h:1964
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_enumeration_sort";

   function Z3_mk_list_sort
     (c : Z3_context;
      name : Z3_symbol;
      elem_sort : Z3_sort;
      nil_decl : System.Address;
      is_nil_decl : System.Address;
      cons_decl : System.Address;
      is_cons_decl : System.Address;
      head_decl : System.Address;
      tail_decl : System.Address) return Z3_sort  -- /usr/include/z3_api.h:1992
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_list_sort";

   function Z3_mk_constructor
     (c : Z3_context;
      name : Z3_symbol;
      recognizer : Z3_symbol;
      num_fields : unsigned;
      field_names : System.Address;
      sorts : System.Address;
      sort_refs : access unsigned) return Z3_constructor  -- /usr/include/z3_api.h:2021
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_constructor";

   procedure Z3_del_constructor (c : Z3_context; constr : Z3_constructor)  -- /usr/include/z3_api.h:2038
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_del_constructor";

   function Z3_mk_datatype
     (c : Z3_context;
      name : Z3_symbol;
      num_constructors : unsigned;
      constructors : System.Address) return Z3_sort  -- /usr/include/z3_api.h:2051
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_datatype";

   function Z3_mk_constructor_list
     (c : Z3_context;
      num_constructors : unsigned;
      constructors : System.Address) return Z3_constructor_list  -- /usr/include/z3_api.h:2066
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_constructor_list";

   procedure Z3_del_constructor_list (c : Z3_context; clist : Z3_constructor_list)  -- /usr/include/z3_api.h:2080
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_del_constructor_list";

   procedure Z3_mk_datatypes
     (c : Z3_context;
      num_sorts : unsigned;
      sort_names : System.Address;
      sorts : System.Address;
      constructor_lists : System.Address)  -- /usr/include/z3_api.h:2093
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_datatypes";

   procedure Z3_query_constructor
     (c : Z3_context;
      constr : Z3_constructor;
      num_fields : unsigned;
      constructor : System.Address;
      tester : System.Address;
      accessors : System.Address)  -- /usr/include/z3_api.h:2111
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_query_constructor";

   function Z3_mk_func_decl
     (c : Z3_context;
      s : Z3_symbol;
      domain_size : unsigned;
      domain : System.Address;
      c_range : Z3_sort) return Z3_func_decl  -- /usr/include/z3_api.h:2146
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_func_decl";

   function Z3_mk_app
     (c : Z3_context;
      d : Z3_func_decl;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- /usr/include/z3_api.h:2158
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_app";

   function Z3_mk_const
     (c : Z3_context;
      s : Z3_symbol;
      ty : Z3_sort) return Z3_ast  -- /usr/include/z3_api.h:2180
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_const";

   function Z3_mk_fresh_func_decl
     (c : Z3_context;
      prefix : Z3_string;
      domain_size : unsigned;
      domain : System.Address;
      c_range : Z3_sort) return Z3_func_decl  -- /usr/include/z3_api.h:2194
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_fresh_func_decl";

   function Z3_mk_fresh_const
     (c : Z3_context;
      prefix : Z3_string;
      ty : Z3_sort) return Z3_ast  -- /usr/include/z3_api.h:2213
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_fresh_const";

   function Z3_mk_true (c : Z3_context) return Z3_ast  -- /usr/include/z3_api.h:2225
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_true";

   function Z3_mk_false (c : Z3_context) return Z3_ast  -- /usr/include/z3_api.h:2232
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_false";

   function Z3_mk_eq
     (c : Z3_context;
      l : Z3_ast;
      r : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2242
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_eq";

   function Z3_mk_distinct
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- /usr/include/z3_api.h:2259
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_distinct";

   function Z3_mk_not (c : Z3_context; a : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2269
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_not";

   function Z3_mk_ite
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast;
      t3 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2281
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_ite";

   function Z3_mk_iff
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2291
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_iff";

   function Z3_mk_implies
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2301
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_implies";

   function Z3_mk_xor
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2311
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_xor";

   function Z3_mk_and
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- /usr/include/z3_api.h:2324
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_and";

   function Z3_mk_or
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- /usr/include/z3_api.h:2337
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_or";

   function Z3_mk_add
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- /usr/include/z3_api.h:2355
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_add";

   function Z3_mk_mul
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- /usr/include/z3_api.h:2369
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_mul";

   function Z3_mk_sub
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- /usr/include/z3_api.h:2382
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_sub";

   function Z3_mk_unary_minus (c : Z3_context; arg : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2392
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_unary_minus";

   function Z3_mk_div
     (c : Z3_context;
      arg1 : Z3_ast;
      arg2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2404
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_div";

   function Z3_mk_mod
     (c : Z3_context;
      arg1 : Z3_ast;
      arg2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2414
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_mod";

   function Z3_mk_rem
     (c : Z3_context;
      arg1 : Z3_ast;
      arg2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2424
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_rem";

   function Z3_mk_power
     (c : Z3_context;
      arg1 : Z3_ast;
      arg2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2433
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_power";

   function Z3_mk_lt
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2443
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_lt";

   function Z3_mk_le
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2453
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_le";

   function Z3_mk_gt
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2463
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_gt";

   function Z3_mk_ge
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2473
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_ge";

   function Z3_mk_int2real (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2493
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_int2real";

   function Z3_mk_real2int (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2507
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_real2int";

   function Z3_mk_is_int (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2518
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_is_int";

   function Z3_mk_bvnot (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2533
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvnot";

   function Z3_mk_bvredand (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2543
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvredand";

   function Z3_mk_bvredor (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2553
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvredor";

   function Z3_mk_bvand
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2563
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvand";

   function Z3_mk_bvor
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2573
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvor";

   function Z3_mk_bvxor
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2583
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvxor";

   function Z3_mk_bvnand
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2593
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvnand";

   function Z3_mk_bvnor
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2603
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvnor";

   function Z3_mk_bvxnor
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2613
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvxnor";

   function Z3_mk_bvneg (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2623
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvneg";

   function Z3_mk_bvadd
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2633
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvadd";

   function Z3_mk_bvsub
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2643
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsub";

   function Z3_mk_bvmul
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2653
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvmul";

   function Z3_mk_bvudiv
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2667
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvudiv";

   function Z3_mk_bvsdiv
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2685
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsdiv";

   function Z3_mk_bvurem
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2699
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvurem";

   function Z3_mk_bvsrem
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2716
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsrem";

   function Z3_mk_bvsmod
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2730
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsmod";

   function Z3_mk_bvult
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2740
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvult";

   function Z3_mk_bvslt
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2758
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvslt";

   function Z3_mk_bvule
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2768
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvule";

   function Z3_mk_bvsle
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2778
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsle";

   function Z3_mk_bvuge
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2788
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvuge";

   function Z3_mk_bvsge
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2798
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsge";

   function Z3_mk_bvugt
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2808
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvugt";

   function Z3_mk_bvsgt
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2818
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsgt";

   function Z3_mk_concat
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2831
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_concat";

   function Z3_mk_extract
     (c : Z3_context;
      high : unsigned;
      low : unsigned;
      t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2843
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_extract";

   function Z3_mk_sign_ext
     (c : Z3_context;
      i : unsigned;
      t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2855
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_sign_ext";

   function Z3_mk_zero_ext
     (c : Z3_context;
      i : unsigned;
      t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2867
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_zero_ext";

   function Z3_mk_repeat
     (c : Z3_context;
      i : unsigned;
      t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2877
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_repeat";

   function Z3_mk_bvshl
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2894
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvshl";

   function Z3_mk_bvlshr
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2911
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvlshr";

   function Z3_mk_bvashr
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2929
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvashr";

   function Z3_mk_rotate_left
     (c : Z3_context;
      i : unsigned;
      t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2939
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_rotate_left";

   function Z3_mk_rotate_right
     (c : Z3_context;
      i : unsigned;
      t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2949
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_rotate_right";

   function Z3_mk_ext_rotate_left
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2959
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_ext_rotate_left";

   function Z3_mk_ext_rotate_right
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2969
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_ext_rotate_right";

   function Z3_mk_int2bv
     (c : Z3_context;
      n : unsigned;
      t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:2983
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_int2bv";

   function Z3_mk_bv2int
     (c : Z3_context;
      t1 : Z3_ast;
      is_signed : Z3_bool) return Z3_ast  -- /usr/include/z3_api.h:3001
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bv2int";

   function Z3_mk_bvadd_no_overflow
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast;
      is_signed : Z3_bool) return Z3_ast  -- /usr/include/z3_api.h:3012
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvadd_no_overflow";

   function Z3_mk_bvadd_no_underflow
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3023
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvadd_no_underflow";

   function Z3_mk_bvsub_no_overflow
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3034
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsub_no_overflow";

   function Z3_mk_bvsub_no_underflow
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast;
      is_signed : Z3_bool) return Z3_ast  -- /usr/include/z3_api.h:3045
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsub_no_underflow";

   function Z3_mk_bvsdiv_no_overflow
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3056
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsdiv_no_overflow";

   function Z3_mk_bvneg_no_overflow (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3067
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvneg_no_overflow";

   function Z3_mk_bvmul_no_overflow
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast;
      is_signed : Z3_bool) return Z3_ast  -- /usr/include/z3_api.h:3078
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvmul_no_overflow";

   function Z3_mk_bvmul_no_underflow
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3089
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvmul_no_underflow";

   function Z3_mk_select
     (c : Z3_context;
      a : Z3_ast;
      i : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3111
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_select";

   function Z3_mk_store
     (c : Z3_context;
      a : Z3_ast;
      i : Z3_ast;
      v : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3130
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_store";

   function Z3_mk_const_array
     (c : Z3_context;
      domain : Z3_sort;
      v : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3144
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_const_array";

   function Z3_mk_map
     (c : Z3_context;
      f : Z3_func_decl;
      n : unsigned;
      args : System.Address) return Z3_ast  -- /usr/include/z3_api.h:3160
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_map";

   function Z3_mk_array_default (c : Z3_context; c_array : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3172
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_array_default";

   function Z3_mk_set_sort (c : Z3_context; ty : Z3_sort) return Z3_sort  -- /usr/include/z3_api.h:3184
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_sort";

   function Z3_mk_empty_set (c : Z3_context; domain : Z3_sort) return Z3_ast  -- /usr/include/z3_api.h:3191
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_empty_set";

   function Z3_mk_full_set (c : Z3_context; domain : Z3_sort) return Z3_ast  -- /usr/include/z3_api.h:3198
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_full_set";

   function Z3_mk_set_add
     (c : Z3_context;
      set : Z3_ast;
      elem : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3207
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_add";

   function Z3_mk_set_del
     (c : Z3_context;
      set : Z3_ast;
      elem : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3216
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_del";

   function Z3_mk_set_union
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- /usr/include/z3_api.h:3223
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_union";

   function Z3_mk_set_intersect
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- /usr/include/z3_api.h:3230
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_intersect";

   function Z3_mk_set_difference
     (c : Z3_context;
      arg1 : Z3_ast;
      arg2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3237
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_difference";

   function Z3_mk_set_complement (c : Z3_context; arg : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3244
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_complement";

   function Z3_mk_set_member
     (c : Z3_context;
      elem : Z3_ast;
      set : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3253
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_member";

   function Z3_mk_set_subset
     (c : Z3_context;
      arg1 : Z3_ast;
      arg2 : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3260
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_subset";

   function Z3_mk_numeral
     (c : Z3_context;
      numeral : Z3_string;
      ty : Z3_sort) return Z3_ast  -- /usr/include/z3_api.h:3288
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_numeral";

   function Z3_mk_real
     (c : Z3_context;
      num : int;
      den : int) return Z3_ast  -- /usr/include/z3_api.h:3305
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_real";

   function Z3_mk_int
     (c : Z3_context;
      v : int;
      ty : Z3_sort) return Z3_ast  -- /usr/include/z3_api.h:3317
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_int";

   function Z3_mk_unsigned_int
     (c : Z3_context;
      v : unsigned;
      ty : Z3_sort) return Z3_ast  -- /usr/include/z3_api.h:3330
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_unsigned_int";

   function Z3_mk_int64
     (c : Z3_context;
      v : Long_Long_Integer;
      ty : Z3_sort) return Z3_ast  -- /usr/include/z3_api.h:3343
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_int64";

   function Z3_mk_unsigned_int64
     (c : Z3_context;
      v : Extensions.unsigned_long_long;
      ty : Z3_sort) return Z3_ast  -- /usr/include/z3_api.h:3356
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_unsigned_int64";

   function Z3_mk_pattern
     (c : Z3_context;
      num_patterns : unsigned;
      terms : System.Address) return Z3_pattern  -- /usr/include/z3_api.h:3386
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_pattern";

   function Z3_mk_bound
     (c : Z3_context;
      index : unsigned;
      ty : Z3_sort) return Z3_ast  -- /usr/include/z3_api.h:3419
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bound";

   function Z3_mk_forall
     (c : Z3_context;
      weight : unsigned;
      num_patterns : unsigned;
      patterns : System.Address;
      num_decls : unsigned;
      sorts : System.Address;
      decl_names : System.Address;
      c_body : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3454
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_forall";

   function Z3_mk_exists
     (c : Z3_context;
      weight : unsigned;
      num_patterns : unsigned;
      patterns : System.Address;
      num_decls : unsigned;
      sorts : System.Address;
      decl_names : System.Address;
      c_body : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3470
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_exists";

   function Z3_mk_quantifier
     (c : Z3_context;
      is_forall : Z3_bool;
      weight : unsigned;
      num_patterns : unsigned;
      patterns : System.Address;
      num_decls : unsigned;
      sorts : System.Address;
      decl_names : System.Address;
      c_body : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3497
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_quantifier";

   function Z3_mk_quantifier_ex
     (c : Z3_context;
      is_forall : Z3_bool;
      weight : unsigned;
      quantifier_id : Z3_symbol;
      skolem_id : Z3_symbol;
      num_patterns : unsigned;
      patterns : System.Address;
      num_no_patterns : unsigned;
      no_patterns : System.Address;
      num_decls : unsigned;
      sorts : System.Address;
      decl_names : System.Address;
      c_body : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3531
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_quantifier_ex";

   function Z3_mk_forall_const
     (c : Z3_context;
      weight : unsigned;
      num_bound : unsigned;
      bound : System.Address;
      num_patterns : unsigned;
      patterns : System.Address;
      c_body : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3561
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_forall_const";

   function Z3_mk_exists_const
     (c : Z3_context;
      weight : unsigned;
      num_bound : unsigned;
      bound : System.Address;
      num_patterns : unsigned;
      patterns : System.Address;
      c_body : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3591
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_exists_const";

   function Z3_mk_quantifier_const
     (c : Z3_context;
      is_forall : Z3_bool;
      weight : unsigned;
      num_bound : unsigned;
      bound : System.Address;
      num_patterns : unsigned;
      patterns : System.Address;
      c_body : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3608
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_quantifier_const";

   function Z3_mk_quantifier_const_ex
     (c : Z3_context;
      is_forall : Z3_bool;
      weight : unsigned;
      quantifier_id : Z3_symbol;
      skolem_id : Z3_symbol;
      num_bound : unsigned;
      bound : System.Address;
      num_patterns : unsigned;
      patterns : System.Address;
      num_no_patterns : unsigned;
      no_patterns : System.Address;
      c_body : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3626
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_quantifier_const_ex";

   function Z3_get_symbol_kind (c : Z3_context; s : Z3_symbol) return Z3_symbol_kind  -- /usr/include/z3_api.h:3664
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_symbol_kind";

   function Z3_get_symbol_int (c : Z3_context; s : Z3_symbol) return int  -- /usr/include/z3_api.h:3676
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_symbol_int";

   function Z3_get_symbol_string (c : Z3_context; s : Z3_symbol) return Z3_string  -- /usr/include/z3_api.h:3692
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_symbol_string";

   function Z3_get_sort_name (c : Z3_context; d : Z3_sort) return Z3_symbol  -- /usr/include/z3_api.h:3708
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_sort_name";

   function Z3_get_sort_id (c : Z3_context; s : Z3_sort) return unsigned  -- /usr/include/z3_api.h:3716
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_sort_id";

   function Z3_sort_to_ast (c : Z3_context; s : Z3_sort) return Z3_ast  -- /usr/include/z3_api.h:3728
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_sort_to_ast";

   function Z3_is_eq_sort
     (c : Z3_context;
      s1 : Z3_sort;
      s2 : Z3_sort) return Z3_bool  -- /usr/include/z3_api.h:3736
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_eq_sort";

   function Z3_get_sort_kind (c : Z3_context; t : Z3_sort) return Z3_sort_kind  -- /usr/include/z3_api.h:3745
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_sort_kind";

   function Z3_get_bv_sort_size (c : Z3_context; t : Z3_sort) return unsigned  -- /usr/include/z3_api.h:3759
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_bv_sort_size";

   function Z3_get_finite_domain_sort_size
     (c : Z3_context;
      s : Z3_sort;
      r : access Extensions.unsigned_long_long) return Z3_bool  -- /usr/include/z3_api.h:3768
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_finite_domain_sort_size";

   function Z3_get_array_sort_domain (c : Z3_context; t : Z3_sort) return Z3_sort  -- /usr/include/z3_api.h:3782
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_array_sort_domain";

   function Z3_get_array_sort_range (c : Z3_context; t : Z3_sort) return Z3_sort  -- /usr/include/z3_api.h:3795
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_array_sort_range";

   function Z3_get_tuple_sort_mk_decl (c : Z3_context; t : Z3_sort) return Z3_func_decl  -- /usr/include/z3_api.h:3810
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_tuple_sort_mk_decl";

   function Z3_get_tuple_sort_num_fields (c : Z3_context; t : Z3_sort) return unsigned  -- /usr/include/z3_api.h:3823
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_tuple_sort_num_fields";

   function Z3_get_tuple_sort_field_decl
     (c : Z3_context;
      t : Z3_sort;
      i : unsigned) return Z3_func_decl  -- /usr/include/z3_api.h:3838
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_tuple_sort_field_decl";

   function Z3_get_datatype_sort_num_constructors (c : Z3_context; t : Z3_sort) return unsigned  -- /usr/include/z3_api.h:3851
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_datatype_sort_num_constructors";

   function Z3_get_datatype_sort_constructor
     (c : Z3_context;
      t : Z3_sort;
      idx : unsigned) return Z3_func_decl  -- /usr/include/z3_api.h:3866
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_datatype_sort_constructor";

   function Z3_get_datatype_sort_recognizer
     (c : Z3_context;
      t : Z3_sort;
      idx : unsigned) return Z3_func_decl  -- /usr/include/z3_api.h:3881
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_datatype_sort_recognizer";

   function Z3_get_datatype_sort_constructor_accessor
     (c : Z3_context;
      t : Z3_sort;
      idx_c : unsigned;
      idx_a : unsigned) return Z3_func_decl  -- /usr/include/z3_api.h:3897
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_datatype_sort_constructor_accessor";

   function Z3_datatype_update_field
     (c : Z3_context;
      field_access : Z3_func_decl;
      t : Z3_ast;
      value : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:3919
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_datatype_update_field";

   function Z3_get_relation_arity (c : Z3_context; s : Z3_sort) return unsigned  -- /usr/include/z3_api.h:3932
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_relation_arity";

   function Z3_get_relation_column
     (c : Z3_context;
      s : Z3_sort;
      col : unsigned) return Z3_sort  -- /usr/include/z3_api.h:3944
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_relation_column";

   function Z3_mk_atmost
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address;
      k : unsigned) return Z3_ast  -- /usr/include/z3_api.h:3955
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_atmost";

   function Z3_mk_pble
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address;
      coeffs : access int;
      k : int) return Z3_ast  -- /usr/include/z3_api.h:3966
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_pble";

   function Z3_func_decl_to_ast (c : Z3_context; f : Z3_func_decl) return Z3_ast  -- /usr/include/z3_api.h:3980
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_decl_to_ast";

   function Z3_is_eq_func_decl
     (c : Z3_context;
      f1 : Z3_func_decl;
      f2 : Z3_func_decl) return Z3_bool  -- /usr/include/z3_api.h:3988
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_eq_func_decl";

   function Z3_get_func_decl_id (c : Z3_context; f : Z3_func_decl) return unsigned  -- /usr/include/z3_api.h:3996
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_func_decl_id";

   function Z3_get_decl_name (c : Z3_context; d : Z3_func_decl) return Z3_symbol  -- /usr/include/z3_api.h:4003
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_name";

   function Z3_get_decl_kind (c : Z3_context; d : Z3_func_decl) return Z3_decl_kind  -- /usr/include/z3_api.h:4010
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_kind";

   function Z3_get_domain_size (c : Z3_context; d : Z3_func_decl) return unsigned  -- /usr/include/z3_api.h:4019
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_domain_size";

   function Z3_get_arity (c : Z3_context; d : Z3_func_decl) return unsigned  -- /usr/include/z3_api.h:4028
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_arity";

   function Z3_get_domain
     (c : Z3_context;
      d : Z3_func_decl;
      i : unsigned) return Z3_sort  -- /usr/include/z3_api.h:4040
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_domain";

   function Z3_get_range (c : Z3_context; d : Z3_func_decl) return Z3_sort  -- /usr/include/z3_api.h:4055
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_range";

   function Z3_get_decl_num_parameters (c : Z3_context; d : Z3_func_decl) return unsigned  -- /usr/include/z3_api.h:4062
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_num_parameters";

   function Z3_get_decl_parameter_kind
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return Z3_parameter_kind  -- /usr/include/z3_api.h:4073
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_parameter_kind";

   function Z3_get_decl_int_parameter
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return int  -- /usr/include/z3_api.h:4082
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_int_parameter";

   function Z3_get_decl_double_parameter
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return double  -- /usr/include/z3_api.h:4091
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_double_parameter";

   function Z3_get_decl_symbol_parameter
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return Z3_symbol  -- /usr/include/z3_api.h:4100
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_symbol_parameter";

   function Z3_get_decl_sort_parameter
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return Z3_sort  -- /usr/include/z3_api.h:4109
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_sort_parameter";

   function Z3_get_decl_ast_parameter
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return Z3_ast  -- /usr/include/z3_api.h:4118
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_ast_parameter";

   function Z3_get_decl_func_decl_parameter
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return Z3_func_decl  -- /usr/include/z3_api.h:4127
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_func_decl_parameter";

   function Z3_get_decl_rational_parameter
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return Z3_string  -- /usr/include/z3_api.h:4136
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_rational_parameter";

   function Z3_app_to_ast (c : Z3_context; a : Z3_app) return Z3_ast  -- /usr/include/z3_api.h:4148
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_app_to_ast";

   function Z3_get_app_decl (c : Z3_context; a : Z3_app) return Z3_func_decl  -- /usr/include/z3_api.h:4155
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_app_decl";

   function Z3_get_app_num_args (c : Z3_context; a : Z3_app) return unsigned  -- /usr/include/z3_api.h:4164
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_app_num_args";

   function Z3_get_app_arg
     (c : Z3_context;
      a : Z3_app;
      i : unsigned) return Z3_ast  -- /usr/include/z3_api.h:4174
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_app_arg";

   function Z3_is_eq_ast
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_bool  -- /usr/include/z3_api.h:4195
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_eq_ast";

   function Z3_get_ast_id (c : Z3_context; t : Z3_ast) return unsigned  -- /usr/include/z3_api.h:4209
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_ast_id";

   function Z3_get_ast_hash (c : Z3_context; a : Z3_ast) return unsigned  -- /usr/include/z3_api.h:4219
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_ast_hash";

   function Z3_get_sort (c : Z3_context; a : Z3_ast) return Z3_sort  -- /usr/include/z3_api.h:4228
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_sort";

   function Z3_is_well_sorted (c : Z3_context; t : Z3_ast) return Z3_bool  -- /usr/include/z3_api.h:4235
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_well_sorted";

   function Z3_get_bool_value (c : Z3_context; a : Z3_ast) return Z3_lbool  -- /usr/include/z3_api.h:4242
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_bool_value";

   function Z3_get_ast_kind (c : Z3_context; a : Z3_ast) return Z3_ast_kind  -- /usr/include/z3_api.h:4249
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_ast_kind";

   function Z3_is_app (c : Z3_context; a : Z3_ast) return Z3_bool  -- /usr/include/z3_api.h:4254
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_app";

   function Z3_is_numeral_ast (c : Z3_context; a : Z3_ast) return Z3_bool  -- /usr/include/z3_api.h:4259
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_numeral_ast";

   function Z3_is_algebraic_number (c : Z3_context; a : Z3_ast) return Z3_bool  -- /usr/include/z3_api.h:4266
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_algebraic_number";

   function Z3_to_app (c : Z3_context; a : Z3_ast) return Z3_app  -- /usr/include/z3_api.h:4275
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_to_app";

   function Z3_to_func_decl (c : Z3_context; a : Z3_ast) return Z3_func_decl  -- /usr/include/z3_api.h:4284
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_to_func_decl";

   function Z3_get_numeral_string (c : Z3_context; a : Z3_ast) return Z3_string  -- /usr/include/z3_api.h:4306
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_string";

   function Z3_get_numeral_decimal_string
     (c : Z3_context;
      a : Z3_ast;
      precision : unsigned) return Z3_string  -- /usr/include/z3_api.h:4316
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_decimal_string";

   function Z3_get_numerator (c : Z3_context; a : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:4325
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numerator";

   function Z3_get_denominator (c : Z3_context; a : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:4334
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_denominator";

   function Z3_get_numeral_small
     (c : Z3_context;
      a : Z3_ast;
      num : access Long_Long_Integer;
      den : access Long_Long_Integer) return Z3_bool  -- /usr/include/z3_api.h:4350
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_small";

   function Z3_get_numeral_int
     (c : Z3_context;
      v : Z3_ast;
      i : access int) return Z3_bool  -- /usr/include/z3_api.h:4363
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_int";

   function Z3_get_numeral_uint
     (c : Z3_context;
      v : Z3_ast;
      u : access unsigned) return Z3_bool  -- /usr/include/z3_api.h:4377
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_uint";

   function Z3_get_numeral_uint64
     (c : Z3_context;
      v : Z3_ast;
      u : access Extensions.unsigned_long_long) return Z3_bool  -- /usr/include/z3_api.h:4392
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_uint64";

   function Z3_get_numeral_int64
     (c : Z3_context;
      v : Z3_ast;
      i : access Long_Long_Integer) return Z3_bool  -- /usr/include/z3_api.h:4406
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_int64";

   function Z3_get_numeral_rational_int64
     (c : Z3_context;
      v : Z3_ast;
      num : access Long_Long_Integer;
      den : access Long_Long_Integer) return Z3_bool  -- /usr/include/z3_api.h:4419
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_rational_int64";

   function Z3_get_algebraic_number_lower
     (c : Z3_context;
      a : Z3_ast;
      precision : unsigned) return Z3_ast  -- /usr/include/z3_api.h:4430
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_algebraic_number_lower";

   function Z3_get_algebraic_number_upper
     (c : Z3_context;
      a : Z3_ast;
      precision : unsigned) return Z3_ast  -- /usr/include/z3_api.h:4441
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_algebraic_number_upper";

   function Z3_pattern_to_ast (c : Z3_context; p : Z3_pattern) return Z3_ast  -- /usr/include/z3_api.h:4454
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_pattern_to_ast";

   function Z3_get_pattern_num_terms (c : Z3_context; p : Z3_pattern) return unsigned  -- /usr/include/z3_api.h:4465
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_pattern_num_terms";

   function Z3_get_pattern
     (c : Z3_context;
      p : Z3_pattern;
      idx : unsigned) return Z3_ast  -- /usr/include/z3_api.h:4472
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_pattern";

   function Z3_get_index_value (c : Z3_context; a : Z3_ast) return unsigned  -- /usr/include/z3_api.h:4486
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_index_value";

   function Z3_is_quantifier_forall (c : Z3_context; a : Z3_ast) return Z3_bool  -- /usr/include/z3_api.h:4495
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_quantifier_forall";

   function Z3_get_quantifier_weight (c : Z3_context; a : Z3_ast) return unsigned  -- /usr/include/z3_api.h:4504
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_weight";

   function Z3_get_quantifier_num_patterns (c : Z3_context; a : Z3_ast) return unsigned  -- /usr/include/z3_api.h:4513
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_num_patterns";

   function Z3_get_quantifier_pattern_ast
     (c : Z3_context;
      a : Z3_ast;
      i : unsigned) return Z3_pattern  -- /usr/include/z3_api.h:4522
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_pattern_ast";

   function Z3_get_quantifier_num_no_patterns (c : Z3_context; a : Z3_ast) return unsigned  -- /usr/include/z3_api.h:4531
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_num_no_patterns";

   function Z3_get_quantifier_no_pattern_ast
     (c : Z3_context;
      a : Z3_ast;
      i : unsigned) return Z3_ast  -- /usr/include/z3_api.h:4540
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_no_pattern_ast";

   function Z3_get_quantifier_num_bound (c : Z3_context; a : Z3_ast) return unsigned  -- /usr/include/z3_api.h:4549
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_num_bound";

   function Z3_get_quantifier_bound_name
     (c : Z3_context;
      a : Z3_ast;
      i : unsigned) return Z3_symbol  -- /usr/include/z3_api.h:4558
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_bound_name";

   function Z3_get_quantifier_bound_sort
     (c : Z3_context;
      a : Z3_ast;
      i : unsigned) return Z3_sort  -- /usr/include/z3_api.h:4567
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_bound_sort";

   function Z3_get_quantifier_body (c : Z3_context; a : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:4576
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_body";

   function Z3_simplify (c : Z3_context; a : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:4590
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_simplify";

   function Z3_simplify_ex
     (c : Z3_context;
      a : Z3_ast;
      p : Z3_params) return Z3_ast  -- /usr/include/z3_api.h:4602
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_simplify_ex";

   function Z3_simplify_get_help (c : Z3_context) return Z3_string  -- /usr/include/z3_api.h:4609
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_simplify_get_help";

   function Z3_simplify_get_param_descrs (c : Z3_context) return Z3_param_descrs  -- /usr/include/z3_api.h:4616
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_simplify_get_param_descrs";

   function Z3_update_term
     (c : Z3_context;
      a : Z3_ast;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- /usr/include/z3_api.h:4634
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_update_term";

   function Z3_substitute
     (c : Z3_context;
      a : Z3_ast;
      num_exprs : unsigned;
      from : System.Address;
      to : System.Address) return Z3_ast  -- /usr/include/z3_api.h:4643
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_substitute";

   function Z3_substitute_vars
     (c : Z3_context;
      a : Z3_ast;
      num_exprs : unsigned;
      to : System.Address) return Z3_ast  -- /usr/include/z3_api.h:4655
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_substitute_vars";

   function Z3_translate
     (source : Z3_context;
      a : Z3_ast;
      target : Z3_context) return Z3_ast  -- /usr/include/z3_api.h:4668
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_translate";

   procedure Z3_model_inc_ref (c : Z3_context; m : Z3_model)  -- /usr/include/z3_api.h:4688
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_inc_ref";

   procedure Z3_model_dec_ref (c : Z3_context; m : Z3_model)  -- /usr/include/z3_api.h:4695
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_dec_ref";

   function Z3_model_eval
     (c : Z3_context;
      m : Z3_model;
      t : Z3_ast;
      model_completion : Z3_bool;
      v : System.Address) return Z3_bool  -- /usr/include/z3_api.h:4718
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_eval";

   function Z3_model_get_const_interp
     (c : Z3_context;
      m : Z3_model;
      a : Z3_func_decl) return Z3_ast  -- /usr/include/z3_api.h:4734
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_const_interp";

   function Z3_model_has_interp
     (c : Z3_context;
      m : Z3_model;
      a : Z3_func_decl) return Z3_bool  -- /usr/include/z3_api.h:4741
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_has_interp";

   function Z3_model_get_func_interp
     (c : Z3_context;
      m : Z3_model;
      f : Z3_func_decl) return Z3_func_interp  -- /usr/include/z3_api.h:4756
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_func_interp";

   function Z3_model_get_num_consts (c : Z3_context; m : Z3_model) return unsigned  -- /usr/include/z3_api.h:4765
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_num_consts";

   function Z3_model_get_const_decl
     (c : Z3_context;
      m : Z3_model;
      i : unsigned) return Z3_func_decl  -- /usr/include/z3_api.h:4777
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_const_decl";

   function Z3_model_get_num_funcs (c : Z3_context; m : Z3_model) return unsigned  -- /usr/include/z3_api.h:4787
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_num_funcs";

   function Z3_model_get_func_decl
     (c : Z3_context;
      m : Z3_model;
      i : unsigned) return Z3_func_decl  -- /usr/include/z3_api.h:4799
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_func_decl";

   function Z3_model_get_num_sorts (c : Z3_context; m : Z3_model) return unsigned  -- /usr/include/z3_api.h:4813
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_num_sorts";

   function Z3_model_get_sort
     (c : Z3_context;
      m : Z3_model;
      i : unsigned) return Z3_sort  -- /usr/include/z3_api.h:4825
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_sort";

   function Z3_model_get_sort_universe
     (c : Z3_context;
      m : Z3_model;
      s : Z3_sort) return Z3_ast_vector  -- /usr/include/z3_api.h:4835
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_sort_universe";

   function Z3_is_as_array (c : Z3_context; a : Z3_ast) return Z3_bool  -- /usr/include/z3_api.h:4848
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_as_array";

   function Z3_get_as_array_func_decl (c : Z3_context; a : Z3_ast) return Z3_func_decl  -- /usr/include/z3_api.h:4857
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_as_array_func_decl";

   procedure Z3_func_interp_inc_ref (c : Z3_context; f : Z3_func_interp)  -- /usr/include/z3_api.h:4865
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_interp_inc_ref";

   procedure Z3_func_interp_dec_ref (c : Z3_context; f : Z3_func_interp)  -- /usr/include/z3_api.h:4872
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_interp_dec_ref";

   function Z3_func_interp_get_num_entries (c : Z3_context; f : Z3_func_interp) return unsigned  -- /usr/include/z3_api.h:4884
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_interp_get_num_entries";

   function Z3_func_interp_get_entry
     (c : Z3_context;
      f : Z3_func_interp;
      i : unsigned) return Z3_func_entry  -- /usr/include/z3_api.h:4896
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_interp_get_entry";

   function Z3_func_interp_get_else (c : Z3_context; f : Z3_func_interp) return Z3_ast  -- /usr/include/z3_api.h:4906
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_interp_get_else";

   function Z3_func_interp_get_arity (c : Z3_context; f : Z3_func_interp) return unsigned  -- /usr/include/z3_api.h:4913
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_interp_get_arity";

   procedure Z3_func_entry_inc_ref (c : Z3_context; e : Z3_func_entry)  -- /usr/include/z3_api.h:4921
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_entry_inc_ref";

   procedure Z3_func_entry_dec_ref (c : Z3_context; e : Z3_func_entry)  -- /usr/include/z3_api.h:4928
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_entry_dec_ref";

   function Z3_func_entry_get_value (c : Z3_context; e : Z3_func_entry) return Z3_ast  -- /usr/include/z3_api.h:4941
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_entry_get_value";

   function Z3_func_entry_get_num_args (c : Z3_context; e : Z3_func_entry) return unsigned  -- /usr/include/z3_api.h:4950
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_entry_get_num_args";

   function Z3_func_entry_get_arg
     (c : Z3_context;
      e : Z3_func_entry;
      i : unsigned) return Z3_ast  -- /usr/include/z3_api.h:4961
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_entry_get_arg";

   function Z3_open_log (filename : Z3_string) return Z3_bool  -- /usr/include/z3_api.h:4976
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_open_log";

   procedure Z3_append_log (string : Z3_string)  -- /usr/include/z3_api.h:4987
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_append_log";

   procedure Z3_close_log  -- /usr/include/z3_api.h:4994
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_close_log";

   procedure Z3_toggle_warning_messages (enabled : Z3_bool)  -- /usr/include/z3_api.h:5004
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_toggle_warning_messages";

   procedure Z3_set_ast_print_mode (c : Z3_context; mode : Z3_ast_print_mode)  -- /usr/include/z3_api.h:5030
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_ast_print_mode";

   function Z3_ast_to_string (c : Z3_context; a : Z3_ast) return Z3_string  -- /usr/include/z3_api.h:5043
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_to_string";

   function Z3_pattern_to_string (c : Z3_context; p : Z3_pattern) return Z3_string  -- /usr/include/z3_api.h:5048
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_pattern_to_string";

   function Z3_sort_to_string (c : Z3_context; s : Z3_sort) return Z3_string  -- /usr/include/z3_api.h:5053
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_sort_to_string";

   function Z3_func_decl_to_string (c : Z3_context; d : Z3_func_decl) return Z3_string  -- /usr/include/z3_api.h:5058
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_decl_to_string";

   function Z3_model_to_string (c : Z3_context; m : Z3_model) return Z3_string  -- /usr/include/z3_api.h:5069
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_to_string";

   function Z3_benchmark_to_smtlib_string
     (c : Z3_context;
      name : Z3_string;
      logic : Z3_string;
      status : Z3_string;
      attributes : Z3_string;
      num_assumptions : unsigned;
      assumptions : System.Address;
      formula : Z3_ast) return Z3_string  -- /usr/include/z3_api.h:5089
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_benchmark_to_smtlib_string";

   function Z3_parse_smtlib2_string
     (c : Z3_context;
      str : Z3_string;
      num_sorts : unsigned;
      sort_names : System.Address;
      sorts : System.Address;
      num_decls : unsigned;
      decl_names : System.Address;
      decls : System.Address) return Z3_ast  -- /usr/include/z3_api.h:5114
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_parse_smtlib2_string";

   function Z3_parse_smtlib2_file
     (c : Z3_context;
      file_name : Z3_string;
      num_sorts : unsigned;
      sort_names : System.Address;
      sorts : System.Address;
      num_decls : unsigned;
      decl_names : System.Address;
      decls : System.Address) return Z3_ast  -- /usr/include/z3_api.h:5128
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_parse_smtlib2_file";

   procedure Z3_parse_smtlib_string
     (c : Z3_context;
      str : Z3_string;
      num_sorts : unsigned;
      sort_names : System.Address;
      sorts : System.Address;
      num_decls : unsigned;
      decl_names : System.Address;
      decls : System.Address)  -- /usr/include/z3_api.h:5160
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_parse_smtlib_string";

   procedure Z3_parse_smtlib_file
     (c : Z3_context;
      file_name : Z3_string;
      num_sorts : unsigned;
      sort_names : System.Address;
      sorts : System.Address;
      num_decls : unsigned;
      decl_names : System.Address;
      decls : System.Address)  -- /usr/include/z3_api.h:5175
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_parse_smtlib_file";

   function Z3_get_smtlib_num_formulas (c : Z3_context) return unsigned  -- /usr/include/z3_api.h:5190
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_smtlib_num_formulas";

   function Z3_get_smtlib_formula (c : Z3_context; i : unsigned) return Z3_ast  -- /usr/include/z3_api.h:5200
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_smtlib_formula";

   function Z3_get_smtlib_num_assumptions (c : Z3_context) return unsigned  -- /usr/include/z3_api.h:5207
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_smtlib_num_assumptions";

   function Z3_get_smtlib_assumption (c : Z3_context; i : unsigned) return Z3_ast  -- /usr/include/z3_api.h:5217
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_smtlib_assumption";

   function Z3_get_smtlib_num_decls (c : Z3_context) return unsigned  -- /usr/include/z3_api.h:5224
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_smtlib_num_decls";

   function Z3_get_smtlib_decl (c : Z3_context; i : unsigned) return Z3_func_decl  -- /usr/include/z3_api.h:5234
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_smtlib_decl";

   function Z3_get_smtlib_num_sorts (c : Z3_context) return unsigned  -- /usr/include/z3_api.h:5241
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_smtlib_num_sorts";

   function Z3_get_smtlib_sort (c : Z3_context; i : unsigned) return Z3_sort  -- /usr/include/z3_api.h:5251
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_smtlib_sort";

   function Z3_get_smtlib_error (c : Z3_context) return Z3_string  -- /usr/include/z3_api.h:5260
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_smtlib_error";

   function Z3_get_error_code (c : Z3_context) return Z3_error_code  -- /usr/include/z3_api.h:5282
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_error_code";

   procedure Z3_set_error_handler (c : Z3_context; h : access procedure (arg1 : Z3_context; arg2 : Z3_error_code))  -- /usr/include/z3_api.h:5296
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_error_handler";

   procedure Z3_set_error (c : Z3_context; e : Z3_error_code)  -- /usr/include/z3_api.h:5304
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_error";

   function Z3_get_error_msg (err : Z3_error_code) return Z3_string  -- /usr/include/z3_api.h:5314
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_error_msg";

   function Z3_get_error_msg_ex (c : Z3_context; err : Z3_error_code) return Z3_string  -- /usr/include/z3_api.h:5323
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_error_msg_ex";

   procedure Z3_get_version
     (major : access unsigned;
      minor : access unsigned;
      build_number : access unsigned;
      revision_number : access unsigned)  -- /usr/include/z3_api.h:5343
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_version";

   procedure Z3_enable_trace (tag : Z3_string)  -- /usr/include/z3_api.h:5351
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_enable_trace";

   procedure Z3_disable_trace (tag : Z3_string)  -- /usr/include/z3_api.h:5359
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_disable_trace";

   procedure Z3_reset_memory  -- /usr/include/z3_api.h:5372
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_reset_memory";

   procedure Z3_finalize_memory  -- /usr/include/z3_api.h:5384
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_finalize_memory";

   --  skipped function type Z3_reduce_eq_callback_fptr

   --  skipped function type Z3_reduce_app_callback_fptr

   --  skipped function type Z3_reduce_distinct_callback_fptr

   --  skipped function type Z3_theory_callback_fptr

   --  skipped function type Z3_theory_final_check_callback_fptr

   --  skipped function type Z3_theory_ast_callback_fptr

   --  skipped function type Z3_theory_ast_bool_callback_fptr

   --  skipped function type Z3_theory_ast_ast_callback_fptr

   function Z3_mk_theory
     (c : Z3_context;
      th_name : Z3_string;
      data : Z3_theory_data) return Z3_theory  -- /usr/include/z3_api.h:5427
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_theory";

   function Z3_theory_get_ext_data (t : Z3_theory) return Z3_theory_data  -- /usr/include/z3_api.h:5434
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_get_ext_data";

   function Z3_theory_mk_sort
     (c : Z3_context;
      t : Z3_theory;
      s : Z3_symbol) return Z3_sort  -- /usr/include/z3_api.h:5440
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_mk_sort";

   function Z3_theory_mk_value
     (c : Z3_context;
      t : Z3_theory;
      n : Z3_symbol;
      s : Z3_sort) return Z3_ast  -- /usr/include/z3_api.h:5445
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_mk_value";

   function Z3_theory_mk_constant
     (c : Z3_context;
      t : Z3_theory;
      n : Z3_symbol;
      s : Z3_sort) return Z3_ast  -- /usr/include/z3_api.h:5450
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_mk_constant";

   function Z3_theory_mk_func_decl
     (c : Z3_context;
      t : Z3_theory;
      n : Z3_symbol;
      domain_size : unsigned;
      domain : System.Address;
      c_range : Z3_sort) return Z3_func_decl  -- /usr/include/z3_api.h:5455
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_mk_func_decl";

   function Z3_theory_get_context (t : Z3_theory) return Z3_context  -- /usr/include/z3_api.h:5462
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_get_context";

   procedure Z3_set_delete_callback (t : Z3_theory; f : access procedure (arg1 : Z3_theory))  -- /usr/include/z3_api.h:5476
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_delete_callback";

   procedure Z3_set_reduce_app_callback (t : Z3_theory; f : access function
        (arg1 : Z3_theory;
         arg2 : Z3_func_decl;
         arg3 : unsigned;
         arg4 : System.Address;
         arg5 : System.Address) return Z3_bool)  -- /usr/include/z3_api.h:5491
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_reduce_app_callback";

   procedure Z3_set_reduce_eq_callback (t : Z3_theory; f : access function
        (arg1 : Z3_theory;
         arg2 : Z3_ast;
         arg3 : Z3_ast;
         arg4 : System.Address) return Z3_bool)  -- /usr/include/z3_api.h:5506
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_reduce_eq_callback";

   procedure Z3_set_reduce_distinct_callback (t : Z3_theory; f : access function
        (arg1 : Z3_theory;
         arg2 : unsigned;
         arg3 : System.Address;
         arg4 : System.Address) return Z3_bool)  -- /usr/include/z3_api.h:5521
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_reduce_distinct_callback";

   procedure Z3_set_new_app_callback (t : Z3_theory; f : access procedure (arg1 : Z3_theory; arg2 : Z3_ast))  -- /usr/include/z3_api.h:5538
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_new_app_callback";

   procedure Z3_set_new_elem_callback (t : Z3_theory; f : access procedure (arg1 : Z3_theory; arg2 : Z3_ast))  -- /usr/include/z3_api.h:5556
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_new_elem_callback";

   procedure Z3_set_init_search_callback (t : Z3_theory; f : access procedure (arg1 : Z3_theory))  -- /usr/include/z3_api.h:5565
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_init_search_callback";

   procedure Z3_set_push_callback (t : Z3_theory; f : access procedure (arg1 : Z3_theory))  -- /usr/include/z3_api.h:5576
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_push_callback";

   procedure Z3_set_pop_callback (t : Z3_theory; f : access procedure (arg1 : Z3_theory))  -- /usr/include/z3_api.h:5587
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_pop_callback";

   procedure Z3_set_restart_callback (t : Z3_theory; f : access procedure (arg1 : Z3_theory))  -- /usr/include/z3_api.h:5596
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_restart_callback";

   procedure Z3_set_reset_callback (t : Z3_theory; f : access procedure (arg1 : Z3_theory))  -- /usr/include/z3_api.h:5606
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_reset_callback";

   procedure Z3_set_final_check_callback (t : Z3_theory; f : access function (arg1 : Z3_theory) return Z3_bool)  -- /usr/include/z3_api.h:5620
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_final_check_callback";

   procedure Z3_set_new_eq_callback (t : Z3_theory; f : access procedure
        (arg1 : Z3_theory;
         arg2 : Z3_ast;
         arg3 : Z3_ast))  -- /usr/include/z3_api.h:5631
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_new_eq_callback";

   procedure Z3_set_new_diseq_callback (t : Z3_theory; f : access procedure
        (arg1 : Z3_theory;
         arg2 : Z3_ast;
         arg3 : Z3_ast))  -- /usr/include/z3_api.h:5642
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_new_diseq_callback";

   procedure Z3_set_new_assignment_callback (t : Z3_theory; f : access procedure
        (arg1 : Z3_theory;
         arg2 : Z3_ast;
         arg3 : Z3_bool))  -- /usr/include/z3_api.h:5652
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_new_assignment_callback";

   procedure Z3_set_new_relevant_callback (t : Z3_theory; f : access procedure (arg1 : Z3_theory; arg2 : Z3_ast))  -- /usr/include/z3_api.h:5663
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_new_relevant_callback";

   procedure Z3_theory_assert_axiom (t : Z3_theory; ax : Z3_ast)  -- /usr/include/z3_api.h:5681
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_assert_axiom";

   procedure Z3_theory_assume_eq
     (t : Z3_theory;
      lhs : Z3_ast;
      rhs : Z3_ast)  -- /usr/include/z3_api.h:5690
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_assume_eq";

   procedure Z3_theory_enable_axiom_simplification (t : Z3_theory; flag : Z3_bool)  -- /usr/include/z3_api.h:5698
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_enable_axiom_simplification";

   function Z3_theory_get_eqc_root (t : Z3_theory; n : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:5703
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_get_eqc_root";

   function Z3_theory_get_eqc_next (t : Z3_theory; n : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:5719
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_get_eqc_next";

   function Z3_theory_get_num_parents (t : Z3_theory; n : Z3_ast) return unsigned  -- /usr/include/z3_api.h:5724
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_get_num_parents";

   function Z3_theory_get_parent
     (t : Z3_theory;
      n : Z3_ast;
      i : unsigned) return Z3_ast  -- /usr/include/z3_api.h:5730
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_get_parent";

   function Z3_theory_is_value (t : Z3_theory; n : Z3_ast) return Z3_bool  -- /usr/include/z3_api.h:5735
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_is_value";

   function Z3_theory_is_decl (t : Z3_theory; d : Z3_func_decl) return Z3_bool  -- /usr/include/z3_api.h:5740
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_is_decl";

   function Z3_theory_get_num_elems (t : Z3_theory) return unsigned  -- /usr/include/z3_api.h:5747
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_get_num_elems";

   function Z3_theory_get_elem (t : Z3_theory; i : unsigned) return Z3_ast  -- /usr/include/z3_api.h:5754
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_get_elem";

   function Z3_theory_get_num_apps (t : Z3_theory) return unsigned  -- /usr/include/z3_api.h:5761
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_get_num_apps";

   function Z3_theory_get_app (t : Z3_theory; i : unsigned) return Z3_ast  -- /usr/include/z3_api.h:5768
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_theory_get_app";

   function Z3_mk_fixedpoint (c : Z3_context) return Z3_fixedpoint  -- /usr/include/z3_api.h:5788
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_fixedpoint";

   procedure Z3_fixedpoint_inc_ref (c : Z3_context; d : Z3_fixedpoint)  -- /usr/include/z3_api.h:5796
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_inc_ref";

   procedure Z3_fixedpoint_dec_ref (c : Z3_context; d : Z3_fixedpoint)  -- /usr/include/z3_api.h:5803
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_dec_ref";

   procedure Z3_fixedpoint_add_rule
     (c : Z3_context;
      d : Z3_fixedpoint;
      rule : Z3_ast;
      name : Z3_symbol)  -- /usr/include/z3_api.h:5818
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_add_rule";

   procedure Z3_fixedpoint_add_fact
     (c : Z3_context;
      d : Z3_fixedpoint;
      r : Z3_func_decl;
      num_args : unsigned;
      args : access unsigned)  -- /usr/include/z3_api.h:5837
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_add_fact";

   procedure Z3_fixedpoint_assert
     (c : Z3_context;
      d : Z3_fixedpoint;
      axiom : Z3_ast)  -- /usr/include/z3_api.h:5849
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_assert";

   function Z3_fixedpoint_query
     (c : Z3_context;
      d : Z3_fixedpoint;
      query : Z3_ast) return Z3_lbool  -- /usr/include/z3_api.h:5866
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_query";

   function Z3_fixedpoint_query_relations
     (c : Z3_context;
      d : Z3_fixedpoint;
      num_relations : unsigned;
      relations : System.Address) return Z3_lbool  -- /usr/include/z3_api.h:5880
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_query_relations";

   function Z3_fixedpoint_get_answer (c : Z3_context; d : Z3_fixedpoint) return Z3_ast  -- /usr/include/z3_api.h:5897
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_get_answer";

   function Z3_fixedpoint_get_reason_unknown (c : Z3_context; d : Z3_fixedpoint) return Z3_string  -- /usr/include/z3_api.h:5906
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_get_reason_unknown";

   procedure Z3_fixedpoint_update_rule
     (c : Z3_context;
      d : Z3_fixedpoint;
      a : Z3_ast;
      name : Z3_symbol)  -- /usr/include/z3_api.h:5914
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_update_rule";

   function Z3_fixedpoint_get_num_levels
     (c : Z3_context;
      d : Z3_fixedpoint;
      pred : Z3_func_decl) return unsigned  -- /usr/include/z3_api.h:5925
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_get_num_levels";

   function Z3_fixedpoint_get_cover_delta
     (c : Z3_context;
      d : Z3_fixedpoint;
      level : int;
      pred : Z3_func_decl) return Z3_ast  -- /usr/include/z3_api.h:5937
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_get_cover_delta";

   procedure Z3_fixedpoint_add_cover
     (c : Z3_context;
      d : Z3_fixedpoint;
      level : int;
      pred : Z3_func_decl;
      property : Z3_ast)  -- /usr/include/z3_api.h:5951
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_add_cover";

   function Z3_fixedpoint_get_statistics (c : Z3_context; d : Z3_fixedpoint) return Z3_stats  -- /usr/include/z3_api.h:5958
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_get_statistics";

   procedure Z3_fixedpoint_register_relation
     (c : Z3_context;
      d : Z3_fixedpoint;
      f : Z3_func_decl)  -- /usr/include/z3_api.h:5968
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_register_relation";

   procedure Z3_fixedpoint_set_predicate_representation
     (c : Z3_context;
      d : Z3_fixedpoint;
      f : Z3_func_decl;
      num_relations : unsigned;
      relation_kinds : System.Address)  -- /usr/include/z3_api.h:5979
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_set_predicate_representation";

   function Z3_fixedpoint_get_rules (c : Z3_context; f : Z3_fixedpoint) return Z3_ast_vector  -- /usr/include/z3_api.h:5991
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_get_rules";

   function Z3_fixedpoint_get_assertions (c : Z3_context; f : Z3_fixedpoint) return Z3_ast_vector  -- /usr/include/z3_api.h:6000
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_get_assertions";

   procedure Z3_fixedpoint_set_params
     (c : Z3_context;
      f : Z3_fixedpoint;
      p : Z3_params)  -- /usr/include/z3_api.h:6009
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_set_params";

   function Z3_fixedpoint_get_help (c : Z3_context; f : Z3_fixedpoint) return Z3_string  -- /usr/include/z3_api.h:6016
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_get_help";

   function Z3_fixedpoint_get_param_descrs (c : Z3_context; f : Z3_fixedpoint) return Z3_param_descrs  -- /usr/include/z3_api.h:6023
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_get_param_descrs";

   function Z3_fixedpoint_to_string
     (c : Z3_context;
      f : Z3_fixedpoint;
      num_queries : unsigned;
      queries : System.Address) return Z3_string  -- /usr/include/z3_api.h:6034
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_to_string";

   function Z3_fixedpoint_from_string
     (c : Z3_context;
      f : Z3_fixedpoint;
      s : Z3_string) return Z3_ast_vector  -- /usr/include/z3_api.h:6051
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_from_string";

   function Z3_fixedpoint_from_file
     (c : Z3_context;
      f : Z3_fixedpoint;
      s : Z3_string) return Z3_ast_vector  -- /usr/include/z3_api.h:6067
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_from_file";

   procedure Z3_fixedpoint_push (c : Z3_context; d : Z3_fixedpoint)  -- /usr/include/z3_api.h:6082
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_push";

   procedure Z3_fixedpoint_pop (c : Z3_context; d : Z3_fixedpoint)  -- /usr/include/z3_api.h:6093
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_pop";

   --  skipped function type Z3_fixedpoint_reduce_assign_callback_fptr

   --  skipped function type Z3_fixedpoint_reduce_app_callback_fptr

   procedure Z3_fixedpoint_init
     (c : Z3_context;
      d : Z3_fixedpoint;
      state : System.Address)  -- /usr/include/z3_api.h:6115
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_init";

   procedure Z3_fixedpoint_set_reduce_assign_callback
     (c : Z3_context;
      d : Z3_fixedpoint;
      cb : access procedure
        (arg1 : System.Address;
         arg2 : Z3_func_decl;
         arg3 : unsigned;
         arg4 : System.Address;
         arg5 : unsigned;
         arg6 : System.Address))  -- /usr/include/z3_api.h:6122
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_set_reduce_assign_callback";

   procedure Z3_fixedpoint_set_reduce_app_callback
     (c : Z3_context;
      d : Z3_fixedpoint;
      cb : access procedure
        (arg1 : System.Address;
         arg2 : Z3_func_decl;
         arg3 : unsigned;
         arg4 : System.Address;
         arg5 : System.Address))  -- /usr/include/z3_api.h:6129
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_fixedpoint_set_reduce_app_callback";

   function Z3_mk_optimize (c : Z3_context) return Z3_optimize  -- /usr/include/z3_api.h:6151
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_optimize";

   procedure Z3_optimize_inc_ref (c : Z3_context; d : Z3_optimize)  -- /usr/include/z3_api.h:6159
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_inc_ref";

   procedure Z3_optimize_dec_ref (c : Z3_context; d : Z3_optimize)  -- /usr/include/z3_api.h:6166
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_dec_ref";

   procedure Z3_optimize_assert
     (c : Z3_context;
      o : Z3_optimize;
      a : Z3_ast)  -- /usr/include/z3_api.h:6174
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_assert";

   function Z3_optimize_assert_soft
     (c : Z3_context;
      o : Z3_optimize;
      a : Z3_ast;
      weight : Z3_string;
      id : Z3_symbol) return unsigned  -- /usr/include/z3_api.h:6187
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_assert_soft";

   function Z3_optimize_maximize
     (c : Z3_context;
      o : Z3_optimize;
      t : Z3_ast) return unsigned  -- /usr/include/z3_api.h:6197
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_maximize";

   function Z3_optimize_minimize
     (c : Z3_context;
      o : Z3_optimize;
      t : Z3_ast) return unsigned  -- /usr/include/z3_api.h:6207
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_minimize";

   procedure Z3_optimize_push (c : Z3_context; d : Z3_optimize)  -- /usr/include/z3_api.h:6220
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_push";

   procedure Z3_optimize_pop (c : Z3_context; d : Z3_optimize)  -- /usr/include/z3_api.h:6231
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_pop";

   function Z3_optimize_check (c : Z3_context; o : Z3_optimize) return Z3_lbool  -- /usr/include/z3_api.h:6240
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_check";

   function Z3_optimize_get_reason_unknown (c : Z3_context; d : Z3_optimize) return Z3_string  -- /usr/include/z3_api.h:6250
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_reason_unknown";

   function Z3_optimize_get_model (c : Z3_context; o : Z3_optimize) return Z3_model  -- /usr/include/z3_api.h:6261
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_model";

   procedure Z3_optimize_set_params
     (c : Z3_context;
      o : Z3_optimize;
      p : Z3_params)  -- /usr/include/z3_api.h:6272
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_set_params";

   function Z3_optimize_get_param_descrs (c : Z3_context; o : Z3_optimize) return Z3_param_descrs  -- /usr/include/z3_api.h:6282
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_param_descrs";

   function Z3_optimize_get_lower
     (c : Z3_context;
      o : Z3_optimize;
      idx : unsigned) return Z3_ast  -- /usr/include/z3_api.h:6293
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_lower";

   function Z3_optimize_get_upper
     (c : Z3_context;
      o : Z3_optimize;
      idx : unsigned) return Z3_ast  -- /usr/include/z3_api.h:6304
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_upper";

   function Z3_optimize_to_string (c : Z3_context; o : Z3_optimize) return Z3_string  -- /usr/include/z3_api.h:6313
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_to_string";

   function Z3_optimize_get_help (c : Z3_context; t : Z3_optimize) return Z3_string  -- /usr/include/z3_api.h:6323
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_help";

   function Z3_optimize_get_statistics (c : Z3_context; d : Z3_optimize) return Z3_stats  -- /usr/include/z3_api.h:6330
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_optimize_get_statistics";

   function Z3_mk_ast_vector (c : Z3_context) return Z3_ast_vector  -- /usr/include/z3_api.h:6351
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_ast_vector";

   procedure Z3_ast_vector_inc_ref (c : Z3_context; v : Z3_ast_vector)  -- /usr/include/z3_api.h:6359
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_vector_inc_ref";

   procedure Z3_ast_vector_dec_ref (c : Z3_context; v : Z3_ast_vector)  -- /usr/include/z3_api.h:6366
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_vector_dec_ref";

   function Z3_ast_vector_size (c : Z3_context; v : Z3_ast_vector) return unsigned  -- /usr/include/z3_api.h:6374
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_vector_size";

   function Z3_ast_vector_get
     (c : Z3_context;
      v : Z3_ast_vector;
      i : unsigned) return Z3_ast  -- /usr/include/z3_api.h:6383
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_vector_get";

   procedure Z3_ast_vector_set
     (c : Z3_context;
      v : Z3_ast_vector;
      i : unsigned;
      a : Z3_ast)  -- /usr/include/z3_api.h:6392
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_vector_set";

   procedure Z3_ast_vector_resize
     (c : Z3_context;
      v : Z3_ast_vector;
      n : unsigned)  -- /usr/include/z3_api.h:6399
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_vector_resize";

   procedure Z3_ast_vector_push
     (c : Z3_context;
      v : Z3_ast_vector;
      a : Z3_ast)  -- /usr/include/z3_api.h:6406
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_vector_push";

   function Z3_ast_vector_translate
     (s : Z3_context;
      v : Z3_ast_vector;
      t : Z3_context) return Z3_ast_vector  -- /usr/include/z3_api.h:6413
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_vector_translate";

   function Z3_ast_vector_to_string (c : Z3_context; v : Z3_ast_vector) return Z3_string  -- /usr/include/z3_api.h:6420
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_vector_to_string";

   function Z3_mk_ast_map (c : Z3_context) return Z3_ast_map  -- /usr/include/z3_api.h:6437
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_ast_map";

   procedure Z3_ast_map_inc_ref (c : Z3_context; m : Z3_ast_map)  -- /usr/include/z3_api.h:6445
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_map_inc_ref";

   procedure Z3_ast_map_dec_ref (c : Z3_context; m : Z3_ast_map)  -- /usr/include/z3_api.h:6452
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_map_dec_ref";

   function Z3_ast_map_contains
     (c : Z3_context;
      m : Z3_ast_map;
      k : Z3_ast) return Z3_bool  -- /usr/include/z3_api.h:6460
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_map_contains";

   function Z3_ast_map_find
     (c : Z3_context;
      m : Z3_ast_map;
      k : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:6469
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_map_find";

   procedure Z3_ast_map_insert
     (c : Z3_context;
      m : Z3_ast_map;
      k : Z3_ast;
      v : Z3_ast)  -- /usr/include/z3_api.h:6476
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_map_insert";

   procedure Z3_ast_map_erase
     (c : Z3_context;
      m : Z3_ast_map;
      k : Z3_ast)  -- /usr/include/z3_api.h:6483
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_map_erase";

   procedure Z3_ast_map_reset (c : Z3_context; m : Z3_ast_map)  -- /usr/include/z3_api.h:6490
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_map_reset";

   function Z3_ast_map_size (c : Z3_context; m : Z3_ast_map) return unsigned  -- /usr/include/z3_api.h:6497
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_map_size";

   function Z3_ast_map_keys (c : Z3_context; m : Z3_ast_map) return Z3_ast_vector  -- /usr/include/z3_api.h:6504
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_map_keys";

   function Z3_ast_map_to_string (c : Z3_context; m : Z3_ast_map) return Z3_string  -- /usr/include/z3_api.h:6511
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_map_to_string";

   function Z3_mk_goal
     (c : Z3_context;
      models : Z3_bool;
      unsat_cores : Z3_bool;
      proofs : Z3_bool) return Z3_goal  -- /usr/include/z3_api.h:6537
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_goal";

   procedure Z3_goal_inc_ref (c : Z3_context; g : Z3_goal)  -- /usr/include/z3_api.h:6545
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_inc_ref";

   procedure Z3_goal_dec_ref (c : Z3_context; g : Z3_goal)  -- /usr/include/z3_api.h:6552
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_dec_ref";

   function Z3_goal_precision (c : Z3_context; g : Z3_goal) return Z3_goal_prec  -- /usr/include/z3_api.h:6562
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_precision";

   procedure Z3_goal_assert
     (c : Z3_context;
      g : Z3_goal;
      a : Z3_ast)  -- /usr/include/z3_api.h:6569
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_assert";

   function Z3_goal_inconsistent (c : Z3_context; g : Z3_goal) return Z3_bool  -- /usr/include/z3_api.h:6576
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_inconsistent";

   function Z3_goal_depth (c : Z3_context; g : Z3_goal) return unsigned  -- /usr/include/z3_api.h:6583
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_depth";

   procedure Z3_goal_reset (c : Z3_context; g : Z3_goal)  -- /usr/include/z3_api.h:6590
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_reset";

   function Z3_goal_size (c : Z3_context; g : Z3_goal) return unsigned  -- /usr/include/z3_api.h:6597
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_size";

   function Z3_goal_formula
     (c : Z3_context;
      g : Z3_goal;
      idx : unsigned) return Z3_ast  -- /usr/include/z3_api.h:6606
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_formula";

   function Z3_goal_num_exprs (c : Z3_context; g : Z3_goal) return unsigned  -- /usr/include/z3_api.h:6613
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_num_exprs";

   function Z3_goal_is_decided_sat (c : Z3_context; g : Z3_goal) return Z3_bool  -- /usr/include/z3_api.h:6620
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_is_decided_sat";

   function Z3_goal_is_decided_unsat (c : Z3_context; g : Z3_goal) return Z3_bool  -- /usr/include/z3_api.h:6627
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_is_decided_unsat";

   function Z3_goal_translate
     (source : Z3_context;
      g : Z3_goal;
      target : Z3_context) return Z3_goal  -- /usr/include/z3_api.h:6634
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_translate";

   function Z3_goal_to_string (c : Z3_context; g : Z3_goal) return Z3_string  -- /usr/include/z3_api.h:6641
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_to_string";

   function Z3_mk_tactic (c : Z3_context; name : Z3_string) return Z3_tactic  -- /usr/include/z3_api.h:6659
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_tactic";

   procedure Z3_tactic_inc_ref (c : Z3_context; t : Z3_tactic)  -- /usr/include/z3_api.h:6667
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_inc_ref";

   procedure Z3_tactic_dec_ref (c : Z3_context; g : Z3_tactic)  -- /usr/include/z3_api.h:6674
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_dec_ref";

   function Z3_mk_probe (c : Z3_context; name : Z3_string) return Z3_probe  -- /usr/include/z3_api.h:6687
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_probe";

   procedure Z3_probe_inc_ref (c : Z3_context; p : Z3_probe)  -- /usr/include/z3_api.h:6695
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_inc_ref";

   procedure Z3_probe_dec_ref (c : Z3_context; p : Z3_probe)  -- /usr/include/z3_api.h:6702
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_dec_ref";

   function Z3_tactic_and_then
     (c : Z3_context;
      t1 : Z3_tactic;
      t2 : Z3_tactic) return Z3_tactic  -- /usr/include/z3_api.h:6711
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_and_then";

   function Z3_tactic_or_else
     (c : Z3_context;
      t1 : Z3_tactic;
      t2 : Z3_tactic) return Z3_tactic  -- /usr/include/z3_api.h:6719
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_or_else";

   function Z3_tactic_par_or
     (c : Z3_context;
      num : unsigned;
      ts : System.Address) return Z3_tactic  -- /usr/include/z3_api.h:6726
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_par_or";

   function Z3_tactic_par_and_then
     (c : Z3_context;
      t1 : Z3_tactic;
      t2 : Z3_tactic) return Z3_tactic  -- /usr/include/z3_api.h:6734
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_par_and_then";

   function Z3_tactic_try_for
     (c : Z3_context;
      t : Z3_tactic;
      ms : unsigned) return Z3_tactic  -- /usr/include/z3_api.h:6742
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_try_for";

   function Z3_tactic_when
     (c : Z3_context;
      p : Z3_probe;
      t : Z3_tactic) return Z3_tactic  -- /usr/include/z3_api.h:6750
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_when";

   function Z3_tactic_cond
     (c : Z3_context;
      p : Z3_probe;
      t1 : Z3_tactic;
      t2 : Z3_tactic) return Z3_tactic  -- /usr/include/z3_api.h:6758
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_cond";

   function Z3_tactic_repeat
     (c : Z3_context;
      t : Z3_tactic;
      max : unsigned) return Z3_tactic  -- /usr/include/z3_api.h:6766
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_repeat";

   function Z3_tactic_skip (c : Z3_context) return Z3_tactic  -- /usr/include/z3_api.h:6773
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_skip";

   function Z3_tactic_fail (c : Z3_context) return Z3_tactic  -- /usr/include/z3_api.h:6780
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_fail";

   function Z3_tactic_fail_if (c : Z3_context; p : Z3_probe) return Z3_tactic  -- /usr/include/z3_api.h:6787
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_fail_if";

   function Z3_tactic_fail_if_not_decided (c : Z3_context) return Z3_tactic  -- /usr/include/z3_api.h:6795
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_fail_if_not_decided";

   function Z3_tactic_using_params
     (c : Z3_context;
      t : Z3_tactic;
      p : Z3_params) return Z3_tactic  -- /usr/include/z3_api.h:6802
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_using_params";

   function Z3_probe_const (x : Z3_context; val : double) return Z3_probe  -- /usr/include/z3_api.h:6809
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_const";

   function Z3_probe_lt
     (x : Z3_context;
      p1 : Z3_probe;
      p2 : Z3_probe) return Z3_probe  -- /usr/include/z3_api.h:6818
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_lt";

   function Z3_probe_gt
     (x : Z3_context;
      p1 : Z3_probe;
      p2 : Z3_probe) return Z3_probe  -- /usr/include/z3_api.h:6827
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_gt";

   function Z3_probe_le
     (x : Z3_context;
      p1 : Z3_probe;
      p2 : Z3_probe) return Z3_probe  -- /usr/include/z3_api.h:6836
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_le";

   function Z3_probe_ge
     (x : Z3_context;
      p1 : Z3_probe;
      p2 : Z3_probe) return Z3_probe  -- /usr/include/z3_api.h:6845
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_ge";

   function Z3_probe_eq
     (x : Z3_context;
      p1 : Z3_probe;
      p2 : Z3_probe) return Z3_probe  -- /usr/include/z3_api.h:6854
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_eq";

   function Z3_probe_and
     (x : Z3_context;
      p1 : Z3_probe;
      p2 : Z3_probe) return Z3_probe  -- /usr/include/z3_api.h:6863
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_and";

   function Z3_probe_or
     (x : Z3_context;
      p1 : Z3_probe;
      p2 : Z3_probe) return Z3_probe  -- /usr/include/z3_api.h:6872
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_or";

   function Z3_probe_not (x : Z3_context; p : Z3_probe) return Z3_probe  -- /usr/include/z3_api.h:6881
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_not";

   function Z3_get_num_tactics (c : Z3_context) return unsigned  -- /usr/include/z3_api.h:6888
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_num_tactics";

   function Z3_get_tactic_name (c : Z3_context; i : unsigned) return Z3_string  -- /usr/include/z3_api.h:6897
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_tactic_name";

   function Z3_get_num_probes (c : Z3_context) return unsigned  -- /usr/include/z3_api.h:6904
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_num_probes";

   function Z3_get_probe_name (c : Z3_context; i : unsigned) return Z3_string  -- /usr/include/z3_api.h:6913
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_probe_name";

   function Z3_tactic_get_help (c : Z3_context; t : Z3_tactic) return Z3_string  -- /usr/include/z3_api.h:6920
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_get_help";

   function Z3_tactic_get_param_descrs (c : Z3_context; t : Z3_tactic) return Z3_param_descrs  -- /usr/include/z3_api.h:6927
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_get_param_descrs";

   function Z3_tactic_get_descr (c : Z3_context; name : Z3_string) return Z3_string  -- /usr/include/z3_api.h:6934
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_get_descr";

   function Z3_probe_get_descr (c : Z3_context; name : Z3_string) return Z3_string  -- /usr/include/z3_api.h:6941
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_get_descr";

   function Z3_probe_apply
     (c : Z3_context;
      p : Z3_probe;
      g : Z3_goal) return double  -- /usr/include/z3_api.h:6949
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_apply";

   function Z3_tactic_apply
     (c : Z3_context;
      t : Z3_tactic;
      g : Z3_goal) return Z3_apply_result  -- /usr/include/z3_api.h:6956
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_apply";

   function Z3_tactic_apply_ex
     (c : Z3_context;
      t : Z3_tactic;
      g : Z3_goal;
      p : Z3_params) return Z3_apply_result  -- /usr/include/z3_api.h:6963
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_apply_ex";

   procedure Z3_apply_result_inc_ref (c : Z3_context; r : Z3_apply_result)  -- /usr/include/z3_api.h:6971
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_apply_result_inc_ref";

   procedure Z3_apply_result_dec_ref (c : Z3_context; r : Z3_apply_result)  -- /usr/include/z3_api.h:6978
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_apply_result_dec_ref";

   function Z3_apply_result_to_string (c : Z3_context; r : Z3_apply_result) return Z3_string  -- /usr/include/z3_api.h:6986
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_apply_result_to_string";

   function Z3_apply_result_get_num_subgoals (c : Z3_context; r : Z3_apply_result) return unsigned  -- /usr/include/z3_api.h:6993
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_apply_result_get_num_subgoals";

   function Z3_apply_result_get_subgoal
     (c : Z3_context;
      r : Z3_apply_result;
      i : unsigned) return Z3_goal  -- /usr/include/z3_api.h:7002
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_apply_result_get_subgoal";

   function Z3_apply_result_convert_model
     (c : Z3_context;
      r : Z3_apply_result;
      i : unsigned;
      m : Z3_model) return Z3_model  -- /usr/include/z3_api.h:7010
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_apply_result_convert_model";

   function Z3_mk_solver (c : Z3_context) return Z3_solver  -- /usr/include/z3_api.h:7029
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_solver";

   function Z3_mk_simple_solver (c : Z3_context) return Z3_solver  -- /usr/include/z3_api.h:7043
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_simple_solver";

   function Z3_mk_solver_for_logic (c : Z3_context; logic : Z3_symbol) return Z3_solver  -- /usr/include/z3_api.h:7054
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_solver_for_logic";

   function Z3_mk_solver_from_tactic (c : Z3_context; t : Z3_tactic) return Z3_solver  -- /usr/include/z3_api.h:7063
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_solver_from_tactic";

   function Z3_solver_get_help (c : Z3_context; s : Z3_solver) return Z3_string  -- /usr/include/z3_api.h:7070
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_help";

   function Z3_solver_get_param_descrs (c : Z3_context; s : Z3_solver) return Z3_param_descrs  -- /usr/include/z3_api.h:7077
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_param_descrs";

   procedure Z3_solver_set_params
     (c : Z3_context;
      s : Z3_solver;
      p : Z3_params)  -- /usr/include/z3_api.h:7084
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_set_params";

   procedure Z3_solver_inc_ref (c : Z3_context; s : Z3_solver)  -- /usr/include/z3_api.h:7092
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_inc_ref";

   procedure Z3_solver_dec_ref (c : Z3_context; s : Z3_solver)  -- /usr/include/z3_api.h:7099
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_dec_ref";

   procedure Z3_solver_push (c : Z3_context; s : Z3_solver)  -- /usr/include/z3_api.h:7111
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_push";

   procedure Z3_solver_pop
     (c : Z3_context;
      s : Z3_solver;
      n : unsigned)  -- /usr/include/z3_api.h:7122
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_pop";

   procedure Z3_solver_reset (c : Z3_context; s : Z3_solver)  -- /usr/include/z3_api.h:7129
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_reset";

   function Z3_solver_get_num_scopes (c : Z3_context; s : Z3_solver) return unsigned  -- /usr/include/z3_api.h:7139
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_num_scopes";

   procedure Z3_solver_assert
     (c : Z3_context;
      s : Z3_solver;
      a : Z3_ast)  -- /usr/include/z3_api.h:7149
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_assert";

   procedure Z3_solver_assert_and_track
     (c : Z3_context;
      s : Z3_solver;
      a : Z3_ast;
      p : Z3_ast)  -- /usr/include/z3_api.h:7165
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_assert_and_track";

   function Z3_solver_get_assertions (c : Z3_context; s : Z3_solver) return Z3_ast_vector  -- /usr/include/z3_api.h:7172
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_assertions";

   function Z3_solver_check (c : Z3_context; s : Z3_solver) return Z3_lbool  -- /usr/include/z3_api.h:7190
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_check";

   function Z3_solver_check_assumptions
     (c : Z3_context;
      s : Z3_solver;
      num_assumptions : unsigned;
      assumptions : System.Address) return Z3_lbool  -- /usr/include/z3_api.h:7203
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_check_assumptions";

   function Z3_solver_get_model (c : Z3_context; s : Z3_solver) return Z3_model  -- /usr/include/z3_api.h:7214
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_model";

   function Z3_solver_get_proof (c : Z3_context; s : Z3_solver) return Z3_ast  -- /usr/include/z3_api.h:7225
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_proof";

   function Z3_solver_get_unsat_core (c : Z3_context; s : Z3_solver) return Z3_ast_vector  -- /usr/include/z3_api.h:7233
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_unsat_core";

   function Z3_solver_get_reason_unknown (c : Z3_context; s : Z3_solver) return Z3_string  -- /usr/include/z3_api.h:7241
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_reason_unknown";

   function Z3_solver_get_statistics (c : Z3_context; s : Z3_solver) return Z3_stats  -- /usr/include/z3_api.h:7250
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_statistics";

   function Z3_solver_to_string (c : Z3_context; s : Z3_solver) return Z3_string  -- /usr/include/z3_api.h:7257
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_to_string";

   function Z3_stats_to_string (c : Z3_context; s : Z3_stats) return Z3_string  -- /usr/include/z3_api.h:7274
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_to_string";

   procedure Z3_stats_inc_ref (c : Z3_context; s : Z3_stats)  -- /usr/include/z3_api.h:7286
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_inc_ref";

   procedure Z3_stats_dec_ref (c : Z3_context; s : Z3_stats)  -- /usr/include/z3_api.h:7293
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_dec_ref";

   function Z3_stats_size (c : Z3_context; s : Z3_stats) return unsigned  -- /usr/include/z3_api.h:7301
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_size";

   function Z3_stats_get_key
     (c : Z3_context;
      s : Z3_stats;
      idx : unsigned) return Z3_string  -- /usr/include/z3_api.h:7310
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_get_key";

   function Z3_stats_is_uint
     (c : Z3_context;
      s : Z3_stats;
      idx : unsigned) return Z3_bool  -- /usr/include/z3_api.h:7319
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_is_uint";

   function Z3_stats_is_double
     (c : Z3_context;
      s : Z3_stats;
      idx : unsigned) return Z3_bool  -- /usr/include/z3_api.h:7328
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_is_double";

   function Z3_stats_get_uint_value
     (c : Z3_context;
      s : Z3_stats;
      idx : unsigned) return unsigned  -- /usr/include/z3_api.h:7337
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_get_uint_value";

   function Z3_stats_get_double_value
     (c : Z3_context;
      s : Z3_stats;
      idx : unsigned) return double  -- /usr/include/z3_api.h:7346
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_get_double_value";

   function Z3_mk_injective_function
     (c : Z3_context;
      s : Z3_symbol;
      domain_size : unsigned;
      domain : System.Address;
      c_range : Z3_sort) return Z3_func_decl  -- /usr/include/z3_api.h:7368
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_injective_function";

   function Z3_set_logic (c : Z3_context; logic : Z3_string) return Z3_bool  -- /usr/include/z3_api.h:7395
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_logic";

   procedure Z3_push (c : Z3_context)  -- /usr/include/z3_api.h:7410
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_push";

   procedure Z3_pop (c : Z3_context; num_scopes : unsigned)  -- /usr/include/z3_api.h:7427
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_pop";

   function Z3_get_num_scopes (c : Z3_context) return unsigned  -- /usr/include/z3_api.h:7441
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_num_scopes";

   procedure Z3_persist_ast
     (c : Z3_context;
      a : Z3_ast;
      num_scopes : unsigned)  -- /usr/include/z3_api.h:7464
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_persist_ast";

   procedure Z3_assert_cnstr (c : Z3_context; a : Z3_ast)  -- /usr/include/z3_api.h:7482
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_assert_cnstr";

   function Z3_check_and_get_model (c : Z3_context; m : System.Address) return Z3_lbool  -- /usr/include/z3_api.h:7507
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_check_and_get_model";

   function Z3_check (c : Z3_context) return Z3_lbool  -- /usr/include/z3_api.h:7520
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_check";

   function Z3_check_assumptions
     (c : Z3_context;
      num_assumptions : unsigned;
      assumptions : System.Address;
      m : System.Address;
      proof : System.Address;
      core_size : access unsigned;
      core : System.Address) return Z3_lbool  -- /usr/include/z3_api.h:7560
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_check_assumptions";

   function Z3_get_implied_equalities
     (c : Z3_context;
      s : Z3_solver;
      num_terms : unsigned;
      terms : System.Address;
      class_ids : access unsigned) return Z3_lbool  -- /usr/include/z3_api.h:7592
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_implied_equalities";

   procedure Z3_del_model (c : Z3_context; m : Z3_model)  -- /usr/include/z3_api.h:7616
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_del_model";

   procedure Z3_soft_check_cancel (c : Z3_context)  -- /usr/include/z3_api.h:7636
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_soft_check_cancel";

   function Z3_get_search_failure (c : Z3_context) return Z3_search_failure  -- /usr/include/z3_api.h:7648
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_search_failure";

   function Z3_mk_label
     (c : Z3_context;
      s : Z3_symbol;
      is_pos : Z3_bool;
      f : Z3_ast) return Z3_ast  -- /usr/include/z3_api.h:7675
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_label";

   function Z3_get_relevant_labels (c : Z3_context) return Z3_literals  -- /usr/include/z3_api.h:7690
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_relevant_labels";

   function Z3_get_relevant_literals (c : Z3_context) return Z3_literals  -- /usr/include/z3_api.h:7704
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_relevant_literals";

   function Z3_get_guessed_literals (c : Z3_context) return Z3_literals  -- /usr/include/z3_api.h:7719
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_guessed_literals";

   procedure Z3_del_literals (c : Z3_context; lbls : Z3_literals)  -- /usr/include/z3_api.h:7730
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_del_literals";

   function Z3_get_num_literals (c : Z3_context; lbls : Z3_literals) return unsigned  -- /usr/include/z3_api.h:7741
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_num_literals";

   function Z3_get_label_symbol
     (c : Z3_context;
      lbls : Z3_literals;
      idx : unsigned) return Z3_symbol  -- /usr/include/z3_api.h:7750
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_label_symbol";

   function Z3_get_literal
     (c : Z3_context;
      lbls : Z3_literals;
      idx : unsigned) return Z3_ast  -- /usr/include/z3_api.h:7759
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_literal";

   procedure Z3_disable_literal
     (c : Z3_context;
      lbls : Z3_literals;
      idx : unsigned)  -- /usr/include/z3_api.h:7772
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_disable_literal";

   procedure Z3_block_literals (c : Z3_context; lbls : Z3_literals)  -- /usr/include/z3_api.h:7781
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_block_literals";

   function Z3_get_model_num_constants (c : Z3_context; m : Z3_model) return unsigned  -- /usr/include/z3_api.h:7801
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_model_num_constants";

   function Z3_get_model_constant
     (c : Z3_context;
      m : Z3_model;
      i : unsigned) return Z3_func_decl  -- /usr/include/z3_api.h:7815
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_model_constant";

   function Z3_get_model_num_funcs (c : Z3_context; m : Z3_model) return unsigned  -- /usr/include/z3_api.h:7827
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_model_num_funcs";

   function Z3_get_model_func_decl
     (c : Z3_context;
      m : Z3_model;
      i : unsigned) return Z3_func_decl  -- /usr/include/z3_api.h:7841
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_model_func_decl";

   function Z3_eval_func_decl
     (c : Z3_context;
      m : Z3_model;
      decl : Z3_func_decl;
      v : System.Address) return Z3_bool  -- /usr/include/z3_api.h:7851
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_eval_func_decl";

   function Z3_is_array_value
     (c : Z3_context;
      m : Z3_model;
      v : Z3_ast;
      num_entries : access unsigned) return Z3_bool  -- /usr/include/z3_api.h:7868
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_array_value";

   procedure Z3_get_array_value
     (c : Z3_context;
      m : Z3_model;
      v : Z3_ast;
      num_entries : unsigned;
      indices : System.Address;
      values : System.Address;
      else_value : System.Address)  -- /usr/include/z3_api.h:7881
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_array_value";

   function Z3_get_model_func_else
     (c : Z3_context;
      m : Z3_model;
      i : unsigned) return Z3_ast  -- /usr/include/z3_api.h:7909
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_model_func_else";

   function Z3_get_model_func_num_entries
     (c : Z3_context;
      m : Z3_model;
      i : unsigned) return unsigned  -- /usr/include/z3_api.h:7930
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_model_func_num_entries";

   function Z3_get_model_func_entry_num_args
     (c : Z3_context;
      m : Z3_model;
      i : unsigned;
      j : unsigned) return unsigned  -- /usr/include/z3_api.h:7956
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_model_func_entry_num_args";

   function Z3_get_model_func_entry_arg
     (c : Z3_context;
      m : Z3_model;
      i : unsigned;
      j : unsigned;
      k : unsigned) return Z3_ast  -- /usr/include/z3_api.h:7986
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_model_func_entry_arg";

   function Z3_get_model_func_entry_value
     (c : Z3_context;
      m : Z3_model;
      i : unsigned;
      j : unsigned) return Z3_ast  -- /usr/include/z3_api.h:8015
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_model_func_entry_value";

   function Z3_eval
     (c : Z3_context;
      m : Z3_model;
      t : Z3_ast;
      v : System.Address) return Z3_bool  -- /usr/include/z3_api.h:8039
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_eval";

   function Z3_eval_decl
     (c : Z3_context;
      m : Z3_model;
      d : Z3_func_decl;
      num_args : unsigned;
      args : System.Address;
      v : System.Address) return Z3_bool  -- /usr/include/z3_api.h:8051
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_eval_decl";

   function Z3_context_to_string (c : Z3_context) return Z3_string  -- /usr/include/z3_api.h:8079
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_context_to_string";

   function Z3_statistics_to_string (c : Z3_context) return Z3_string  -- /usr/include/z3_api.h:8096
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_statistics_to_string";

   function Z3_get_context_assignment (c : Z3_context) return Z3_ast  -- /usr/include/z3_api.h:8111
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_context_assignment";

end z3_api_h;
