function blas1_s_test ( )

%*****************************************************************************80
%
%% BLAS1_S_TEST tests the BLAS1 routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2006
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS1_S_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BLAS1_S library.\n' );

  blas1_s_test01 ( );
  blas1_s_test02 ( );
  blas1_s_test03 ( );
  blas1_s_test04 ( );
  blas1_s_test05 ( );
  blas1_s_test06 ( );
  blas1_s_test07 ( );
  blas1_s_test08 ( );
  blas1_s_test09 ( );

  blas1_s_test10 ( );
  blas1_s_test11 ( );
  blas1_s_test12 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS1_S_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
