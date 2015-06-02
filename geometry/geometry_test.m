function geometry_test ( )

%*****************************************************************************80
%
%% GEOMETRY_TEST tests the GEOMETRY library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 May 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GEOMETRY_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the GEOMETRY library.\n' );

  angle_box_2d_test ( );
  geometry_test001 ( );
  geometry_test002 ( );
  geometry_test0023 ( );
  geometry_test0025 ( );
  geometry_test003 ( );
  geometry_test0032 ( );
  geometry_test0035 ( );
  geometry_test004 ( );
  geometry_test005 ( );
  geometry_test006 ( );
  geometry_test007 ( );
  geometry_test0075 ( );
  geometry_test008 ( );
  geometry_test009 ( );
  
  geometry_test010 ( );
  geometry_test011 ( );
  geometry_test012 ( );
  geometry_test0125 ( );
  geometry_test0126 ( );
  geometry_test0127 ( );
  geometry_test013 ( );
  geometry_test014 ( );
  geometry_test015 ( );
  geometry_test0155 ( );
  geometry_test0156 ( );
  geometry_test016 ( );
  geometry_test0165 ( );
  geometry_test017 ( );
  geometry_test018 ( );
  geometry_test0183 ( );
  geometry_test0185 ( );
  geometry_test019 ( );

  geometry_test020 ( );
  geometry_test0201 ( );
  geometry_test02015 ( );
  geometry_test0202 ( );
  geometry_test0203 ( );
  geometry_test02035 ( );
  geometry_test0204 ( );
  geometry_test0205 ( );
  geometry_test021 ( );
  geometry_test022 ( );
  geometry_test023 ( );
  geometry_test0232 ( );
  geometry_test0234 ( );
  geometry_test0235 ( );
  geometry_test0236 ( );
  geometry_test0238 ( );
  geometry_test024 ( );
  geometry_test0243 ( );
  geometry_test0245 ( );
  geometry_test025 ( );
  geometry_test0255 ( );
  geometry_test026 ( );
  geometry_test027 ( );
  geometry_test028 ( );
  geometry_test029 ( );

  geometry_test030 ( );
  geometry_test031 ( );
  geometry_test0315 ( );
  geometry_test032 ( );
  geometry_test0321 ( );
  geometry_test0322 ( );
  geometry_test0323 ( );
  geometry_test0325 ( );
  geometry_test0327 ( );
  geometry_test033 ( );
  geometry_test0335 ( );
  geometry_test0336 ( );
  geometry_test0337 ( );
  geometry_test034 ( );
  geometry_test0345 ( );
  geometry_test0346 ( );
  geometry_test035 ( );
  geometry_test0351 ( );
  geometry_test0352 ( );
  geometry_test038 ( );
  geometry_test0385 ( );
  geometry_test03855 ( );
  geometry_test0386 ( );
  geometry_test039 ( );

  geometry_test040 ( );
  geometry_test041 ( );
  geometry_test0415 ( );
  geometry_test0416 ( );
  geometry_test0418 ( );
  geometry_test042 ( );
  geometry_test043 ( );
  geometry_test044 ( );
  geometry_test045 ( );
  geometry_test046 ( );
  geometry_test047 ( );
  geometry_test0475 ( );
  geometry_test0477 ( );
  geometry_test0478 ( );
  geometry_test048 ( );
  geometry_test0485 ( );
  geometry_test049 ( );
  geometry_test0493 ( );
  geometry_test0495 ( );

  geometry_test050 ( );
  geometry_test051 ( );
  geometry_test052 ( );
  geometry_test053 ( );
  geometry_test054 ( );
  geometry_test055 ( );
  geometry_test056 ( );
  geometry_test057 ( );
  geometry_test058 ( );
  geometry_test059 ( );

  geometry_test060 ( );
  geometry_test061 ( );
  geometry_test0615 ( );
  geometry_test0616 ( );
  geometry_test0617 ( );
  geometry_test062 ( );
  geometry_test063 ( );
  geometry_test064 ( );
  geometry_test065 ( );
  geometry_test066 ( );
  geometry_test068 ( );
  geometry_test0685 ( );

  geometry_test0755 ( );
  geometry_test0757 ( );
  geometry_test076 ( );
  geometry_test0765 ( );
  geometry_test078 ( );
  geometry_test0782 ( );
  geometry_test0784 ( );
  geometry_test0786 ( );
  geometry_test079 ( );

  geometry_test080 ( );
  geometry_test0801 ( );
  geometry_test0803 ( );
  geometry_test0805 ( );
  polygon_solid_angle_3d_test ( );
  geometry_test081 ( );
  geometry_test082 ( );
  geometry_test0825 ( );
  geometry_test083 ( );
  geometry_test084 ( );
  geometry_test0844 ( );
  geometry_test0845 ( );
  geometry_test0846 ( );
  geometry_test085 ( );

  geometry_test170 ( );
  geometry_test171 ( );
  geometry_test1712 ( );
  geometry_test1715 ( );
  geometry_test172 ( );
  geometry_test173 ( );
  geometry_test174 ( );
  geometry_test1745 ( ); 
  geometry_test1746 ( );
  geometry_test175 ( );
  geometry_test176 ( );
  geometry_test177 ( );
  geometry_test178 ( );
  geometry_test1787 ( );
  geometry_test1893 ( );
  geometry_test036 ( );
  geometry_test0365 ( );
  geometry_test0366 ( );
  geometry_test0367 ( );
  geometry_test0368 ( );
  geometry_test037 ( );
  geometry_test1788 ( );
  geometry_test1789 ( );
  geometry_test179 ( );

  geometry_test180 ( );
  geometry_test1805 ( );
  geometry_test181 ( );
  geometry_test182 ( );
  geometry_test183 ( );
  geometry_test1835 ( );
  geometry_test1836 ( );
  geometry_test187 ( );
  geometry_test188 ( );
  geometry_test189 ( );
  geometry_test1895 ( );

  geometry_test190 ( );
  geometry_test191 ( );
  geometry_test192 ( );
  geometry_test193 ( );
  geometry_test194 ( );
  geometry_test195 ( );
  geometry_test1955 ( );
  geometry_test196 ( );
  geometry_test197 ( );
  geometry_test198 ( );
  geometry_test199 ( );

  geometry_test200 ( );
  geometry_test201 ( );
  geometry_test202 ( );
  geometry_test203 ( );
  geometry_test2031 ( );
  geometry_test2032 ( );
  geometry_test20321 ( );
  geometry_test20322 ( );
  geometry_test203224 ( );
  geometry_test203225 ( );
  geometry_test20323 ( );
  geometry_test203232 ( );
  geometry_test203233 ( );
  geometry_test203234 ( );
  geometry_test203235 ( );
  geometry_test20324 ( );
  geometry_test20325 ( );
  tetrahedron_solid_angles_3d_test ( );
  geometry_test2033 ( );
  geometry_test203 ( );
  geometry_test203 ( );
  geometry_test204 ( );
  geometry_test205 ( );
  geometry_test206 ( );
  geometry_test20605 ( );
  geometry_test2061 ( );
  geometry_test2062 ( );
  geometry_test209 ( );
  geometry_test20655 ( );
  geometry_test2066 ( );
  geometry_test2094 ( );
  geometry_test2101 ( );
  geometry_test21011 ( );
  geometry_test2067 ( );
  geometry_test21015 ( );
  geometry_test2068 ( );
  geometry_test2069 ( );
  geometry_test207 ( );
  geometry_test2075 ( );
  geometry_test208 ( );
  geometry_test2102 ( );
  geometry_test2070 ( );
  geometry_test20701 ( );
  geometry_test2104 ( );
  geometry_test2105 ( );
  geometry_test211 ( );
  geometry_test2103 ( );
  geometry_test2071 ( );
  geometry_test20715 ( );
  geometry_test2095 ( );
  geometry_test2072 ( );

  geometry_test2115 ( );
  geometry_test212 ( );
  geometry_test213 ( );
  geometry_test219 ( );

  geometry_test220 ( );
  geometry_test221 ( );
  geometry_test222 ( );
  geometry_test2225 ( );
  geometry_test223 ( );
  geometry_test224 ( );
  geometry_test2245 ( );
  geometry_test225 ( );
  geometry_test226 ( );
  geometry_test227 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GEOMETRY_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
