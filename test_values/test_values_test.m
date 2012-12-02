function test_values_test ( )

%*****************************************************************************80
%
%% TEST_VALUES_TEST tests TEST_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_VALUES_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the TEST_VALUES library.\n' );

  test_values_test001 ( );
  test_values_test002 ( );
  test_values_test003 ( );
  test_values_test0035 ( );
  test_values_test004 ( );
  test_values_test005 ( );
  test_values_test006 ( );
  test_values_test007 ( );
  test_values_test008 ( );
  test_values_test009 ( );
  test_values_test0093 ( );
  test_values_test0095 ( );

  test_values_test010 ( );
  test_values_test011 ( );
  test_values_test0114 ( );
  test_values_test01145 ( );
  test_values_test0115 ( );
  test_values_test01155 ( );
  test_values_test0116 ( );
  test_values_test012 ( );
  test_values_test0123 ( );
  test_values_test0127 ( );
  test_values_test0128 ( );
  test_values_test013 ( );
  test_values_test0134 ( );
  test_values_test0135 ( );
  test_values_test014 ( );
  test_values_test015 ( );
  test_values_test016 ( );
  test_values_test017 ( );
  test_values_test018 ( );
  test_values_test0185 ( );
  test_values_test019 ( );
  test_values_test0195 ( );

  test_values_test020 ( );
  test_values_test0205 ( );
  test_values_test021 ( );
  test_values_test022 ( );
  test_values_test023 ( );
  test_values_test024 ( );
  test_values_test025 ( );
  test_values_test026 ( );
  test_values_test0265 ( );
  test_values_test027 ( );
  test_values_test028 ( );
  test_values_test029 ( );

  test_values_test030 ( );
  test_values_test0305 ( );
  test_values_test031 ( );
  test_values_test032 ( );
  test_values_test033 ( );
  test_values_test034 ( );
  test_values_test035 ( );
  test_values_test036 ( );
  test_values_test0365 ( );
  test_values_test037 ( );
  test_values_test038 ( );
  test_values_test039 ( );
  test_values_test0395 ( );

  test_values_test040 ( );
  test_values_test041 ( );
  test_values_test042 ( );
  test_values_test0425 ( );
  test_values_test043 ( );
  test_values_test044 ( );
  test_values_test0445 ( );
  test_values_test045 ( );
  test_values_test046 ( );
  test_values_test0465 ( );
  test_values_test047 ( );
  test_values_test048 ( );
  test_values_test049 ( );

  test_values_test050 ( );
  test_values_test051 ( );
  test_values_test05125 ( );
  test_values_test0515 ( );
  test_values_test0517 ( );
  test_values_test0519 ( );
  test_values_test052 ( );
  test_values_test053 ( );
  test_values_test054 ( );
  test_values_test055 ( );
  test_values_test056 ( );
  test_values_test057 ( );
  test_values_test0575 ( );
  test_values_test058 ( );
  test_values_test059 ( );

  test_values_test060 ( );
  test_values_test061 ( );
  test_values_test062 ( );
  test_values_test063 ( );
  test_values_test064 ( );
  test_values_test065 ( );
  test_values_test066 ( );
  test_values_test0665 ( );
  test_values_test067 ( );
  test_values_test068 ( );
  test_values_test0685 ( );
  test_values_test069 ( );

  test_values_test070 ( );
  test_values_test071 ( );
  test_values_test072 ( );
  test_values_test073 ( );
  test_values_test074 ( );
  test_values_test075 ( );
  test_values_test0755 ( );
  test_values_test0756 ( );
  test_values_test076 ( );
  test_values_test077 ( );
  test_values_test078 ( );
  test_values_test079 ( );

  test_values_test080 ( );
  test_values_test081 ( );
  test_values_test082 ( );
  test_values_test083 ( );
  test_values_test0835 ( );
  test_values_test084 ( );
  test_values_test0843 ( );
  test_values_test0845 ( );
  test_values_test085 ( );
  test_values_test0855 ( );
  test_values_test086 ( );
  test_values_test087 ( );
  test_values_test088 ( );
  test_values_test089 ( );

  test_values_test090 ( );
  test_values_test091 ( );
  test_values_test092 ( );
  test_values_test093 ( );
  test_values_test094 ( );
  test_values_test0945 ( );
  test_values_test095 ( );
  test_values_test096 ( );
  test_values_test097 ( );
  test_values_test0972 ( );
  test_values_test0973 ( );
  test_values_test0974 ( );
  test_values_test0975 ( );
  test_values_test098 ( );
  test_values_test099 ( );
  test_values_test0995 ( );

  test_values_test100 ( );
  test_values_test101 ( );
  test_values_test1015 ( );
  test_values_test1016 ( );
  test_values_test102 ( );
  test_values_test103 ( );
  test_values_test1035 ( );
  test_values_test104 ( );
  test_values_test1037 ( );
  test_values_test105 ( );
  test_values_test106 ( );
  test_values_test107 ( );
  test_values_test108 ( );
  test_values_test10875 ( );
  test_values_test109 ( );

  test_values_test110 ( );
  test_values_test1105 ( );
  test_values_test111 ( );
  test_values_test112 ( );
  test_values_test113 ( );
  test_values_test1135 ( );
  test_values_test114 ( );
  test_values_test115 ( );
  test_values_test116 ( );
  test_values_test117 ( );
  test_values_test118 ( );
  test_values_test1185 ( );
  test_values_test119 ( );

  test_values_test120 ( );
  test_values_test121 ( );
  test_values_test122 ( );
  test_values_test123 ( );
  test_values_test124 ( );
  test_values_test125 ( );
  test_values_test1255 ( );
  test_values_test126 ( );
  test_values_test127 ( );
  test_values_test1275 ( );
  test_values_test128 ( );
  test_values_test1283 ( );
  test_values_test1285 ( );
  test_values_test129 ( );

  test_values_test131 ( );
  test_values_test132 ( );
  test_values_test1325 ( );
  test_values_test130 ( );
  test_values_test133 ( );
  test_values_test134 ( );
  test_values_test135 ( );
  test_values_test136 ( );
  test_values_test137 ( );
  test_values_test138 ( );
  test_values_test139 ( );

  test_values_test140 ( );
  test_values_test141 ( );
  test_values_test1415 ( );
  test_values_test142 ( );
  test_values_test143 ( );
  test_values_test144 ( );
  test_values_test1445 ( );
  test_values_test1447 ( );
  test_values_test145 ( );
  test_values_test146 ( );
  test_values_test1465 ( );
  test_values_test147 ( );
  test_values_test148 ( );
  test_values_test149 ( );

  test_values_test150 ( );
  test_values_test151 ( );
  test_values_test152 ( );
  test_values_test153 ( );
  test_values_test154 ( );
  test_values_test1545 ( );
  test_values_test155 ( );
  test_values_test156 ( );
  test_values_test157 ( );
  test_values_test1575 ( );
  test_values_test158 ( );
  test_values_test159 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_VALUES_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
