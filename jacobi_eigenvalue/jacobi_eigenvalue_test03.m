function jacobi_eigenvalue_test03 ( )

%*****************************************************************************80
%
%% JACOBI_EIGENVALUE_TEST03 uses a 5x5 test matrix.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_EIGENVALUE_TEST03\n' );
  fprintf ( 1, '  For a symmetric matrix A,\n' );
  fprintf ( 1, '  JACOBI_EIGENVALUE computes the eigenvalues D\n' );
  fprintf ( 1, '  and eigenvectors V so that A * V = D * V.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the discretized second derivative matrix.\n' );
 
  n = 5;

  a = zeros ( n, n );
  for i = 1 : n
    a(i,i) = -2.0;
  end
  for i = 1 : n - 1
    a(i,i+1) = +1.0;
    a(i+1,i) = +1.0;
  end

  r8mat_print ( n, n, a, '  Input matrix A:' );

  it_max = 100;

  [ v, d, it_num, rot_num ] = jacobi_eigenvalue ( n, a, it_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of iterations = %d\n', it_num );
  fprintf ( 1, '  Number of rotations  = %d\n', rot_num );

  r8vec_print ( n, d, '  Eigenvalues D:' );

  r8mat_print ( n, n, v, '  Eigenvector matrix V:' );
%
%  Compute eigentest.
%
  error_frobenius = r8mat_is_eigen_right ( n, n, a, v, d );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Frobenius norm error in eigensystem A*V-D*V = %g\n', ...
    error_frobenius );


  return
end

