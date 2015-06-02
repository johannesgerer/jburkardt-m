function linpack_d_test ( )

%*****************************************************************************80
%
%% LINPACK_D_TEST tests the LINPACK_D library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINPACK_D_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LINPACK_D library.\n' );

  linpack_d_test01 ( );
  linpack_d_test02 ( );
  linpack_d_test03 ( );
  linpack_d_test04 ( );
  linpack_d_test05 ( );
  linpack_d_test06 ( );
  linpack_d_test07 ( );
  linpack_d_test08 ( );
  linpack_d_test09 ( );

  linpack_d_test10 ( );
  linpack_d_test11 ( );
  linpack_d_test12 ( );
  linpack_d_test13 ( );
  linpack_d_test14 ( );
  linpack_d_test15 ( );
  linpack_d_test16 ( );
  linpack_d_test17 ( );
  linpack_d_test18 ( );
  linpack_d_test19 ( );

  linpack_d_test20 ( );
  linpack_d_test21 ( );
  linpack_d_test22 ( );
  linpack_d_test23 ( );
  linpack_d_test24 ( );
  linpack_d_test25 ( );
  linpack_d_test26 ( );
  linpack_d_test27 ( );
  linpack_d_test28 ( );
  linpack_d_test29 ( );

  linpack_d_test30 ( );
  linpack_d_test31 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINPACK_D_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp;

  return
end
