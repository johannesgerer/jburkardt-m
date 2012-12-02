function subset_test ( )

%*****************************************************************************80
%
%% SUBSET_TEST tests SUBSET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBSET_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SUBSET library.\n' );

  subset_test000 ( );
  subset_test001 ( );
  subset_test002 ( );
  subset_test003 ( );
  subset_test9001 ( );
  subset_test9002 ( );
  subset_test9003 ( );
  subset_test005 ( );
  subset_test006 ( );
  subset_test007 ( );
  subset_test008 ( );
  subset_test009 ( );

  subset_test010 ( );
  subset_test011 ( );
  subset_test012 ( );
  subset_test013 ( );
  subset_test014 ( );
  subset_test015 ( );
  subset_test016 ( );
  subset_test017 ( );
  subset_test0174 ( );
  subset_test0175 ( );
  subset_test018 ( );
  subset_test019 ( );

  subset_test020 ( );
  subset_test021 ( );
  subset_test022 ( );
  subset_test023 ( );
  subset_test024 ( );
  subset_test025 ( );
  subset_test026 ( );
  subset_test027 ( );
  subset_test028 ( );
  subset_test029 ( );

  subset_test021a ( );
  subset_test022a ( );
  subset_test023a ( );
  subset_test024a ( );
  subset_test025a ( );
  subset_test026a ( );
  subset_test026b ( );
  subset_test026c ( );
  subset_test026d ( );
  subset_test027a ( );
  subset_test028a ( );
  subset_test029a ( );
  subset_test0295 ( );

  subset_test0304 ( );
  subset_test0305 ( );
  subset_test031 ( );
  subset_test0321 ( );
  subset_test0322 ( );
  subset_test03225 ( );
  subset_test0323 ( );
  subset_test0324 ( );
  subset_test0325 ( );
  subset_test0327 ( );
  subset_test058 ( );
  subset_test059 ( );
  subset_test060 ( );
  subset_test061 ( );
  subset_test0615 ( );
  subset_test062 ( );
  subset_test033 ( );
  subset_test034 ( );
  subset_test0625 ( );
  subset_test035 ( );
  subset_test0364 ( );
  subset_test0627 ( );
  subset_test036 ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0365 cancelled for now, no IBSET!\n' );
% subset_test0365 ( );
  subset_test037 ( );
  subset_test039 ( );

  subset_test040 ( );
  subset_test041 ( );
  subset_test042 ( );
  subset_test047 ( );
  subset_test043 ( );
  subset_test044 ( );
  subset_test045 ( );
  subset_test046 ( );
  subset_test048 ( );
  subset_test049 ( );

  subset_test050 ( );
  subset_test051 ( );
  subset_test052 ( );
  subset_test053 ( );
  subset_test054 ( );
  subset_test055 ( );
  subset_test056 ( );
  subset_test057 ( );

  subset_test063 ( );
  subset_test064 ( );
  subset_test065 ( );
  subset_test066 ( );
  subset_test067 ( );
  subset_test0675 ( );
  subset_test068 ( );
  subset_test0683 ( );
  subset_test0685 ( );
  subset_test0686 ( );
  subset_test0687 ( );
  subset_test0688 ( );
  subset_test0689 ( );
  subset_test069 ( );

  subset_test070 ( );
  subset_test071 ( );
  subset_test072 ( );
  subset_test073 ( );
  subset_test074 ( );
  subset_test075 ( );
  subset_test076 ( );
  subset_test077 ( );
  subset_test0771 ( );
  subset_test07715 ( );
  subset_test0772 ( );
  subset_test0773 ( );
  subset_test078 ( );
  subset_test079 ( );
  subset_test0795 ( );

  subset_test080 ( );
  subset_test081 ( );
  subset_test0813 ( );
  subset_test0815 ( );
  subset_test083 ( );
  subset_test0835 ( );
  subset_test084 ( );
  subset_test085 ( );
  subset_test093 ( );
  subset_test086 ( );
  subset_test087 ( );
  subset_test088 ( );
  subset_test089 ( );

  subset_test090 ( );
  subset_test091 ( );
  subset_test092 ( );
  subset_test094 ( );
  subset_test095 ( );
  subset_test0955 ( );
  subset_test096 ( );
  subset_test097 ( );
  subset_test098 ( );
  subset_test099 ( );

  subset_test100 ( );
  subset_test101 ( );
  subset_test102 ( );
  subset_test103 ( );
  subset_test104 ( );
  subset_test105 ( );
  subset_test106 ( );
  subset_test107 ( );
  subset_test108 ( );
  subset_test1085 ( );
  subset_test109 ( );

  subset_test110 ( );
  subset_test111 ( );
  subset_test112 ( );
  subset_test113 ( );
  subset_test114 ( );
  subset_test115 ( );
  subset_test030 ( );
  subset_test1245 ( );
  subset_test116 ( );
  subset_test1163 ( );
  subset_test1165 ( );
  subset_test117 ( );
  subset_test118 ( );
  subset_test119 ( );

  subset_test120 ( );
  subset_test121 ( );
  subset_test1215 ( );
  subset_test122 ( );
  subset_test123 ( );
  subset_test124 ( );

  subset_test125 ( );
  subset_test126 ( );
  subset_test127 ( );
  subset_test128 ( );
  subset_test129 ( );
  subset_test130 ( );
  subset_test131 ( );
  subset_test132 ( );
  subset_test133 ( );
  subset_test134 ( );
  subset_test135 ( );
  subset_test136 ( );
  subset_test137 ( );
  subset_test138 ( );
  subset_test139 ( );
  subset_test1395 ( );

  subset_test140 ( );
  subset_test141 ( );
  subset_test142 ( );
  subset_test143 ( );
  subset_test1435 ( );
  subset_test144 ( );
  subset_test145 ( );
  subset_test146 ( );
  subset_test147 ( );
  subset_test1475 ( );
  subset_test1476 ( );
  subset_test1477 ( );
  subset_test1478 ( );
  subset_test148 ( );
  subset_test149 ( );

  subset_test150 ( );
  subset_test151 ( );
  subset_test152 ( );
  subset_test153 ( );
  subset_test1531 ( );
  subset_test0626 ( );
  subset_test1535 ( );
  subset_test1536 ( );
  subset_test1537 ( );
  subset_test154 ( );
  subset_test155 ( );
  subset_test156 ( );
  subset_test1565 ( );
  subset_test1566 ( );
  subset_test1567 ( );
  subset_test1568 ( );
  subset_test1569 ( );
  subset_test15695 ( );
  subset_test15696 ( );
  subset_test15698 ( );
  subset_test157 ( );
  subset_test158 ( );
  subset_test159 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBSET_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
