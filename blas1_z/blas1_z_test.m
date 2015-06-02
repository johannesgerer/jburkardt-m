function blas1_z_test ( )

%*****************************************************************************80
%
%% BLAS1_Z_TEST tests the BLAS1_Z library.
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
  addpath ( '../blas0' );

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS1_Z_PRB:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BLAS1_Z library.\n' );

  blas1_z_test01 ( );
  blas1_z_test02 ( );
  blas1_z_test03 ( );
  blas1_z_test04 ( );
  blas1_z_test05 ( );
  blas1_z_test06 ( );
  blas1_z_test07 ( );
  blas1_z_test08 ( );
  blas1_z_test09 ( );

  blas1_z_test10 ( );
  blas1_z_test11 ( );
  blas1_z_test12 ( );
  blas1_z_test13 ( );
  blas1_z_test14 ( );
  blas1_z_test15 ( );
  blas1_z_test16 ( );
  blas1_z_test17 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS1_Z_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../blas0' );

  return
end
