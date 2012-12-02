function jacobi_test ( )

%*****************************************************************************80
%
%% JACOBI_TEST tests JACOBI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 May 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the JACOBI library.\n' );

  jacobi_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );
  return
end
