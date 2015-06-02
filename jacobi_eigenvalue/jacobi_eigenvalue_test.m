function jacobi_eigenvalue_test ( )

%*****************************************************************************80
%
%% JACOBI_EIGENVALUE_TEST tests the JACOBI_EIGENVALUE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 July 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_EIGENVALUE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the JACOBI_EIGENVALUE library.\n' );

  jacobi_eigenvalue_test01 ( );
  jacobi_eigenvalue_test02 ( );
  jacobi_eigenvalue_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_EIGENVALUE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( )

  return
end

