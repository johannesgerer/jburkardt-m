function gauss_seidel_test ( )

%*****************************************************************************80
%
%% GAUSS_SEIDEL_TEST tests GAUSS_SEIDEL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GAUSS_SEIDEL_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the GAUSS_SEIDEL library.\n' );

  gauss_seidel_test01 ( );
  gauss_seidel_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GAUSS_SEIDEL_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
