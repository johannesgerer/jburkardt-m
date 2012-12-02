function blas1_c_test ( )

%*****************************************************************************80
%
%% BLAS1_C_TEST tests the BLAS1 single precision complex routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2006
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS1_C_PRB:\n' );
  fprintf ( 1, '  Test the BLAS1_C library.\n' );

  blas1_c_test01 ( );
  blas1_c_test02 ( );
  blas1_c_test03 ( );
  blas1_c_test04 ( );
  blas1_c_test05 ( );
  blas1_c_test06 ( );
  blas1_c_test07 ( );
  blas1_c_test08 ( );
  blas1_c_test09 ( );

  blas1_c_test10 ( );
  blas1_c_test11 ( );
  blas1_c_test12 ( );
  blas1_c_test13 ( );
  blas1_c_test14 ( );
  blas1_c_test15 ( );
  blas1_c_test16 ( );
  blas1_c_test17 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS1_C_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
