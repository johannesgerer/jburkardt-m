function blas1_d_test ( )

%*****************************************************************************80
%
%% BLAS1_D_TEST tests the BLAS1_D library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 June 2009
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../blas0' );

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS1_D_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BLAS1_D library.\n' );

  blas1_d_test01 ( );
  blas1_d_test02 ( );
  blas1_d_test03 ( );
  blas1_d_test04 ( );
  blas1_d_test05 ( );
  blas1_d_test06 ( );
  blas1_d_test07 ( );
  blas1_d_test08 ( );
  blas1_d_test09 ( );

  blas1_d_test10 ( );
  blas1_d_test11 ( );
  blas1_d_test12 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS1_D_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../blas0' );

  return
end
