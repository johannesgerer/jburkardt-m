function jacobi_eigenvalue_test02 ( )

%*****************************************************************************80
%
%% JACOBI_EIGENVALUE_TEST02 uses a 4x4 test matrix.
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
  fprintf ( 1, 'JACOBI_EIGENVALUE_TEST02\n' );
  fprintf ( 1, '  For a symmetric matrix A,\n' );
  fprintf ( 1, '  JACOBI_EIGENVALUE computes the eigenvalues D\n' );
  fprintf ( 1, '  and eigenvectors V so that A * V = D * V.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  As a "sanity check", input a diagonal matrix.\n' );
 
  n = 4;

  a = [ ...
      4.0, 0.0, 0.0, 0.0;
      0.0, 1.0, 0.0, 0.0;
      0.0, 0.0, 3.0, 0.0;
      0.0, 0.0, 0.0, 2.0 ];

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

