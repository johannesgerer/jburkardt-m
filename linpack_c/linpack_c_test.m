function linpack_c_test ( )

%*****************************************************************************80
%
%% LINPACK_C_TEST tests the single precision complex LINPACK routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINPACK_C_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LINPACK_C library. \n' );

  linpack_c_test01 ( );
  linpack_c_test02 ( );
  linpack_c_test03 ( );
  linpack_c_test04 ( );
  linpack_c_test05 ( );
  linpack_c_test06 ( );
  linpack_c_test07 ( );
  linpack_c_test08 ( );
  linpack_c_test09 ( );

  linpack_c_test10 ( );
  linpack_c_test11 ( );
  linpack_c_test12 ( );
  linpack_c_test13 ( );
  linpack_c_test14 ( );
  linpack_c_test15 ( );
  linpack_c_test16 ( );
  linpack_c_test17 ( );
  linpack_c_test18 ( );
  linpack_c_test19 ( );

  linpack_c_test20 ( );
  linpack_c_test21 ( );
  linpack_c_test22 ( );
  linpack_c_test23 ( );
  linpack_c_test24 ( );
  linpack_c_test25 ( );
  linpack_c_test26 ( );
  linpack_c_test27 ( );
  linpack_c_test28 ( );
  linpack_c_test29 ( );

  linpack_c_test30 ( );
  linpack_c_test31 ( );
  linpack_c_test32 ( );
  linpack_c_test33 ( );
  linpack_c_test34 ( );
  linpack_c_test345 ( );
  linpack_c_test35 ( );
  linpack_c_test36 ( );
  linpack_c_test37 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINPACK_C_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

