pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
with System;

package z3_api_h is

   --  unsupported macro: Z3_sort_opt Z3_sort
   --  unsupported macro: Z3_ast_opt Z3_ast
   --  unsupported macro: Z3_func_interp_opt Z3_func_interp
   --  unsupported macro: Z3_TRUE true
   --  unsupported macro: Z3_FALSE false

   subtype uint64_t is Interfaces.C.Extensions.unsigned_long_long;

   subtype int64_t is Long_Long_Integer;

   type u_Z3_symbol is null record;   -- incomplete struct

   type Z3_symbol is access all u_Z3_symbol;  -- z3/src/api/z3_api.h:7

   type u_Z3_literals is null record;   -- incomplete struct

   type Z3_literals is access all u_Z3_literals;  -- z3/src/api/z3_api.h:8

   type u_Z3_config is null record;   -- incomplete struct

   type Z3_config is access all u_Z3_config;  -- z3/src/api/z3_api.h:9

   type u_Z3_context is null record;   -- incomplete struct

   type Z3_context is access all u_Z3_context;  -- z3/src/api/z3_api.h:10

   type u_Z3_sort is null record;   -- incomplete struct

   type Z3_sort is access all u_Z3_sort;  -- z3/src/api/z3_api.h:11

   type u_Z3_func_decl is null record;   -- incomplete struct

   type Z3_func_decl is access all u_Z3_func_decl;  -- z3/src/api/z3_api.h:13

   type u_Z3_ast is null record;   -- incomplete struct

   type Z3_ast is access all u_Z3_ast;  -- z3/src/api/z3_api.h:14

   type u_Z3_app is null record;   -- incomplete struct

   type Z3_app is access all u_Z3_app;  -- z3/src/api/z3_api.h:16

   type u_Z3_pattern is null record;   -- incomplete struct

   type Z3_pattern is access all u_Z3_pattern;  -- z3/src/api/z3_api.h:17

   type u_Z3_model is null record;   -- incomplete struct

   type Z3_model is access all u_Z3_model;  -- z3/src/api/z3_api.h:18

   type u_Z3_constructor is null record;   -- incomplete struct

   type Z3_constructor is access all u_Z3_constructor;  -- z3/src/api/z3_api.h:19

   type u_Z3_constructor_list is null record;   -- incomplete struct

   type Z3_constructor_list is access all u_Z3_constructor_list;  -- z3/src/api/z3_api.h:20

   type u_Z3_params is null record;   -- incomplete struct

   type Z3_params is access all u_Z3_params;  -- z3/src/api/z3_api.h:21

   type u_Z3_param_descrs is null record;   -- incomplete struct

   type Z3_param_descrs is access all u_Z3_param_descrs;  -- z3/src/api/z3_api.h:22

   type u_Z3_goal is null record;   -- incomplete struct

   type Z3_goal is access all u_Z3_goal;  -- z3/src/api/z3_api.h:23

   type u_Z3_tactic is null record;   -- incomplete struct

   type Z3_tactic is access all u_Z3_tactic;  -- z3/src/api/z3_api.h:24

   type u_Z3_probe is null record;   -- incomplete struct

   type Z3_probe is access all u_Z3_probe;  -- z3/src/api/z3_api.h:25

   type u_Z3_stats is null record;   -- incomplete struct

   type Z3_stats is access all u_Z3_stats;  -- z3/src/api/z3_api.h:26

   type u_Z3_solver is null record;   -- incomplete struct

   type Z3_solver is access all u_Z3_solver;  -- z3/src/api/z3_api.h:27

   type u_Z3_solver_callback is null record;   -- incomplete struct

   type Z3_solver_callback is access all u_Z3_solver_callback;  -- z3/src/api/z3_api.h:28

   type u_Z3_ast_vector is null record;   -- incomplete struct

   type Z3_ast_vector is access all u_Z3_ast_vector;  -- z3/src/api/z3_api.h:29

   type u_Z3_ast_map is null record;   -- incomplete struct

   type Z3_ast_map is access all u_Z3_ast_map;  -- z3/src/api/z3_api.h:30

   type u_Z3_apply_result is null record;   -- incomplete struct

   type Z3_apply_result is access all u_Z3_apply_result;  -- z3/src/api/z3_api.h:31

   type u_Z3_func_interp is null record;   -- incomplete struct

   type Z3_func_interp is access all u_Z3_func_interp;  -- z3/src/api/z3_api.h:32

   type u_Z3_func_entry is null record;   -- incomplete struct

   type Z3_func_entry is access all u_Z3_func_entry;  -- z3/src/api/z3_api.h:34

   type u_Z3_fixedpoint is null record;   -- incomplete struct

   type Z3_fixedpoint is access all u_Z3_fixedpoint;  -- z3/src/api/z3_api.h:35

   type u_Z3_optimize is null record;   -- incomplete struct

   type Z3_optimize is access all u_Z3_optimize;  -- z3/src/api/z3_api.h:36

   type u_Z3_rcf_num is null record;   -- incomplete struct

   type Z3_rcf_num is access all u_Z3_rcf_num;  -- z3/src/api/z3_api.h:37

   subtype Z3_bool is Extensions.bool;  -- z3/src/api/z3_api.h:77

   type Z3_string is new Interfaces.C.Strings.chars_ptr;  -- z3/src/api/z3_api.h:82

   type Z3_char_ptr is new Interfaces.C.Strings.chars_ptr;  -- z3/src/api/z3_api.h:83

   type Z3_string_ptr is new System.Address;  -- z3/src/api/z3_api.h:84

   subtype Z3_lbool is int;
   Z3_L_FALSE : constant int := -1;
   Z3_L_UNDEF : constant int := 0;
   Z3_L_TRUE : constant int := 1;  -- z3/src/api/z3_api.h:104

   type Z3_symbol_kind is 
     (Z3_INT_SYMBOL,
      Z3_STRING_SYMBOL)
   with Convention => C;  -- z3/src/api/z3_api.h:117

   type Z3_parameter_kind is 
     (Z3_PARAMETER_INT,
      Z3_PARAMETER_DOUBLE,
      Z3_PARAMETER_RATIONAL,
      Z3_PARAMETER_SYMBOL,
      Z3_PARAMETER_SORT,
      Z3_PARAMETER_AST,
      Z3_PARAMETER_FUNC_DECL)
   with Convention => C;  -- z3/src/api/z3_api.h:142

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
   Z3_SEQ_SORT : constant unsigned := 11;
   Z3_RE_SORT : constant unsigned := 12;
   Z3_UNKNOWN_SORT : constant unsigned := 1000;  -- z3/src/api/z3_api.h:163

   subtype Z3_ast_kind is unsigned;
   Z3_NUMERAL_AST : constant unsigned := 0;
   Z3_APP_AST : constant unsigned := 1;
   Z3_VAR_AST : constant unsigned := 2;
   Z3_QUANTIFIER_AST : constant unsigned := 3;
   Z3_SORT_AST : constant unsigned := 4;
   Z3_FUNC_DECL_AST : constant unsigned := 5;
   Z3_UNKNOWN_AST : constant unsigned := 1000;  -- z3/src/api/z3_api.h:186

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
   Z3_OP_ARRAY_EXT : constant unsigned := 779;
   Z3_OP_SET_HAS_SIZE : constant unsigned := 780;
   Z3_OP_SET_CARD : constant unsigned := 781;
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
   Z3_OP_BIT2BOOL : constant unsigned := 1071;
   Z3_OP_INT2BV : constant unsigned := 1072;
   Z3_OP_BV2INT : constant unsigned := 1073;
   Z3_OP_CARRY : constant unsigned := 1074;
   Z3_OP_XOR3 : constant unsigned := 1075;
   Z3_OP_BSMUL_NO_OVFL : constant unsigned := 1076;
   Z3_OP_BUMUL_NO_OVFL : constant unsigned := 1077;
   Z3_OP_BSMUL_NO_UDFL : constant unsigned := 1078;
   Z3_OP_BSDIV_I : constant unsigned := 1079;
   Z3_OP_BUDIV_I : constant unsigned := 1080;
   Z3_OP_BSREM_I : constant unsigned := 1081;
   Z3_OP_BUREM_I : constant unsigned := 1082;
   Z3_OP_BSMOD_I : constant unsigned := 1083;
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
   Z3_OP_PR_BIND : constant unsigned := 1291;
   Z3_OP_PR_DISTRIBUTIVITY : constant unsigned := 1292;
   Z3_OP_PR_AND_ELIM : constant unsigned := 1293;
   Z3_OP_PR_NOT_OR_ELIM : constant unsigned := 1294;
   Z3_OP_PR_REWRITE : constant unsigned := 1295;
   Z3_OP_PR_REWRITE_STAR : constant unsigned := 1296;
   Z3_OP_PR_PULL_QUANT : constant unsigned := 1297;
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
   Z3_OP_PR_ASSUMPTION_ADD : constant unsigned := 1309;
   Z3_OP_PR_LEMMA_ADD : constant unsigned := 1310;
   Z3_OP_PR_REDUNDANT_DEL : constant unsigned := 1311;
   Z3_OP_PR_CLAUSE_TRAIL : constant unsigned := 1312;
   Z3_OP_PR_DEF_INTRO : constant unsigned := 1313;
   Z3_OP_PR_APPLY_DEF : constant unsigned := 1314;
   Z3_OP_PR_IFF_OEQ : constant unsigned := 1315;
   Z3_OP_PR_NNF_POS : constant unsigned := 1316;
   Z3_OP_PR_NNF_NEG : constant unsigned := 1317;
   Z3_OP_PR_SKOLEMIZE : constant unsigned := 1318;
   Z3_OP_PR_MODUS_PONENS_OEQ : constant unsigned := 1319;
   Z3_OP_PR_TH_LEMMA : constant unsigned := 1320;
   Z3_OP_PR_HYPER_RESOLVE : constant unsigned := 1321;
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
   Z3_OP_FD_CONSTANT : constant unsigned := 1549;
   Z3_OP_FD_LT : constant unsigned := 1550;
   Z3_OP_SEQ_UNIT : constant unsigned := 1551;
   Z3_OP_SEQ_EMPTY : constant unsigned := 1552;
   Z3_OP_SEQ_CONCAT : constant unsigned := 1553;
   Z3_OP_SEQ_PREFIX : constant unsigned := 1554;
   Z3_OP_SEQ_SUFFIX : constant unsigned := 1555;
   Z3_OP_SEQ_CONTAINS : constant unsigned := 1556;
   Z3_OP_SEQ_EXTRACT : constant unsigned := 1557;
   Z3_OP_SEQ_REPLACE : constant unsigned := 1558;
   Z3_OP_SEQ_AT : constant unsigned := 1559;
   Z3_OP_SEQ_NTH : constant unsigned := 1560;
   Z3_OP_SEQ_LENGTH : constant unsigned := 1561;
   Z3_OP_SEQ_INDEX : constant unsigned := 1562;
   Z3_OP_SEQ_LAST_INDEX : constant unsigned := 1563;
   Z3_OP_SEQ_TO_RE : constant unsigned := 1564;
   Z3_OP_SEQ_IN_RE : constant unsigned := 1565;
   Z3_OP_STR_TO_INT : constant unsigned := 1566;
   Z3_OP_INT_TO_STR : constant unsigned := 1567;
   Z3_OP_RE_PLUS : constant unsigned := 1568;
   Z3_OP_RE_STAR : constant unsigned := 1569;
   Z3_OP_RE_OPTION : constant unsigned := 1570;
   Z3_OP_RE_CONCAT : constant unsigned := 1571;
   Z3_OP_RE_UNION : constant unsigned := 1572;
   Z3_OP_RE_RANGE : constant unsigned := 1573;
   Z3_OP_RE_LOOP : constant unsigned := 1574;
   Z3_OP_RE_INTERSECT : constant unsigned := 1575;
   Z3_OP_RE_EMPTY_SET : constant unsigned := 1576;
   Z3_OP_RE_FULL_SET : constant unsigned := 1577;
   Z3_OP_RE_COMPLEMENT : constant unsigned := 1578;
   Z3_OP_LABEL : constant unsigned := 1792;
   Z3_OP_LABEL_LIT : constant unsigned := 1793;
   Z3_OP_DT_CONSTRUCTOR : constant unsigned := 2048;
   Z3_OP_DT_RECOGNISER : constant unsigned := 2049;
   Z3_OP_DT_IS : constant unsigned := 2050;
   Z3_OP_DT_ACCESSOR : constant unsigned := 2051;
   Z3_OP_DT_UPDATE_FIELD : constant unsigned := 2052;
   Z3_OP_PB_AT_MOST : constant unsigned := 2304;
   Z3_OP_PB_AT_LEAST : constant unsigned := 2305;
   Z3_OP_PB_LE : constant unsigned := 2306;
   Z3_OP_PB_GE : constant unsigned := 2307;
   Z3_OP_PB_EQ : constant unsigned := 2308;
   Z3_OP_SPECIAL_RELATION_LO : constant unsigned := 40960;
   Z3_OP_SPECIAL_RELATION_PO : constant unsigned := 40961;
   Z3_OP_SPECIAL_RELATION_PLO : constant unsigned := 40962;
   Z3_OP_SPECIAL_RELATION_TO : constant unsigned := 40963;
   Z3_OP_SPECIAL_RELATION_TC : constant unsigned := 40964;
   Z3_OP_SPECIAL_RELATION_TRC : constant unsigned := 40965;
   Z3_OP_FPA_RM_NEAREST_TIES_TO_EVEN : constant unsigned := 45056;
   Z3_OP_FPA_RM_NEAREST_TIES_TO_AWAY : constant unsigned := 45057;
   Z3_OP_FPA_RM_TOWARD_POSITIVE : constant unsigned := 45058;
   Z3_OP_FPA_RM_TOWARD_NEGATIVE : constant unsigned := 45059;
   Z3_OP_FPA_RM_TOWARD_ZERO : constant unsigned := 45060;
   Z3_OP_FPA_NUM : constant unsigned := 45061;
   Z3_OP_FPA_PLUS_INF : constant unsigned := 45062;
   Z3_OP_FPA_MINUS_INF : constant unsigned := 45063;
   Z3_OP_FPA_NAN : constant unsigned := 45064;
   Z3_OP_FPA_PLUS_ZERO : constant unsigned := 45065;
   Z3_OP_FPA_MINUS_ZERO : constant unsigned := 45066;
   Z3_OP_FPA_ADD : constant unsigned := 45067;
   Z3_OP_FPA_SUB : constant unsigned := 45068;
   Z3_OP_FPA_NEG : constant unsigned := 45069;
   Z3_OP_FPA_MUL : constant unsigned := 45070;
   Z3_OP_FPA_DIV : constant unsigned := 45071;
   Z3_OP_FPA_REM : constant unsigned := 45072;
   Z3_OP_FPA_ABS : constant unsigned := 45073;
   Z3_OP_FPA_MIN : constant unsigned := 45074;
   Z3_OP_FPA_MAX : constant unsigned := 45075;
   Z3_OP_FPA_FMA : constant unsigned := 45076;
   Z3_OP_FPA_SQRT : constant unsigned := 45077;
   Z3_OP_FPA_ROUND_TO_INTEGRAL : constant unsigned := 45078;
   Z3_OP_FPA_EQ : constant unsigned := 45079;
   Z3_OP_FPA_LT : constant unsigned := 45080;
   Z3_OP_FPA_GT : constant unsigned := 45081;
   Z3_OP_FPA_LE : constant unsigned := 45082;
   Z3_OP_FPA_GE : constant unsigned := 45083;
   Z3_OP_FPA_IS_NAN : constant unsigned := 45084;
   Z3_OP_FPA_IS_INF : constant unsigned := 45085;
   Z3_OP_FPA_IS_ZERO : constant unsigned := 45086;
   Z3_OP_FPA_IS_NORMAL : constant unsigned := 45087;
   Z3_OP_FPA_IS_SUBNORMAL : constant unsigned := 45088;
   Z3_OP_FPA_IS_NEGATIVE : constant unsigned := 45089;
   Z3_OP_FPA_IS_POSITIVE : constant unsigned := 45090;
   Z3_OP_FPA_FP : constant unsigned := 45091;
   Z3_OP_FPA_TO_FP : constant unsigned := 45092;
   Z3_OP_FPA_TO_FP_UNSIGNED : constant unsigned := 45093;
   Z3_OP_FPA_TO_UBV : constant unsigned := 45094;
   Z3_OP_FPA_TO_SBV : constant unsigned := 45095;
   Z3_OP_FPA_TO_REAL : constant unsigned := 45096;
   Z3_OP_FPA_TO_IEEE_BV : constant unsigned := 45097;
   Z3_OP_FPA_BVWRAP : constant unsigned := 45098;
   Z3_OP_FPA_BV2RM : constant unsigned := 45099;
   Z3_OP_INTERNAL : constant unsigned := 45100;
   Z3_OP_UNINTERPRETED : constant unsigned := 45101;  -- z3/src/api/z3_api.h:1308

   type Z3_param_kind is 
     (Z3_PK_UINT,
      Z3_PK_BOOL,
      Z3_PK_DOUBLE,
      Z3_PK_SYMBOL,
      Z3_PK_STRING,
      Z3_PK_OTHER,
      Z3_PK_INVALID)
   with Convention => C;  -- z3/src/api/z3_api.h:1330

   type Z3_ast_print_mode is 
     (Z3_PRINT_SMTLIB_FULL,
      Z3_PRINT_LOW_LEVEL,
      Z3_PRINT_SMTLIB2_COMPLIANT)
   with Convention => C;  -- z3/src/api/z3_api.h:1343

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
   with Convention => C;  -- z3/src/api/z3_api.h:1378

   --  skipped function type Z3_error_handler

   --  skipped function type Z3_push_eh

   --  skipped function type Z3_pop_eh

   --  skipped function type Z3_fresh_eh

   --  skipped function type Z3_fixed_eh

   --  skipped function type Z3_eq_eh

   --  skipped function type Z3_final_eh

   type Z3_goal_prec is 
     (Z3_GOAL_PRECISE,
      Z3_GOAL_UNDER,
      Z3_GOAL_OVER,
      Z3_GOAL_UNDER_OVER)
   with Convention => C;  -- z3/src/api/z3_api.h:1444

   procedure Z3_global_param_set (param_id : Z3_string; param_value : Z3_string)  -- z3/src/api/z3_api.h:1479
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_global_param_set";

   procedure Z3_global_param_reset_all  -- z3/src/api/z3_api.h:1491
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_global_param_reset_all";

   function Z3_global_param_get (param_id : Z3_string; param_value : Z3_string_ptr) return Z3_bool  -- z3/src/api/z3_api.h:1506
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_global_param_get";

   function Z3_mk_config return Z3_config  -- z3/src/api/z3_api.h:1543
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_config";

   procedure Z3_del_config (c : Z3_config)  -- z3/src/api/z3_api.h:1552
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_del_config";

   procedure Z3_set_param_value
     (c : Z3_config;
      param_id : Z3_string;
      param_value : Z3_string)  -- z3/src/api/z3_api.h:1563
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_param_value";

   function Z3_mk_context (c : Z3_config) return Z3_context  -- z3/src/api/z3_api.h:1596
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_context";

   function Z3_mk_context_rc (c : Z3_config) return Z3_context  -- z3/src/api/z3_api.h:1620
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_context_rc";

   procedure Z3_del_context (c : Z3_context)  -- z3/src/api/z3_api.h:1629
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_del_context";

   procedure Z3_inc_ref (c : Z3_context; a : Z3_ast)  -- z3/src/api/z3_api.h:1638
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_inc_ref";

   procedure Z3_dec_ref (c : Z3_context; a : Z3_ast)  -- z3/src/api/z3_api.h:1647
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_dec_ref";

   procedure Z3_update_param_value
     (c : Z3_context;
      param_id : Z3_string;
      param_value : Z3_string)  -- z3/src/api/z3_api.h:1656
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_update_param_value";

   procedure Z3_interrupt (c : Z3_context)  -- z3/src/api/z3_api.h:1664
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_interrupt";

   function Z3_mk_params (c : Z3_context) return Z3_params  -- z3/src/api/z3_api.h:1682
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_params";

   procedure Z3_params_inc_ref (c : Z3_context; p : Z3_params)  -- z3/src/api/z3_api.h:1689
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_inc_ref";

   procedure Z3_params_dec_ref (c : Z3_context; p : Z3_params)  -- z3/src/api/z3_api.h:1696
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_dec_ref";

   procedure Z3_params_set_bool
     (c : Z3_context;
      p : Z3_params;
      k : Z3_symbol;
      v : Extensions.bool)  -- z3/src/api/z3_api.h:1703
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_set_bool";

   procedure Z3_params_set_uint
     (c : Z3_context;
      p : Z3_params;
      k : Z3_symbol;
      v : unsigned)  -- z3/src/api/z3_api.h:1710
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_set_uint";

   procedure Z3_params_set_double
     (c : Z3_context;
      p : Z3_params;
      k : Z3_symbol;
      v : double)  -- z3/src/api/z3_api.h:1717
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_set_double";

   procedure Z3_params_set_symbol
     (c : Z3_context;
      p : Z3_params;
      k : Z3_symbol;
      v : Z3_symbol)  -- z3/src/api/z3_api.h:1724
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_set_symbol";

   function Z3_params_to_string (c : Z3_context; p : Z3_params) return Z3_string  -- z3/src/api/z3_api.h:1732
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_to_string";

   procedure Z3_params_validate
     (c : Z3_context;
      p : Z3_params;
      d : Z3_param_descrs)  -- z3/src/api/z3_api.h:1741
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_params_validate";

   procedure Z3_param_descrs_inc_ref (c : Z3_context; p : Z3_param_descrs)  -- z3/src/api/z3_api.h:1753
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_param_descrs_inc_ref";

   procedure Z3_param_descrs_dec_ref (c : Z3_context; p : Z3_param_descrs)  -- z3/src/api/z3_api.h:1760
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_param_descrs_dec_ref";

   function Z3_param_descrs_get_kind
     (c : Z3_context;
      p : Z3_param_descrs;
      n : Z3_symbol) return Z3_param_kind  -- z3/src/api/z3_api.h:1767
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_param_descrs_get_kind";

   function Z3_param_descrs_size (c : Z3_context; p : Z3_param_descrs) return unsigned  -- z3/src/api/z3_api.h:1774
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_param_descrs_size";

   function Z3_param_descrs_get_name
     (c : Z3_context;
      p : Z3_param_descrs;
      i : unsigned) return Z3_symbol  -- z3/src/api/z3_api.h:1783
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_param_descrs_get_name";

   function Z3_param_descrs_get_documentation
     (c : Z3_context;
      p : Z3_param_descrs;
      s : Z3_symbol) return Z3_string  -- z3/src/api/z3_api.h:1790
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_param_descrs_get_documentation";

   function Z3_param_descrs_to_string (c : Z3_context; p : Z3_param_descrs) return Z3_string  -- z3/src/api/z3_api.h:1798
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_param_descrs_to_string";

   function Z3_mk_int_symbol (c : Z3_context; i : int) return Z3_symbol  -- z3/src/api/z3_api.h:1818
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_int_symbol";

   function Z3_mk_string_symbol (c : Z3_context; s : Z3_string) return Z3_symbol  -- z3/src/api/z3_api.h:1830
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_string_symbol";

   function Z3_mk_uninterpreted_sort (c : Z3_context; s : Z3_symbol) return Z3_sort  -- z3/src/api/z3_api.h:1844
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_uninterpreted_sort";

   function Z3_mk_bool_sort (c : Z3_context) return Z3_sort  -- z3/src/api/z3_api.h:1853
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bool_sort";

   function Z3_mk_int_sort (c : Z3_context) return Z3_sort  -- z3/src/api/z3_api.h:1866
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_int_sort";

   function Z3_mk_real_sort (c : Z3_context) return Z3_sort  -- z3/src/api/z3_api.h:1875
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_real_sort";

   function Z3_mk_bv_sort (c : Z3_context; sz : unsigned) return Z3_sort  -- z3/src/api/z3_api.h:1886
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bv_sort";

   function Z3_mk_finite_domain_sort
     (c : Z3_context;
      name : Z3_symbol;
      size : uint64_t) return Z3_sort  -- z3/src/api/z3_api.h:1901
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_finite_domain_sort";

   function Z3_mk_array_sort
     (c : Z3_context;
      domain : Z3_sort;
      c_range : Z3_sort) return Z3_sort  -- z3/src/api/z3_api.h:1914
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_array_sort";

   function Z3_mk_array_sort_n
     (c : Z3_context;
      n : unsigned;
      domain : System.Address;
      c_range : Z3_sort) return Z3_sort  -- z3/src/api/z3_api.h:1924
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_array_sort_n";

   function Z3_mk_tuple_sort
     (c : Z3_context;
      mk_tuple_name : Z3_symbol;
      num_fields : unsigned;
      field_names : System.Address;
      field_sorts : System.Address;
      mk_tuple_decl : System.Address;
      proj_decl : System.Address) return Z3_sort  -- z3/src/api/z3_api.h:1942
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_tuple_sort";

   function Z3_mk_enumeration_sort
     (c : Z3_context;
      name : Z3_symbol;
      n : unsigned;
      enum_names : System.Address;
      enum_consts : System.Address;
      enum_testers : System.Address) return Z3_sort  -- z3/src/api/z3_api.h:1971
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
      tail_decl : System.Address) return Z3_sort  -- z3/src/api/z3_api.h:1996
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
      sort_refs : access unsigned) return Z3_constructor  -- z3/src/api/z3_api.h:2026
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_constructor";

   procedure Z3_del_constructor (c : Z3_context; constr : Z3_constructor)  -- z3/src/api/z3_api.h:2045
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_del_constructor";

   function Z3_mk_datatype
     (c : Z3_context;
      name : Z3_symbol;
      num_constructors : unsigned;
      constructors : System.Address) return Z3_sort  -- z3/src/api/z3_api.h:2062
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_datatype";

   function Z3_mk_constructor_list
     (c : Z3_context;
      num_constructors : unsigned;
      constructors : System.Address) return Z3_constructor_list  -- z3/src/api/z3_api.h:2079
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_constructor_list";

   procedure Z3_del_constructor_list (c : Z3_context; clist : Z3_constructor_list)  -- z3/src/api/z3_api.h:2095
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_del_constructor_list";

   procedure Z3_mk_datatypes
     (c : Z3_context;
      num_sorts : unsigned;
      sort_names : System.Address;
      sorts : System.Address;
      constructor_lists : System.Address)  -- z3/src/api/z3_api.h:2112
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_datatypes";

   procedure Z3_query_constructor
     (c : Z3_context;
      constr : Z3_constructor;
      num_fields : unsigned;
      constructor : System.Address;
      tester : System.Address;
      accessors : System.Address)  -- z3/src/api/z3_api.h:2132
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_query_constructor";

   function Z3_mk_func_decl
     (c : Z3_context;
      s : Z3_symbol;
      domain_size : unsigned;
      domain : System.Address;
      c_range : Z3_sort) return Z3_func_decl  -- z3/src/api/z3_api.h:2163
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_func_decl";

   function Z3_mk_app
     (c : Z3_context;
      d : Z3_func_decl;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:2178
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_app";

   function Z3_mk_const
     (c : Z3_context;
      s : Z3_symbol;
      ty : Z3_sort) return Z3_ast  -- z3/src/api/z3_api.h:2199
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_const";

   function Z3_mk_fresh_func_decl
     (c : Z3_context;
      prefix : Z3_string;
      domain_size : unsigned;
      domain : System.Address;
      c_range : Z3_sort) return Z3_func_decl  -- z3/src/api/z3_api.h:2213
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_fresh_func_decl";

   function Z3_mk_fresh_const
     (c : Z3_context;
      prefix : Z3_string;
      ty : Z3_sort) return Z3_ast  -- z3/src/api/z3_api.h:2232
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_fresh_const";

   function Z3_mk_rec_func_decl
     (c : Z3_context;
      s : Z3_symbol;
      domain_size : unsigned;
      domain : System.Address;
      c_range : Z3_sort) return Z3_func_decl  -- z3/src/api/z3_api.h:2254
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_rec_func_decl";

   procedure Z3_add_rec_def
     (c : Z3_context;
      f : Z3_func_decl;
      n : unsigned;
      args : System.Address;
      c_body : Z3_ast)  -- z3/src/api/z3_api.h:2274
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_add_rec_def";

   function Z3_mk_true (c : Z3_context) return Z3_ast  -- z3/src/api/z3_api.h:2285
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_true";

   function Z3_mk_false (c : Z3_context) return Z3_ast  -- z3/src/api/z3_api.h:2292
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_false";

   function Z3_mk_eq
     (c : Z3_context;
      l : Z3_ast;
      r : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2301
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_eq";

   function Z3_mk_distinct
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:2315
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_distinct";

   function Z3_mk_not (c : Z3_context; a : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2324
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_not";

   function Z3_mk_ite
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast;
      t3 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2334
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_ite";

   function Z3_mk_iff
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2343
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_iff";

   function Z3_mk_implies
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2352
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_implies";

   function Z3_mk_xor
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2361
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_xor";

   function Z3_mk_and
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:2373
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_and";

   function Z3_mk_or
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:2385
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_or";

   function Z3_mk_add
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:2400
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_add";

   function Z3_mk_mul
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:2413
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_mul";

   function Z3_mk_sub
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:2425
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_sub";

   function Z3_mk_unary_minus (c : Z3_context; arg : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2434
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_unary_minus";

   function Z3_mk_div
     (c : Z3_context;
      arg1 : Z3_ast;
      arg2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2445
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_div";

   function Z3_mk_mod
     (c : Z3_context;
      arg1 : Z3_ast;
      arg2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2454
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_mod";

   function Z3_mk_rem
     (c : Z3_context;
      arg1 : Z3_ast;
      arg2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2463
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_rem";

   function Z3_mk_power
     (c : Z3_context;
      arg1 : Z3_ast;
      arg2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2472
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_power";

   function Z3_mk_lt
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2481
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_lt";

   function Z3_mk_le
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2490
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_le";

   function Z3_mk_gt
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2499
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_gt";

   function Z3_mk_ge
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2508
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_ge";

   function Z3_mk_divides
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2519
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_divides";

   function Z3_mk_int2real (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2538
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_int2real";

   function Z3_mk_real2int (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2551
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_real2int";

   function Z3_mk_is_int (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2561
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_is_int";

   function Z3_mk_bvnot (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2573
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvnot";

   function Z3_mk_bvredand (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2582
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvredand";

   function Z3_mk_bvredor (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2591
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvredor";

   function Z3_mk_bvand
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2600
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvand";

   function Z3_mk_bvor
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2609
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvor";

   function Z3_mk_bvxor
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2618
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvxor";

   function Z3_mk_bvnand
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2627
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvnand";

   function Z3_mk_bvnor
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2636
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvnor";

   function Z3_mk_bvxnor
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2645
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvxnor";

   function Z3_mk_bvneg (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2654
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvneg";

   function Z3_mk_bvadd
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2663
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvadd";

   function Z3_mk_bvsub
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2672
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsub";

   function Z3_mk_bvmul
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2681
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvmul";

   function Z3_mk_bvudiv
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2694
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvudiv";

   function Z3_mk_bvsdiv
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2711
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsdiv";

   function Z3_mk_bvurem
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2724
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvurem";

   function Z3_mk_bvsrem
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2740
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsrem";

   function Z3_mk_bvsmod
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2753
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsmod";

   function Z3_mk_bvult
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2762
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvult";

   function Z3_mk_bvslt
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2779
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvslt";

   function Z3_mk_bvule
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2788
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvule";

   function Z3_mk_bvsle
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2797
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsle";

   function Z3_mk_bvuge
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2806
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvuge";

   function Z3_mk_bvsge
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2815
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsge";

   function Z3_mk_bvugt
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2824
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvugt";

   function Z3_mk_bvsgt
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2833
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsgt";

   function Z3_mk_concat
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2845
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_concat";

   function Z3_mk_extract
     (c : Z3_context;
      high : unsigned;
      low : unsigned;
      t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2855
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_extract";

   function Z3_mk_sign_ext
     (c : Z3_context;
      i : unsigned;
      t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2866
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_sign_ext";

   function Z3_mk_zero_ext
     (c : Z3_context;
      i : unsigned;
      t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2877
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_zero_ext";

   function Z3_mk_repeat
     (c : Z3_context;
      i : unsigned;
      t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2886
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_repeat";

   function Z3_mk_bvshl
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2902
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvshl";

   function Z3_mk_bvlshr
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2918
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvlshr";

   function Z3_mk_bvashr
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2935
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvashr";

   function Z3_mk_rotate_left
     (c : Z3_context;
      i : unsigned;
      t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2944
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_rotate_left";

   function Z3_mk_rotate_right
     (c : Z3_context;
      i : unsigned;
      t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2953
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_rotate_right";

   function Z3_mk_ext_rotate_left
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2962
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_ext_rotate_left";

   function Z3_mk_ext_rotate_right
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2971
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_ext_rotate_right";

   function Z3_mk_int2bv
     (c : Z3_context;
      n : unsigned;
      t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:2983
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_int2bv";

   function Z3_mk_bv2int
     (c : Z3_context;
      t1 : Z3_ast;
      is_signed : Extensions.bool) return Z3_ast  -- z3/src/api/z3_api.h:2997
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bv2int";

   function Z3_mk_bvadd_no_overflow
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast;
      is_signed : Extensions.bool) return Z3_ast  -- z3/src/api/z3_api.h:3008
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvadd_no_overflow";

   function Z3_mk_bvadd_no_underflow
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3019
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvadd_no_underflow";

   function Z3_mk_bvsub_no_overflow
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3030
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsub_no_overflow";

   function Z3_mk_bvsub_no_underflow
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast;
      is_signed : Extensions.bool) return Z3_ast  -- z3/src/api/z3_api.h:3041
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsub_no_underflow";

   function Z3_mk_bvsdiv_no_overflow
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3052
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvsdiv_no_overflow";

   function Z3_mk_bvneg_no_overflow (c : Z3_context; t1 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3063
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvneg_no_overflow";

   function Z3_mk_bvmul_no_overflow
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast;
      is_signed : Extensions.bool) return Z3_ast  -- z3/src/api/z3_api.h:3074
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvmul_no_overflow";

   function Z3_mk_bvmul_no_underflow
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3085
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bvmul_no_underflow";

   function Z3_mk_select
     (c : Z3_context;
      a : Z3_ast;
      i : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3103
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_select";

   function Z3_mk_select_n
     (c : Z3_context;
      a : Z3_ast;
      n : unsigned;
      idxs : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:3114
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_select_n";

   function Z3_mk_store
     (c : Z3_context;
      a : Z3_ast;
      i : Z3_ast;
      v : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3133
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_store";

   function Z3_mk_store_n
     (c : Z3_context;
      a : Z3_ast;
      n : unsigned;
      idxs : System.Address;
      v : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3142
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_store_n";

   function Z3_mk_const_array
     (c : Z3_context;
      domain : Z3_sort;
      v : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3156
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_const_array";

   function Z3_mk_map
     (c : Z3_context;
      f : Z3_func_decl;
      n : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:3171
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_map";

   function Z3_mk_array_default (c : Z3_context; c_array : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3183
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_array_default";

   function Z3_mk_as_array (c : Z3_context; f : Z3_func_decl) return Z3_ast  -- z3/src/api/z3_api.h:3192
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_as_array";

   function Z3_mk_set_has_size
     (c : Z3_context;
      set : Z3_ast;
      k : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3199
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_has_size";

   function Z3_mk_set_sort (c : Z3_context; ty : Z3_sort) return Z3_sort  -- z3/src/api/z3_api.h:3210
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_sort";

   function Z3_mk_empty_set (c : Z3_context; domain : Z3_sort) return Z3_ast  -- z3/src/api/z3_api.h:3217
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_empty_set";

   function Z3_mk_full_set (c : Z3_context; domain : Z3_sort) return Z3_ast  -- z3/src/api/z3_api.h:3224
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_full_set";

   function Z3_mk_set_add
     (c : Z3_context;
      set : Z3_ast;
      elem : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3233
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_add";

   function Z3_mk_set_del
     (c : Z3_context;
      set : Z3_ast;
      elem : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3242
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_del";

   function Z3_mk_set_union
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:3249
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_union";

   function Z3_mk_set_intersect
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:3256
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_intersect";

   function Z3_mk_set_difference
     (c : Z3_context;
      arg1 : Z3_ast;
      arg2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3263
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_difference";

   function Z3_mk_set_complement (c : Z3_context; arg : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3270
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_complement";

   function Z3_mk_set_member
     (c : Z3_context;
      elem : Z3_ast;
      set : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3279
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_member";

   function Z3_mk_set_subset
     (c : Z3_context;
      arg1 : Z3_ast;
      arg2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3286
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_set_subset";

   function Z3_mk_array_ext
     (c : Z3_context;
      arg1 : Z3_ast;
      arg2 : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3296
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_array_ext";

   function Z3_mk_numeral
     (c : Z3_context;
      numeral : Z3_string;
      ty : Z3_sort) return Z3_ast  -- z3/src/api/z3_api.h:3314
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_numeral";

   function Z3_mk_real
     (c : Z3_context;
      num : int;
      den : int) return Z3_ast  -- z3/src/api/z3_api.h:3331
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_real";

   function Z3_mk_int
     (c : Z3_context;
      v : int;
      ty : Z3_sort) return Z3_ast  -- z3/src/api/z3_api.h:3343
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_int";

   function Z3_mk_unsigned_int
     (c : Z3_context;
      v : unsigned;
      ty : Z3_sort) return Z3_ast  -- z3/src/api/z3_api.h:3355
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_unsigned_int";

   function Z3_mk_int64
     (c : Z3_context;
      v : int64_t;
      ty : Z3_sort) return Z3_ast  -- z3/src/api/z3_api.h:3367
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_int64";

   function Z3_mk_unsigned_int64
     (c : Z3_context;
      v : uint64_t;
      ty : Z3_sort) return Z3_ast  -- z3/src/api/z3_api.h:3379
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_unsigned_int64";

   function Z3_mk_bv_numeral
     (c : Z3_context;
      sz : unsigned;
      bits : access Extensions.bool) return Z3_ast  -- z3/src/api/z3_api.h:3387
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_bv_numeral";

   function Z3_mk_seq_sort (c : Z3_context; s : Z3_sort) return Z3_sort  -- z3/src/api/z3_api.h:3399
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_sort";

   function Z3_is_seq_sort (c : Z3_context; s : Z3_sort) return Extensions.bool  -- z3/src/api/z3_api.h:3406
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_seq_sort";

   function Z3_get_seq_sort_basis (c : Z3_context; s : Z3_sort) return Z3_sort  -- z3/src/api/z3_api.h:3413
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_seq_sort_basis";

   function Z3_mk_re_sort (c : Z3_context; seq : Z3_sort) return Z3_sort  -- z3/src/api/z3_api.h:3420
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_re_sort";

   function Z3_is_re_sort (c : Z3_context; s : Z3_sort) return Extensions.bool  -- z3/src/api/z3_api.h:3427
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_re_sort";

   function Z3_get_re_sort_basis (c : Z3_context; s : Z3_sort) return Z3_sort  -- z3/src/api/z3_api.h:3434
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_re_sort_basis";

   function Z3_mk_string_sort (c : Z3_context) return Z3_sort  -- z3/src/api/z3_api.h:3444
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_string_sort";

   function Z3_is_string_sort (c : Z3_context; s : Z3_sort) return Extensions.bool  -- z3/src/api/z3_api.h:3451
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_string_sort";

   function Z3_mk_string (c : Z3_context; s : Z3_string) return Z3_ast  -- z3/src/api/z3_api.h:3457
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_string";

   function Z3_mk_lstring
     (c : Z3_context;
      len : unsigned;
      s : Z3_string) return Z3_ast  -- z3/src/api/z3_api.h:3466
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_lstring";

   function Z3_is_string (c : Z3_context; s : Z3_ast) return Extensions.bool  -- z3/src/api/z3_api.h:3473
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_string";

   function Z3_get_string (c : Z3_context; s : Z3_ast) return Z3_string  -- z3/src/api/z3_api.h:3482
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_string";

   function Z3_get_lstring
     (c : Z3_context;
      s : Z3_ast;
      length : access unsigned) return Z3_char_ptr  -- z3/src/api/z3_api.h:3491
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_lstring";

   function Z3_mk_seq_empty (c : Z3_context; seq : Z3_sort) return Z3_ast  -- z3/src/api/z3_api.h:3500
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_empty";

   function Z3_mk_seq_unit (c : Z3_context; a : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3507
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_unit";

   function Z3_mk_seq_concat
     (c : Z3_context;
      n : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:3516
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_concat";

   function Z3_mk_seq_prefix
     (c : Z3_context;
      prefix : Z3_ast;
      s : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3525
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_prefix";

   function Z3_mk_seq_suffix
     (c : Z3_context;
      suffix : Z3_ast;
      s : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3534
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_suffix";

   function Z3_mk_seq_contains
     (c : Z3_context;
      container : Z3_ast;
      containee : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3543
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_contains";

   function Z3_mk_str_lt
     (c : Z3_context;
      prefix : Z3_ast;
      s : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3553
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_str_lt";

   function Z3_mk_str_le
     (c : Z3_context;
      prefix : Z3_ast;
      s : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3562
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_str_le";

   function Z3_mk_seq_extract
     (c : Z3_context;
      s : Z3_ast;
      offset : Z3_ast;
      length : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3569
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_extract";

   function Z3_mk_seq_replace
     (c : Z3_context;
      s : Z3_ast;
      src : Z3_ast;
      dst : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3576
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_replace";

   function Z3_mk_seq_at
     (c : Z3_context;
      s : Z3_ast;
      index : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3584
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_at";

   function Z3_mk_seq_nth
     (c : Z3_context;
      s : Z3_ast;
      index : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3592
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_nth";

   function Z3_mk_seq_length (c : Z3_context; s : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3599
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_length";

   function Z3_mk_seq_index
     (c : Z3_context;
      s : Z3_ast;
      substr : Z3_ast;
      offset : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3609
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_index";

   function Z3_mk_seq_last_index
     (c : Z3_context;
      arg2 : Z3_ast;
      substr : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3616
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_last_index";

   function Z3_mk_str_to_int (c : Z3_context; s : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3623
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_str_to_int";

   function Z3_mk_int_to_str (c : Z3_context; s : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3631
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_int_to_str";

   function Z3_mk_seq_to_re (c : Z3_context; seq : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3638
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_to_re";

   function Z3_mk_seq_in_re
     (c : Z3_context;
      seq : Z3_ast;
      re : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3645
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_seq_in_re";

   function Z3_mk_re_plus (c : Z3_context; re : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3652
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_re_plus";

   function Z3_mk_re_star (c : Z3_context; re : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3659
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_re_star";

   function Z3_mk_re_option (c : Z3_context; re : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3666
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_re_option";

   function Z3_mk_re_union
     (c : Z3_context;
      n : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:3675
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_re_union";

   function Z3_mk_re_concat
     (c : Z3_context;
      n : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:3684
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_re_concat";

   function Z3_mk_re_range
     (c : Z3_context;
      lo : Z3_ast;
      hi : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3692
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_re_range";

   function Z3_mk_re_loop
     (c : Z3_context;
      r : Z3_ast;
      lo : unsigned;
      hi : unsigned) return Z3_ast  -- z3/src/api/z3_api.h:3702
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_re_loop";

   function Z3_mk_re_intersect
     (c : Z3_context;
      n : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:3711
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_re_intersect";

   function Z3_mk_re_complement (c : Z3_context; re : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3718
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_re_complement";

   function Z3_mk_re_empty (c : Z3_context; re : Z3_sort) return Z3_ast  -- z3/src/api/z3_api.h:3727
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_re_empty";

   function Z3_mk_re_full (c : Z3_context; re : Z3_sort) return Z3_ast  -- z3/src/api/z3_api.h:3737
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_re_full";

   function Z3_mk_linear_order
     (c : Z3_context;
      a : Z3_sort;
      id : unsigned) return Z3_func_decl  -- z3/src/api/z3_api.h:3750
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_linear_order";

   function Z3_mk_partial_order
     (c : Z3_context;
      a : Z3_sort;
      id : unsigned) return Z3_func_decl  -- z3/src/api/z3_api.h:3757
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_partial_order";

   function Z3_mk_piecewise_linear_order
     (c : Z3_context;
      a : Z3_sort;
      id : unsigned) return Z3_func_decl  -- z3/src/api/z3_api.h:3764
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_piecewise_linear_order";

   function Z3_mk_tree_order
     (c : Z3_context;
      a : Z3_sort;
      id : unsigned) return Z3_func_decl  -- z3/src/api/z3_api.h:3771
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_tree_order";

   function Z3_mk_transitive_closure (c : Z3_context; f : Z3_func_decl) return Z3_func_decl  -- z3/src/api/z3_api.h:3782
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_transitive_closure";

   function Z3_mk_pattern
     (c : Z3_context;
      num_patterns : unsigned;
      terms : System.Address) return Z3_pattern  -- z3/src/api/z3_api.h:3808
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_pattern";

   function Z3_mk_bound
     (c : Z3_context;
      index : unsigned;
      ty : Z3_sort) return Z3_ast  -- z3/src/api/z3_api.h:3839
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
      c_body : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3864
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
      c_body : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3880
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_exists";

   function Z3_mk_quantifier
     (c : Z3_context;
      is_forall : Extensions.bool;
      weight : unsigned;
      num_patterns : unsigned;
      patterns : System.Address;
      num_decls : unsigned;
      sorts : System.Address;
      decl_names : System.Address;
      c_body : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3907
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_quantifier";

   function Z3_mk_quantifier_ex
     (c : Z3_context;
      is_forall : Extensions.bool;
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
      c_body : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3941
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
      c_body : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:3971
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
      c_body : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:4001
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_exists_const";

   function Z3_mk_quantifier_const
     (c : Z3_context;
      is_forall : Extensions.bool;
      weight : unsigned;
      num_bound : unsigned;
      bound : System.Address;
      num_patterns : unsigned;
      patterns : System.Address;
      c_body : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:4017
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_quantifier_const";

   function Z3_mk_quantifier_const_ex
     (c : Z3_context;
      is_forall : Extensions.bool;
      weight : unsigned;
      quantifier_id : Z3_symbol;
      skolem_id : Z3_symbol;
      num_bound : unsigned;
      bound : System.Address;
      num_patterns : unsigned;
      patterns : System.Address;
      num_no_patterns : unsigned;
      no_patterns : System.Address;
      c_body : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:4032
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_quantifier_const_ex";

   function Z3_mk_lambda
     (c : Z3_context;
      num_decls : unsigned;
      sorts : System.Address;
      decl_names : System.Address;
      c_body : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:4067
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_lambda";

   function Z3_mk_lambda_const
     (c : Z3_context;
      num_bound : unsigned;
      bound : System.Address;
      c_body : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:4087
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_lambda_const";

   function Z3_get_symbol_kind (c : Z3_context; s : Z3_symbol) return Z3_symbol_kind  -- z3/src/api/z3_api.h:4103
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_symbol_kind";

   function Z3_get_symbol_int (c : Z3_context; s : Z3_symbol) return int  -- z3/src/api/z3_api.h:4114
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_symbol_int";

   function Z3_get_symbol_string (c : Z3_context; s : Z3_symbol) return Z3_string  -- z3/src/api/z3_api.h:4129
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_symbol_string";

   function Z3_get_sort_name (c : Z3_context; d : Z3_sort) return Z3_symbol  -- z3/src/api/z3_api.h:4136
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_sort_name";

   function Z3_get_sort_id (c : Z3_context; s : Z3_sort) return unsigned  -- z3/src/api/z3_api.h:4143
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_sort_id";

   function Z3_sort_to_ast (c : Z3_context; s : Z3_sort) return Z3_ast  -- z3/src/api/z3_api.h:4150
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_sort_to_ast";

   function Z3_is_eq_sort
     (c : Z3_context;
      s1 : Z3_sort;
      s2 : Z3_sort) return Extensions.bool  -- z3/src/api/z3_api.h:4157
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_eq_sort";

   function Z3_get_sort_kind (c : Z3_context; t : Z3_sort) return Z3_sort_kind  -- z3/src/api/z3_api.h:4166
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_sort_kind";

   function Z3_get_bv_sort_size (c : Z3_context; t : Z3_sort) return unsigned  -- z3/src/api/z3_api.h:4178
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_bv_sort_size";

   function Z3_get_finite_domain_sort_size
     (c : Z3_context;
      s : Z3_sort;
      r : access uint64_t) return Z3_bool  -- z3/src/api/z3_api.h:4186
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_finite_domain_sort_size";

   function Z3_get_array_sort_domain (c : Z3_context; t : Z3_sort) return Z3_sort  -- z3/src/api/z3_api.h:4199
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_array_sort_domain";

   function Z3_get_array_sort_range (c : Z3_context; t : Z3_sort) return Z3_sort  -- z3/src/api/z3_api.h:4211
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_array_sort_range";

   function Z3_get_tuple_sort_mk_decl (c : Z3_context; t : Z3_sort) return Z3_func_decl  -- z3/src/api/z3_api.h:4224
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_tuple_sort_mk_decl";

   function Z3_get_tuple_sort_num_fields (c : Z3_context; t : Z3_sort) return unsigned  -- z3/src/api/z3_api.h:4236
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_tuple_sort_num_fields";

   function Z3_get_tuple_sort_field_decl
     (c : Z3_context;
      t : Z3_sort;
      i : unsigned) return Z3_func_decl  -- z3/src/api/z3_api.h:4250
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_tuple_sort_field_decl";

   function Z3_get_datatype_sort_num_constructors (c : Z3_context; t : Z3_sort) return unsigned  -- z3/src/api/z3_api.h:4263
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_datatype_sort_num_constructors";

   function Z3_get_datatype_sort_constructor
     (c : Z3_context;
      t : Z3_sort;
      idx : unsigned) return Z3_func_decl  -- z3/src/api/z3_api.h:4278
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_datatype_sort_constructor";

   function Z3_get_datatype_sort_recognizer
     (c : Z3_context;
      t : Z3_sort;
      idx : unsigned) return Z3_func_decl  -- z3/src/api/z3_api.h:4293
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_datatype_sort_recognizer";

   function Z3_get_datatype_sort_constructor_accessor
     (c : Z3_context;
      t : Z3_sort;
      idx_c : unsigned;
      idx_a : unsigned) return Z3_func_decl  -- z3/src/api/z3_api.h:4309
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_datatype_sort_constructor_accessor";

   function Z3_datatype_update_field
     (c : Z3_context;
      field_access : Z3_func_decl;
      t : Z3_ast;
      value : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:4333
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_datatype_update_field";

   function Z3_get_relation_arity (c : Z3_context; s : Z3_sort) return unsigned  -- z3/src/api/z3_api.h:4345
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_relation_arity";

   function Z3_get_relation_column
     (c : Z3_context;
      s : Z3_sort;
      col : unsigned) return Z3_sort  -- z3/src/api/z3_api.h:4357
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_relation_column";

   function Z3_mk_atmost
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address;
      k : unsigned) return Z3_ast  -- z3/src/api/z3_api.h:4366
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_atmost";

   function Z3_mk_atleast
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address;
      k : unsigned) return Z3_ast  -- z3/src/api/z3_api.h:4376
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_atleast";

   function Z3_mk_pble
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address;
      coeffs : access int;
      k : int) return Z3_ast  -- z3/src/api/z3_api.h:4386
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_pble";

   function Z3_mk_pbge
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address;
      coeffs : access int;
      k : int) return Z3_ast  -- z3/src/api/z3_api.h:4397
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_pbge";

   function Z3_mk_pbeq
     (c : Z3_context;
      num_args : unsigned;
      args : System.Address;
      coeffs : access int;
      k : int) return Z3_ast  -- z3/src/api/z3_api.h:4408
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_pbeq";

   function Z3_func_decl_to_ast (c : Z3_context; f : Z3_func_decl) return Z3_ast  -- z3/src/api/z3_api.h:4417
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_decl_to_ast";

   function Z3_is_eq_func_decl
     (c : Z3_context;
      f1 : Z3_func_decl;
      f2 : Z3_func_decl) return Extensions.bool  -- z3/src/api/z3_api.h:4424
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_eq_func_decl";

   function Z3_get_func_decl_id (c : Z3_context; f : Z3_func_decl) return unsigned  -- z3/src/api/z3_api.h:4431
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_func_decl_id";

   function Z3_get_decl_name (c : Z3_context; d : Z3_func_decl) return Z3_symbol  -- z3/src/api/z3_api.h:4438
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_name";

   function Z3_get_decl_kind (c : Z3_context; d : Z3_func_decl) return Z3_decl_kind  -- z3/src/api/z3_api.h:4445
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_kind";

   function Z3_get_domain_size (c : Z3_context; d : Z3_func_decl) return unsigned  -- z3/src/api/z3_api.h:4454
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_domain_size";

   function Z3_get_arity (c : Z3_context; d : Z3_func_decl) return unsigned  -- z3/src/api/z3_api.h:4463
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_arity";

   function Z3_get_domain
     (c : Z3_context;
      d : Z3_func_decl;
      i : unsigned) return Z3_sort  -- z3/src/api/z3_api.h:4474
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_domain";

   function Z3_get_range (c : Z3_context; d : Z3_func_decl) return Z3_sort  -- z3/src/api/z3_api.h:4484
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_range";

   function Z3_get_decl_num_parameters (c : Z3_context; d : Z3_func_decl) return unsigned  -- z3/src/api/z3_api.h:4491
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_num_parameters";

   function Z3_get_decl_parameter_kind
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return Z3_parameter_kind  -- z3/src/api/z3_api.h:4502
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_parameter_kind";

   function Z3_get_decl_int_parameter
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return int  -- z3/src/api/z3_api.h:4511
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_int_parameter";

   function Z3_get_decl_double_parameter
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return double  -- z3/src/api/z3_api.h:4520
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_double_parameter";

   function Z3_get_decl_symbol_parameter
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return Z3_symbol  -- z3/src/api/z3_api.h:4529
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_symbol_parameter";

   function Z3_get_decl_sort_parameter
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return Z3_sort  -- z3/src/api/z3_api.h:4538
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_sort_parameter";

   function Z3_get_decl_ast_parameter
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return Z3_ast  -- z3/src/api/z3_api.h:4547
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_ast_parameter";

   function Z3_get_decl_func_decl_parameter
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return Z3_func_decl  -- z3/src/api/z3_api.h:4556
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_func_decl_parameter";

   function Z3_get_decl_rational_parameter
     (c : Z3_context;
      d : Z3_func_decl;
      idx : unsigned) return Z3_string  -- z3/src/api/z3_api.h:4565
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_decl_rational_parameter";

   function Z3_app_to_ast (c : Z3_context; a : Z3_app) return Z3_ast  -- z3/src/api/z3_api.h:4572
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_app_to_ast";

   function Z3_get_app_decl (c : Z3_context; a : Z3_app) return Z3_func_decl  -- z3/src/api/z3_api.h:4579
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_app_decl";

   function Z3_get_app_num_args (c : Z3_context; a : Z3_app) return unsigned  -- z3/src/api/z3_api.h:4587
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_app_num_args";

   function Z3_get_app_arg
     (c : Z3_context;
      a : Z3_app;
      i : unsigned) return Z3_ast  -- z3/src/api/z3_api.h:4596
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_app_arg";

   function Z3_is_eq_ast
     (c : Z3_context;
      t1 : Z3_ast;
      t2 : Z3_ast) return Extensions.bool  -- z3/src/api/z3_api.h:4603
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_eq_ast";

   function Z3_get_ast_id (c : Z3_context; t : Z3_ast) return unsigned  -- z3/src/api/z3_api.h:4616
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_ast_id";

   function Z3_get_ast_hash (c : Z3_context; a : Z3_ast) return unsigned  -- z3/src/api/z3_api.h:4625
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_ast_hash";

   function Z3_get_sort (c : Z3_context; a : Z3_ast) return Z3_sort  -- z3/src/api/z3_api.h:4634
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_sort";

   function Z3_is_well_sorted (c : Z3_context; t : Z3_ast) return Extensions.bool  -- z3/src/api/z3_api.h:4641
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_well_sorted";

   function Z3_get_bool_value (c : Z3_context; a : Z3_ast) return Z3_lbool  -- z3/src/api/z3_api.h:4648
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_bool_value";

   function Z3_get_ast_kind (c : Z3_context; a : Z3_ast) return Z3_ast_kind  -- z3/src/api/z3_api.h:4655
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_ast_kind";

   function Z3_is_app (c : Z3_context; a : Z3_ast) return Extensions.bool  -- z3/src/api/z3_api.h:4660
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_app";

   function Z3_is_numeral_ast (c : Z3_context; a : Z3_ast) return Extensions.bool  -- z3/src/api/z3_api.h:4665
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_numeral_ast";

   function Z3_is_algebraic_number (c : Z3_context; a : Z3_ast) return Extensions.bool  -- z3/src/api/z3_api.h:4672
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_algebraic_number";

   function Z3_to_app (c : Z3_context; a : Z3_ast) return Z3_app  -- z3/src/api/z3_api.h:4681
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_to_app";

   function Z3_to_func_decl (c : Z3_context; a : Z3_ast) return Z3_func_decl  -- z3/src/api/z3_api.h:4690
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_to_func_decl";

   function Z3_get_numeral_string (c : Z3_context; a : Z3_ast) return Z3_string  -- z3/src/api/z3_api.h:4699
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_string";

   function Z3_get_numeral_binary_string (c : Z3_context; a : Z3_ast) return Z3_string  -- z3/src/api/z3_api.h:4709
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_binary_string";

   function Z3_get_numeral_decimal_string
     (c : Z3_context;
      a : Z3_ast;
      precision : unsigned) return Z3_string  -- z3/src/api/z3_api.h:4719
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_decimal_string";

   function Z3_get_numeral_double (c : Z3_context; a : Z3_ast) return double  -- z3/src/api/z3_api.h:4728
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_double";

   function Z3_get_numerator (c : Z3_context; a : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:4737
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numerator";

   function Z3_get_denominator (c : Z3_context; a : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:4746
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_denominator";

   function Z3_get_numeral_small
     (c : Z3_context;
      a : Z3_ast;
      num : access int64_t;
      den : access int64_t) return Extensions.bool  -- z3/src/api/z3_api.h:4762
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_small";

   function Z3_get_numeral_int
     (c : Z3_context;
      v : Z3_ast;
      i : access int) return Extensions.bool  -- z3/src/api/z3_api.h:4774
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_int";

   function Z3_get_numeral_uint
     (c : Z3_context;
      v : Z3_ast;
      u : access unsigned) return Extensions.bool  -- z3/src/api/z3_api.h:4786
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_uint";

   function Z3_get_numeral_uint64
     (c : Z3_context;
      v : Z3_ast;
      u : access uint64_t) return Extensions.bool  -- z3/src/api/z3_api.h:4798
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_uint64";

   function Z3_get_numeral_int64
     (c : Z3_context;
      v : Z3_ast;
      i : access int64_t) return Extensions.bool  -- z3/src/api/z3_api.h:4810
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_int64";

   function Z3_get_numeral_rational_int64
     (c : Z3_context;
      v : Z3_ast;
      num : access int64_t;
      den : access int64_t) return Extensions.bool  -- z3/src/api/z3_api.h:4822
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_numeral_rational_int64";

   function Z3_get_algebraic_number_lower
     (c : Z3_context;
      a : Z3_ast;
      precision : unsigned) return Z3_ast  -- z3/src/api/z3_api.h:4833
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_algebraic_number_lower";

   function Z3_get_algebraic_number_upper
     (c : Z3_context;
      a : Z3_ast;
      precision : unsigned) return Z3_ast  -- z3/src/api/z3_api.h:4844
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_algebraic_number_upper";

   function Z3_pattern_to_ast (c : Z3_context; p : Z3_pattern) return Z3_ast  -- z3/src/api/z3_api.h:4851
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_pattern_to_ast";

   function Z3_get_pattern_num_terms (c : Z3_context; p : Z3_pattern) return unsigned  -- z3/src/api/z3_api.h:4858
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_pattern_num_terms";

   function Z3_get_pattern
     (c : Z3_context;
      p : Z3_pattern;
      idx : unsigned) return Z3_ast  -- z3/src/api/z3_api.h:4865
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_pattern";

   function Z3_get_index_value (c : Z3_context; a : Z3_ast) return unsigned  -- z3/src/api/z3_api.h:4874
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_index_value";

   function Z3_is_quantifier_forall (c : Z3_context; a : Z3_ast) return Extensions.bool  -- z3/src/api/z3_api.h:4881
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_quantifier_forall";

   function Z3_is_quantifier_exists (c : Z3_context; a : Z3_ast) return Extensions.bool  -- z3/src/api/z3_api.h:4889
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_quantifier_exists";

   function Z3_is_lambda (c : Z3_context; a : Z3_ast) return Extensions.bool  -- z3/src/api/z3_api.h:4898
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_lambda";

   function Z3_get_quantifier_weight (c : Z3_context; a : Z3_ast) return unsigned  -- z3/src/api/z3_api.h:4907
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_weight";

   function Z3_get_quantifier_num_patterns (c : Z3_context; a : Z3_ast) return unsigned  -- z3/src/api/z3_api.h:4916
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_num_patterns";

   function Z3_get_quantifier_pattern_ast
     (c : Z3_context;
      a : Z3_ast;
      i : unsigned) return Z3_pattern  -- z3/src/api/z3_api.h:4925
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_pattern_ast";

   function Z3_get_quantifier_num_no_patterns (c : Z3_context; a : Z3_ast) return unsigned  -- z3/src/api/z3_api.h:4934
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_num_no_patterns";

   function Z3_get_quantifier_no_pattern_ast
     (c : Z3_context;
      a : Z3_ast;
      i : unsigned) return Z3_ast  -- z3/src/api/z3_api.h:4943
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_no_pattern_ast";

   function Z3_get_quantifier_num_bound (c : Z3_context; a : Z3_ast) return unsigned  -- z3/src/api/z3_api.h:4952
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_num_bound";

   function Z3_get_quantifier_bound_name
     (c : Z3_context;
      a : Z3_ast;
      i : unsigned) return Z3_symbol  -- z3/src/api/z3_api.h:4961
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_bound_name";

   function Z3_get_quantifier_bound_sort
     (c : Z3_context;
      a : Z3_ast;
      i : unsigned) return Z3_sort  -- z3/src/api/z3_api.h:4970
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_bound_sort";

   function Z3_get_quantifier_body (c : Z3_context; a : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:4979
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_quantifier_body";

   function Z3_simplify (c : Z3_context; a : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:4993
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_simplify";

   function Z3_simplify_ex
     (c : Z3_context;
      a : Z3_ast;
      p : Z3_params) return Z3_ast  -- z3/src/api/z3_api.h:5008
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_simplify_ex";

   function Z3_simplify_get_help (c : Z3_context) return Z3_string  -- z3/src/api/z3_api.h:5018
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_simplify_get_help";

   function Z3_simplify_get_param_descrs (c : Z3_context) return Z3_param_descrs  -- z3/src/api/z3_api.h:5028
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_simplify_get_param_descrs";

   function Z3_update_term
     (c : Z3_context;
      a : Z3_ast;
      num_args : unsigned;
      args : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:5041
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_update_term";

   function Z3_substitute
     (c : Z3_context;
      a : Z3_ast;
      num_exprs : unsigned;
      from : System.Address;
      to : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:5050
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_substitute";

   function Z3_substitute_vars
     (c : Z3_context;
      a : Z3_ast;
      num_exprs : unsigned;
      to : System.Address) return Z3_ast  -- z3/src/api/z3_api.h:5062
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_substitute_vars";

   function Z3_translate
     (source : Z3_context;
      a : Z3_ast;
      target : Z3_context) return Z3_ast  -- z3/src/api/z3_api.h:5074
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_translate";

   function Z3_mk_model (c : Z3_context) return Z3_model  -- z3/src/api/z3_api.h:5085
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_model";

   procedure Z3_model_inc_ref (c : Z3_context; m : Z3_model)  -- z3/src/api/z3_api.h:5092
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_inc_ref";

   procedure Z3_model_dec_ref (c : Z3_context; m : Z3_model)  -- z3/src/api/z3_api.h:5099
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_dec_ref";

   function Z3_model_eval
     (c : Z3_context;
      m : Z3_model;
      t : Z3_ast;
      model_completion : Extensions.bool;
      v : System.Address) return Z3_bool  -- z3/src/api/z3_api.h:5124
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_eval";

   function Z3_model_get_const_interp
     (c : Z3_context;
      m : Z3_model;
      a : Z3_func_decl) return Z3_ast  -- z3/src/api/z3_api.h:5135
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_const_interp";

   function Z3_model_has_interp
     (c : Z3_context;
      m : Z3_model;
      a : Z3_func_decl) return Extensions.bool  -- z3/src/api/z3_api.h:5142
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_has_interp";

   function Z3_model_get_func_interp
     (c : Z3_context;
      m : Z3_model;
      f : Z3_func_decl) return Z3_func_interp  -- z3/src/api/z3_api.h:5156
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_func_interp";

   function Z3_model_get_num_consts (c : Z3_context; m : Z3_model) return unsigned  -- z3/src/api/z3_api.h:5165
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_num_consts";

   function Z3_model_get_const_decl
     (c : Z3_context;
      m : Z3_model;
      i : unsigned) return Z3_func_decl  -- z3/src/api/z3_api.h:5176
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_const_decl";

   function Z3_model_get_num_funcs (c : Z3_context; m : Z3_model) return unsigned  -- z3/src/api/z3_api.h:5186
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_num_funcs";

   function Z3_model_get_func_decl
     (c : Z3_context;
      m : Z3_model;
      i : unsigned) return Z3_func_decl  -- z3/src/api/z3_api.h:5197
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_func_decl";

   function Z3_model_get_num_sorts (c : Z3_context; m : Z3_model) return unsigned  -- z3/src/api/z3_api.h:5211
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_num_sorts";

   function Z3_model_get_sort
     (c : Z3_context;
      m : Z3_model;
      i : unsigned) return Z3_sort  -- z3/src/api/z3_api.h:5223
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_sort";

   function Z3_model_get_sort_universe
     (c : Z3_context;
      m : Z3_model;
      s : Z3_sort) return Z3_ast_vector  -- z3/src/api/z3_api.h:5233
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_get_sort_universe";

   function Z3_model_translate
     (c : Z3_context;
      m : Z3_model;
      dst : Z3_context) return Z3_model  -- z3/src/api/z3_api.h:5240
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_model_translate";

   function Z3_is_as_array (c : Z3_context; a : Z3_ast) return Extensions.bool  -- z3/src/api/z3_api.h:5253
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_is_as_array";

   function Z3_get_as_array_func_decl (c : Z3_context; a : Z3_ast) return Z3_func_decl  -- z3/src/api/z3_api.h:5262
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_as_array_func_decl";

   function Z3_add_func_interp
     (c : Z3_context;
      m : Z3_model;
      f : Z3_func_decl;
      default_value : Z3_ast) return Z3_func_interp  -- z3/src/api/z3_api.h:5275
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_add_func_interp";

   procedure Z3_add_const_interp
     (c : Z3_context;
      m : Z3_model;
      f : Z3_func_decl;
      a : Z3_ast)  -- z3/src/api/z3_api.h:5282
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_add_const_interp";

   procedure Z3_func_interp_inc_ref (c : Z3_context; f : Z3_func_interp)  -- z3/src/api/z3_api.h:5289
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_interp_inc_ref";

   procedure Z3_func_interp_dec_ref (c : Z3_context; f : Z3_func_interp)  -- z3/src/api/z3_api.h:5296
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_interp_dec_ref";

   function Z3_func_interp_get_num_entries (c : Z3_context; f : Z3_func_interp) return unsigned  -- z3/src/api/z3_api.h:5307
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_interp_get_num_entries";

   function Z3_func_interp_get_entry
     (c : Z3_context;
      f : Z3_func_interp;
      i : unsigned) return Z3_func_entry  -- z3/src/api/z3_api.h:5319
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_interp_get_entry";

   function Z3_func_interp_get_else (c : Z3_context; f : Z3_func_interp) return Z3_ast  -- z3/src/api/z3_api.h:5329
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_interp_get_else";

   procedure Z3_func_interp_set_else
     (c : Z3_context;
      f : Z3_func_interp;
      else_value : Z3_ast)  -- z3/src/api/z3_api.h:5339
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_interp_set_else";

   function Z3_func_interp_get_arity (c : Z3_context; f : Z3_func_interp) return unsigned  -- z3/src/api/z3_api.h:5346
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_interp_get_arity";

   procedure Z3_func_interp_add_entry
     (c : Z3_context;
      fi : Z3_func_interp;
      args : Z3_ast_vector;
      value : Z3_ast)  -- z3/src/api/z3_api.h:5362
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_interp_add_entry";

   procedure Z3_func_entry_inc_ref (c : Z3_context; e : Z3_func_entry)  -- z3/src/api/z3_api.h:5369
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_entry_inc_ref";

   procedure Z3_func_entry_dec_ref (c : Z3_context; e : Z3_func_entry)  -- z3/src/api/z3_api.h:5376
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_entry_dec_ref";

   function Z3_func_entry_get_value (c : Z3_context; e : Z3_func_entry) return Z3_ast  -- z3/src/api/z3_api.h:5388
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_entry_get_value";

   function Z3_func_entry_get_num_args (c : Z3_context; e : Z3_func_entry) return unsigned  -- z3/src/api/z3_api.h:5397
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_entry_get_num_args";

   function Z3_func_entry_get_arg
     (c : Z3_context;
      e : Z3_func_entry;
      i : unsigned) return Z3_ast  -- z3/src/api/z3_api.h:5408
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_entry_get_arg";

   function Z3_open_log (filename : Z3_string) return Extensions.bool  -- z3/src/api/z3_api.h:5418
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_open_log";

   procedure Z3_append_log (string : Z3_string)  -- z3/src/api/z3_api.h:5429
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_append_log";

   procedure Z3_close_log  -- z3/src/api/z3_api.h:5436
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_close_log";

   procedure Z3_toggle_warning_messages (enabled : Extensions.bool)  -- z3/src/api/z3_api.h:5446
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_toggle_warning_messages";

   procedure Z3_set_ast_print_mode (c : Z3_context; mode : Z3_ast_print_mode)  -- z3/src/api/z3_api.h:5468
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_ast_print_mode";

   function Z3_ast_to_string (c : Z3_context; a : Z3_ast) return Z3_string  -- z3/src/api/z3_api.h:5482
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_ast_to_string";

   function Z3_pattern_to_string (c : Z3_context; p : Z3_pattern) return Z3_string  -- z3/src/api/z3_api.h:5487
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_pattern_to_string";

   function Z3_sort_to_string (c : Z3_context; s : Z3_sort) return Z3_string  -- z3/src/api/z3_api.h:5492
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_sort_to_string";

   function Z3_func_decl_to_string (c : Z3_context; d : Z3_func_decl) return Z3_string  -- z3/src/api/z3_api.h:5497
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_func_decl_to_string";

   function Z3_model_to_string (c : Z3_context; m : Z3_model) return Z3_string  -- z3/src/api/z3_api.h:5508
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
      formula : Z3_ast) return Z3_string  -- z3/src/api/z3_api.h:5528
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
      decls : System.Address) return Z3_ast_vector  -- z3/src/api/z3_api.h:5549
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
      decls : System.Address) return Z3_ast_vector  -- z3/src/api/z3_api.h:5563
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_parse_smtlib2_file";

   function Z3_eval_smtlib2_string (arg1 : Z3_context; str : Z3_string) return Z3_string  -- z3/src/api/z3_api.h:5582
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_eval_smtlib2_string";

   function Z3_get_error_code (c : Z3_context) return Z3_error_code  -- z3/src/api/z3_api.h:5599
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_error_code";

   procedure Z3_set_error_handler (c : Z3_context; h : access procedure (arg1 : Z3_context; arg2 : Z3_error_code))  -- z3/src/api/z3_api.h:5613
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_error_handler";

   procedure Z3_set_error (c : Z3_context; e : Z3_error_code)  -- z3/src/api/z3_api.h:5621
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_set_error";

   function Z3_get_error_msg (c : Z3_context; err : Z3_error_code) return Z3_string  -- z3/src/api/z3_api.h:5628
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_error_msg";

   procedure Z3_get_version
     (major : access unsigned;
      minor : access unsigned;
      build_number : access unsigned;
      revision_number : access unsigned)  -- z3/src/api/z3_api.h:5642
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_version";

   function Z3_get_full_version return Z3_string  -- z3/src/api/z3_api.h:5651
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_full_version";

   procedure Z3_enable_trace (tag : Z3_string)  -- z3/src/api/z3_api.h:5661
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_enable_trace";

   procedure Z3_disable_trace (tag : Z3_string)  -- z3/src/api/z3_api.h:5671
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_disable_trace";

   procedure Z3_reset_memory  -- z3/src/api/z3_api.h:5683
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_reset_memory";

   procedure Z3_finalize_memory  -- z3/src/api/z3_api.h:5693
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_finalize_memory";

   function Z3_mk_goal
     (c : Z3_context;
      models : Extensions.bool;
      unsat_cores : Extensions.bool;
      proofs : Extensions.bool) return Z3_goal  -- z3/src/api/z3_api.h:5715
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_goal";

   procedure Z3_goal_inc_ref (c : Z3_context; g : Z3_goal)  -- z3/src/api/z3_api.h:5722
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_inc_ref";

   procedure Z3_goal_dec_ref (c : Z3_context; g : Z3_goal)  -- z3/src/api/z3_api.h:5729
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_dec_ref";

   function Z3_goal_precision (c : Z3_context; g : Z3_goal) return Z3_goal_prec  -- z3/src/api/z3_api.h:5738
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_precision";

   procedure Z3_goal_assert
     (c : Z3_context;
      g : Z3_goal;
      a : Z3_ast)  -- z3/src/api/z3_api.h:5752
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_assert";

   function Z3_goal_inconsistent (c : Z3_context; g : Z3_goal) return Extensions.bool  -- z3/src/api/z3_api.h:5759
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_inconsistent";

   function Z3_goal_depth (c : Z3_context; g : Z3_goal) return unsigned  -- z3/src/api/z3_api.h:5766
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_depth";

   procedure Z3_goal_reset (c : Z3_context; g : Z3_goal)  -- z3/src/api/z3_api.h:5773
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_reset";

   function Z3_goal_size (c : Z3_context; g : Z3_goal) return unsigned  -- z3/src/api/z3_api.h:5780
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_size";

   function Z3_goal_formula
     (c : Z3_context;
      g : Z3_goal;
      idx : unsigned) return Z3_ast  -- z3/src/api/z3_api.h:5789
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_formula";

   function Z3_goal_num_exprs (c : Z3_context; g : Z3_goal) return unsigned  -- z3/src/api/z3_api.h:5796
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_num_exprs";

   function Z3_goal_is_decided_sat (c : Z3_context; g : Z3_goal) return Extensions.bool  -- z3/src/api/z3_api.h:5803
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_is_decided_sat";

   function Z3_goal_is_decided_unsat (c : Z3_context; g : Z3_goal) return Extensions.bool  -- z3/src/api/z3_api.h:5810
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_is_decided_unsat";

   function Z3_goal_translate
     (source : Z3_context;
      g : Z3_goal;
      target : Z3_context) return Z3_goal  -- z3/src/api/z3_api.h:5817
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_translate";

   function Z3_goal_convert_model
     (c : Z3_context;
      g : Z3_goal;
      m : Z3_model) return Z3_model  -- z3/src/api/z3_api.h:5826
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_convert_model";

   function Z3_goal_to_string (c : Z3_context; g : Z3_goal) return Z3_string  -- z3/src/api/z3_api.h:5833
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_to_string";

   function Z3_goal_to_dimacs_string
     (c : Z3_context;
      g : Z3_goal;
      include_names : Extensions.bool) return Z3_string  -- z3/src/api/z3_api.h:5845
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_goal_to_dimacs_string";

   function Z3_mk_tactic (c : Z3_context; name : Z3_string) return Z3_tactic  -- z3/src/api/z3_api.h:5860
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_tactic";

   procedure Z3_tactic_inc_ref (c : Z3_context; t : Z3_tactic)  -- z3/src/api/z3_api.h:5867
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_inc_ref";

   procedure Z3_tactic_dec_ref (c : Z3_context; g : Z3_tactic)  -- z3/src/api/z3_api.h:5874
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_dec_ref";

   function Z3_mk_probe (c : Z3_context; name : Z3_string) return Z3_probe  -- z3/src/api/z3_api.h:5886
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_probe";

   procedure Z3_probe_inc_ref (c : Z3_context; p : Z3_probe)  -- z3/src/api/z3_api.h:5893
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_inc_ref";

   procedure Z3_probe_dec_ref (c : Z3_context; p : Z3_probe)  -- z3/src/api/z3_api.h:5900
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_dec_ref";

   function Z3_tactic_and_then
     (c : Z3_context;
      t1 : Z3_tactic;
      t2 : Z3_tactic) return Z3_tactic  -- z3/src/api/z3_api.h:5908
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_and_then";

   function Z3_tactic_or_else
     (c : Z3_context;
      t1 : Z3_tactic;
      t2 : Z3_tactic) return Z3_tactic  -- z3/src/api/z3_api.h:5916
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_or_else";

   function Z3_tactic_par_or
     (c : Z3_context;
      num : unsigned;
      ts : System.Address) return Z3_tactic  -- z3/src/api/z3_api.h:5923
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_par_or";

   function Z3_tactic_par_and_then
     (c : Z3_context;
      t1 : Z3_tactic;
      t2 : Z3_tactic) return Z3_tactic  -- z3/src/api/z3_api.h:5931
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_par_and_then";

   function Z3_tactic_try_for
     (c : Z3_context;
      t : Z3_tactic;
      ms : unsigned) return Z3_tactic  -- z3/src/api/z3_api.h:5939
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_try_for";

   function Z3_tactic_when
     (c : Z3_context;
      p : Z3_probe;
      t : Z3_tactic) return Z3_tactic  -- z3/src/api/z3_api.h:5947
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_when";

   function Z3_tactic_cond
     (c : Z3_context;
      p : Z3_probe;
      t1 : Z3_tactic;
      t2 : Z3_tactic) return Z3_tactic  -- z3/src/api/z3_api.h:5955
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_cond";

   function Z3_tactic_repeat
     (c : Z3_context;
      t : Z3_tactic;
      max : unsigned) return Z3_tactic  -- z3/src/api/z3_api.h:5963
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_repeat";

   function Z3_tactic_skip (c : Z3_context) return Z3_tactic  -- z3/src/api/z3_api.h:5970
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_skip";

   function Z3_tactic_fail (c : Z3_context) return Z3_tactic  -- z3/src/api/z3_api.h:5977
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_fail";

   function Z3_tactic_fail_if (c : Z3_context; p : Z3_probe) return Z3_tactic  -- z3/src/api/z3_api.h:5984
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_fail_if";

   function Z3_tactic_fail_if_not_decided (c : Z3_context) return Z3_tactic  -- z3/src/api/z3_api.h:5992
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_fail_if_not_decided";

   function Z3_tactic_using_params
     (c : Z3_context;
      t : Z3_tactic;
      p : Z3_params) return Z3_tactic  -- z3/src/api/z3_api.h:5999
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_using_params";

   function Z3_probe_const (x : Z3_context; val : double) return Z3_probe  -- z3/src/api/z3_api.h:6006
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_const";

   function Z3_probe_lt
     (x : Z3_context;
      p1 : Z3_probe;
      p2 : Z3_probe) return Z3_probe  -- z3/src/api/z3_api.h:6015
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_lt";

   function Z3_probe_gt
     (x : Z3_context;
      p1 : Z3_probe;
      p2 : Z3_probe) return Z3_probe  -- z3/src/api/z3_api.h:6024
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_gt";

   function Z3_probe_le
     (x : Z3_context;
      p1 : Z3_probe;
      p2 : Z3_probe) return Z3_probe  -- z3/src/api/z3_api.h:6033
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_le";

   function Z3_probe_ge
     (x : Z3_context;
      p1 : Z3_probe;
      p2 : Z3_probe) return Z3_probe  -- z3/src/api/z3_api.h:6042
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_ge";

   function Z3_probe_eq
     (x : Z3_context;
      p1 : Z3_probe;
      p2 : Z3_probe) return Z3_probe  -- z3/src/api/z3_api.h:6051
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_eq";

   function Z3_probe_and
     (x : Z3_context;
      p1 : Z3_probe;
      p2 : Z3_probe) return Z3_probe  -- z3/src/api/z3_api.h:6060
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_and";

   function Z3_probe_or
     (x : Z3_context;
      p1 : Z3_probe;
      p2 : Z3_probe) return Z3_probe  -- z3/src/api/z3_api.h:6069
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_or";

   function Z3_probe_not (x : Z3_context; p : Z3_probe) return Z3_probe  -- z3/src/api/z3_api.h:6078
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_not";

   function Z3_get_num_tactics (c : Z3_context) return unsigned  -- z3/src/api/z3_api.h:6085
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_num_tactics";

   function Z3_get_tactic_name (c : Z3_context; i : unsigned) return Z3_string  -- z3/src/api/z3_api.h:6094
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_tactic_name";

   function Z3_get_num_probes (c : Z3_context) return unsigned  -- z3/src/api/z3_api.h:6101
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_num_probes";

   function Z3_get_probe_name (c : Z3_context; i : unsigned) return Z3_string  -- z3/src/api/z3_api.h:6110
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_probe_name";

   function Z3_tactic_get_help (c : Z3_context; t : Z3_tactic) return Z3_string  -- z3/src/api/z3_api.h:6117
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_get_help";

   function Z3_tactic_get_param_descrs (c : Z3_context; t : Z3_tactic) return Z3_param_descrs  -- z3/src/api/z3_api.h:6124
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_get_param_descrs";

   function Z3_tactic_get_descr (c : Z3_context; name : Z3_string) return Z3_string  -- z3/src/api/z3_api.h:6131
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_get_descr";

   function Z3_probe_get_descr (c : Z3_context; name : Z3_string) return Z3_string  -- z3/src/api/z3_api.h:6138
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_get_descr";

   function Z3_probe_apply
     (c : Z3_context;
      p : Z3_probe;
      g : Z3_goal) return double  -- z3/src/api/z3_api.h:6146
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_probe_apply";

   function Z3_tactic_apply
     (c : Z3_context;
      t : Z3_tactic;
      g : Z3_goal) return Z3_apply_result  -- z3/src/api/z3_api.h:6153
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_apply";

   function Z3_tactic_apply_ex
     (c : Z3_context;
      t : Z3_tactic;
      g : Z3_goal;
      p : Z3_params) return Z3_apply_result  -- z3/src/api/z3_api.h:6160
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_tactic_apply_ex";

   procedure Z3_apply_result_inc_ref (c : Z3_context; r : Z3_apply_result)  -- z3/src/api/z3_api.h:6167
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_apply_result_inc_ref";

   procedure Z3_apply_result_dec_ref (c : Z3_context; r : Z3_apply_result)  -- z3/src/api/z3_api.h:6174
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_apply_result_dec_ref";

   function Z3_apply_result_to_string (c : Z3_context; r : Z3_apply_result) return Z3_string  -- z3/src/api/z3_api.h:6181
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_apply_result_to_string";

   function Z3_apply_result_get_num_subgoals (c : Z3_context; r : Z3_apply_result) return unsigned  -- z3/src/api/z3_api.h:6188
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_apply_result_get_num_subgoals";

   function Z3_apply_result_get_subgoal
     (c : Z3_context;
      r : Z3_apply_result;
      i : unsigned) return Z3_goal  -- z3/src/api/z3_api.h:6197
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_apply_result_get_subgoal";

   function Z3_mk_solver (c : Z3_context) return Z3_solver  -- z3/src/api/z3_api.h:6239
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_solver";

   function Z3_mk_simple_solver (c : Z3_context) return Z3_solver  -- z3/src/api/z3_api.h:6266
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_simple_solver";

   function Z3_mk_solver_for_logic (c : Z3_context; logic : Z3_symbol) return Z3_solver  -- z3/src/api/z3_api.h:6277
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_solver_for_logic";

   function Z3_mk_solver_from_tactic (c : Z3_context; t : Z3_tactic) return Z3_solver  -- z3/src/api/z3_api.h:6289
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_mk_solver_from_tactic";

   function Z3_solver_translate
     (source : Z3_context;
      s : Z3_solver;
      target : Z3_context) return Z3_solver  -- z3/src/api/z3_api.h:6296
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_translate";

   procedure Z3_solver_import_model_converter
     (ctx : Z3_context;
      src : Z3_solver;
      dst : Z3_solver)  -- z3/src/api/z3_api.h:6311
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_import_model_converter";

   function Z3_solver_get_help (c : Z3_context; s : Z3_solver) return Z3_string  -- z3/src/api/z3_api.h:6321
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_help";

   function Z3_solver_get_param_descrs (c : Z3_context; s : Z3_solver) return Z3_param_descrs  -- z3/src/api/z3_api.h:6331
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_param_descrs";

   procedure Z3_solver_set_params
     (c : Z3_context;
      s : Z3_solver;
      p : Z3_params)  -- z3/src/api/z3_api.h:6341
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_set_params";

   procedure Z3_solver_inc_ref (c : Z3_context; s : Z3_solver)  -- z3/src/api/z3_api.h:6348
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_inc_ref";

   procedure Z3_solver_dec_ref (c : Z3_context; s : Z3_solver)  -- z3/src/api/z3_api.h:6355
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_dec_ref";

   procedure Z3_solver_interrupt (c : Z3_context; s : Z3_solver)  -- z3/src/api/z3_api.h:6367
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_interrupt";

   procedure Z3_solver_push (c : Z3_context; s : Z3_solver)  -- z3/src/api/z3_api.h:6379
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_push";

   procedure Z3_solver_pop
     (c : Z3_context;
      s : Z3_solver;
      n : unsigned)  -- z3/src/api/z3_api.h:6391
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_pop";

   procedure Z3_solver_reset (c : Z3_context; s : Z3_solver)  -- z3/src/api/z3_api.h:6401
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_reset";

   function Z3_solver_get_num_scopes (c : Z3_context; s : Z3_solver) return unsigned  -- z3/src/api/z3_api.h:6411
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_num_scopes";

   procedure Z3_solver_assert
     (c : Z3_context;
      s : Z3_solver;
      a : Z3_ast)  -- z3/src/api/z3_api.h:6424
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_assert";

   procedure Z3_solver_assert_and_track
     (c : Z3_context;
      s : Z3_solver;
      a : Z3_ast;
      p : Z3_ast)  -- z3/src/api/z3_api.h:6443
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_assert_and_track";

   procedure Z3_solver_from_file
     (c : Z3_context;
      s : Z3_solver;
      file_name : Z3_string)  -- z3/src/api/z3_api.h:6453
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_from_file";

   procedure Z3_solver_from_string
     (c : Z3_context;
      s : Z3_solver;
      file_name : Z3_string)  -- z3/src/api/z3_api.h:6463
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_from_string";

   function Z3_solver_get_assertions (c : Z3_context; s : Z3_solver) return Z3_ast_vector  -- z3/src/api/z3_api.h:6470
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_assertions";

   function Z3_solver_get_units (c : Z3_context; s : Z3_solver) return Z3_ast_vector  -- z3/src/api/z3_api.h:6477
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_units";

   function Z3_solver_get_trail (c : Z3_context; s : Z3_solver) return Z3_ast_vector  -- z3/src/api/z3_api.h:6485
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_trail";

   function Z3_solver_get_non_units (c : Z3_context; s : Z3_solver) return Z3_ast_vector  -- z3/src/api/z3_api.h:6492
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_non_units";

   procedure Z3_solver_get_levels
     (c : Z3_context;
      s : Z3_solver;
      literals : Z3_ast_vector;
      sz : unsigned;
      levels : access unsigned)  -- z3/src/api/z3_api.h:6500
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_levels";

   function Z3_solver_get_implied_value
     (c : Z3_context;
      s : Z3_solver;
      e : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:6509
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_implied_value";

   function Z3_solver_get_implied_lower
     (c : Z3_context;
      s : Z3_solver;
      e : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:6518
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_implied_lower";

   function Z3_solver_get_implied_upper
     (c : Z3_context;
      s : Z3_solver;
      e : Z3_ast) return Z3_ast  -- z3/src/api/z3_api.h:6528
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_implied_upper";

   procedure Z3_solver_propagate_init
     (c : Z3_context;
      s : Z3_solver;
      user_context : System.Address;
      push_eh : access procedure (arg1 : System.Address);
      pop_eh : access procedure (arg1 : System.Address; arg2 : unsigned);
      fresh_eh : access function (arg1 : System.Address; arg2 : Z3_context) return System.Address)  -- z3/src/api/z3_api.h:6536
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_propagate_init";

   procedure Z3_solver_propagate_fixed
     (c : Z3_context;
      s : Z3_solver;
      fixed_eh : access procedure
        (arg1 : System.Address;
         arg2 : Z3_solver_callback;
         arg3 : unsigned;
         arg4 : Z3_ast))  -- z3/src/api/z3_api.h:6551
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_propagate_fixed";

   procedure Z3_solver_propagate_final
     (c : Z3_context;
      s : Z3_solver;
      final_eh : access procedure (arg1 : System.Address; arg2 : Z3_solver_callback))  -- z3/src/api/z3_api.h:6562
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_propagate_final";

   procedure Z3_solver_propagate_eq
     (c : Z3_context;
      s : Z3_solver;
      eq_eh : access procedure
        (arg1 : System.Address;
         arg2 : Z3_solver_callback;
         arg3 : unsigned;
         arg4 : unsigned))  -- z3/src/api/z3_api.h:6567
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_propagate_eq";

   procedure Z3_solver_propagate_diseq
     (c : Z3_context;
      s : Z3_solver;
      eq_eh : access procedure
        (arg1 : System.Address;
         arg2 : Z3_solver_callback;
         arg3 : unsigned;
         arg4 : unsigned))  -- z3/src/api/z3_api.h:6572
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_propagate_diseq";

   function Z3_solver_propagate_register
     (c : Z3_context;
      s : Z3_solver;
      e : Z3_ast) return unsigned  -- z3/src/api/z3_api.h:6581
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_propagate_register";

   procedure Z3_solver_propagate_consequence
     (c : Z3_context;
      arg2 : Z3_solver_callback;
      num_fixed : unsigned;
      fixed_ids : access unsigned;
      num_eqs : unsigned;
      eq_lhs : access unsigned;
      eq_rhs : access unsigned;
      conseq : Z3_ast)  -- z3/src/api/z3_api.h:6592
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_propagate_consequence";

   function Z3_solver_check (c : Z3_context; s : Z3_solver) return Z3_lbool  -- z3/src/api/z3_api.h:6612
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_check";

   function Z3_solver_check_assumptions
     (c : Z3_context;
      s : Z3_solver;
      num_assumptions : unsigned;
      assumptions : System.Address) return Z3_lbool  -- z3/src/api/z3_api.h:6625
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_check_assumptions";

   function Z3_get_implied_equalities
     (c : Z3_context;
      s : Z3_solver;
      num_terms : unsigned;
      terms : System.Address;
      class_ids : access unsigned) return Z3_lbool  -- z3/src/api/z3_api.h:6646
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_implied_equalities";

   function Z3_solver_get_consequences
     (c : Z3_context;
      s : Z3_solver;
      assumptions : Z3_ast_vector;
      variables : Z3_ast_vector;
      consequences : Z3_ast_vector) return Z3_lbool  -- z3/src/api/z3_api.h:6658
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_consequences";

   function Z3_solver_cube
     (c : Z3_context;
      s : Z3_solver;
      vars : Z3_ast_vector;
      backtrack_level : unsigned) return Z3_ast_vector  -- z3/src/api/z3_api.h:6683
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_cube";

   function Z3_solver_get_model (c : Z3_context; s : Z3_solver) return Z3_model  -- z3/src/api/z3_api.h:6693
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_model";

   function Z3_solver_get_proof (c : Z3_context; s : Z3_solver) return Z3_ast  -- z3/src/api/z3_api.h:6704
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_proof";

   function Z3_solver_get_unsat_core (c : Z3_context; s : Z3_solver) return Z3_ast_vector  -- z3/src/api/z3_api.h:6717
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_unsat_core";

   function Z3_solver_get_reason_unknown (c : Z3_context; s : Z3_solver) return Z3_string  -- z3/src/api/z3_api.h:6725
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_reason_unknown";

   function Z3_solver_get_statistics (c : Z3_context; s : Z3_solver) return Z3_stats  -- z3/src/api/z3_api.h:6734
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_get_statistics";

   function Z3_solver_to_string (c : Z3_context; s : Z3_solver) return Z3_string  -- z3/src/api/z3_api.h:6744
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_to_string";

   function Z3_solver_to_dimacs_string
     (c : Z3_context;
      s : Z3_solver;
      include_names : Extensions.bool) return Z3_string  -- z3/src/api/z3_api.h:6752
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_solver_to_dimacs_string";

   function Z3_stats_to_string (c : Z3_context; s : Z3_stats) return Z3_string  -- z3/src/api/z3_api.h:6764
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_to_string";

   procedure Z3_stats_inc_ref (c : Z3_context; s : Z3_stats)  -- z3/src/api/z3_api.h:6771
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_inc_ref";

   procedure Z3_stats_dec_ref (c : Z3_context; s : Z3_stats)  -- z3/src/api/z3_api.h:6778
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_dec_ref";

   function Z3_stats_size (c : Z3_context; s : Z3_stats) return unsigned  -- z3/src/api/z3_api.h:6785
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_size";

   function Z3_stats_get_key
     (c : Z3_context;
      s : Z3_stats;
      idx : unsigned) return Z3_string  -- z3/src/api/z3_api.h:6794
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_get_key";

   function Z3_stats_is_uint
     (c : Z3_context;
      s : Z3_stats;
      idx : unsigned) return Extensions.bool  -- z3/src/api/z3_api.h:6803
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_is_uint";

   function Z3_stats_is_double
     (c : Z3_context;
      s : Z3_stats;
      idx : unsigned) return Extensions.bool  -- z3/src/api/z3_api.h:6812
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_is_double";

   function Z3_stats_get_uint_value
     (c : Z3_context;
      s : Z3_stats;
      idx : unsigned) return unsigned  -- z3/src/api/z3_api.h:6821
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_get_uint_value";

   function Z3_stats_get_double_value
     (c : Z3_context;
      s : Z3_stats;
      idx : unsigned) return double  -- z3/src/api/z3_api.h:6830
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_stats_get_double_value";

   function Z3_get_estimated_alloc_size return uint64_t  -- z3/src/api/z3_api.h:6837
   with Import => True, 
        Convention => C, 
        External_Name => "Z3_get_estimated_alloc_size";

end z3_api_h;
