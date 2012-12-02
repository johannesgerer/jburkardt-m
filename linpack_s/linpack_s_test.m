function linpack_s_test ( )

%*****************************************************************************80
%
%% LINPACK_S_TEST tests the single precision real LINPACK routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 June 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINPACK_S_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LINPACK_S library.\n' );

  linpack_s_test01 ( );
  linpack_s_test02 ( );
  linpack_s_test03 ( );
  linpack_s_test04 ( );
  linpack_s_test05 ( );
  linpack_s_test06 ( );
  linpack_s_test07 ( );
  linpack_s_test08 ( );
  linpack_s_test09 ( );

  linpack_s_test10 ( );
  linpack_s_test11 ( );
  linpack_s_test12 ( );
  linpack_s_test13 ( );
  linpack_s_test14 ( );
  linpack_s_test15 ( );
  linpack_s_test16 ( );
  linpack_s_test17 ( );
  linpack_s_test18 ( );
  linpack_s_test19 ( );

  linpack_s_test20 ( );
  linpack_s_test21 ( );
  linpack_s_test22 ( );
  linpack_s_test23 ( );
  linpack_s_test24 ( );
  linpack_s_test25 ( );
  linpack_s_test26 ( );
  linpack_s_test27 ( );
  linpack_s_test28 ( );
  linpack_s_test29 ( );

  linpack_s_test30 ( );
  linpack_s_test31 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINPACK_S_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
