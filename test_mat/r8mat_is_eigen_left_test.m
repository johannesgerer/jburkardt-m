function r8mat_is_eigen_left_test ( )

%*****************************************************************************80
%
%% R8MAT_IS_EIGEN_LEFT_TEST tests R8MAT_IS_EIGEN_LEFT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2015
%
%  Author:
%
%    John Burkardt
%
  n = 4;
  k = 4;
%
%  This is the CARRY ( 4.0, 4 ) matrix.
%
  a = [ ...
    0.13671875,   0.60546875,   0.25390625,   0.00390625; ...
    0.05859375,   0.52734375,   0.39453125,   0.01953125; ...
    0.01953125,   0.39453125,   0.52734375,   0.05859375; ...
    0.00390625,   0.25390625,   0.60546875,   0.13671875 ];
  lam = [ ...
     1.000000000000000; ...
     0.250000000000000; ...
     0.062500000000000; ...
     0.015625000000000 ];
  x = [ ...
      1.0,     1.0,     1.0,     1.0; ...
     11.0,     3.0,    -1.0,    -3.0; ...
     11.0,    -3.0,    -1.0,     3.0; ...
      1.0,    -1.0,     1.0,    -1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_IS_EIGEN_LEFT_TEST:\n' );
  fprintf ( 1, '  R8MAT_IS_EIGEN_LEFT tests the error in the left eigensystem\n' );
  fprintf ( 1, '    A'' * X - X * LAMBDA = 0\n' );

  r8mat_print ( n, n, a, '  Matrix A:' );
  r8mat_print ( n, k, x, '  Eigenmatrix X:' );
  r8vec_print ( n, lam, '  Eigenvalues LAM:' );

  value = r8mat_is_eigen_left ( n, k, a, x, lam );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Frobenius norm of A''*X-X*LAMBDA is %g\n', value );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_IS_EIGEN_LEFT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
