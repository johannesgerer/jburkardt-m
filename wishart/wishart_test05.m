function wishart_test05 ( )

%*****************************************************************************80
%
%% WISHART_TEST05 demonstrates the Bartlett sampling function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2013
%
%  Author:
%
%    John Burkardt
%

%
%  Access the PDFLIB and RNGLIB libraries.
%
  addpath ( '../pdflib' );
  addpath ( '../rnglib' );
%
%  Initialize the RNGLIB library.
%
  initialize ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'WISHART_TEST05:\n' );
  fprintf ( 1, '  We can compute sample Bartlett matrices by:\n' );
  fprintf ( 1, '    T = bartlett_sample ( n, df, sigma );\n' );
%
%  Set the parameters and call.
%
  n = 5;
  df = 8;
  sigma = eye ( 5, 5 );
  t = bartlett_sample ( n, df, sigma );
  r8mat_print ( n, n, t, '  bartlett_sample ( 5, 8, Identity ):' );
%
%  Calling again yields a new matrix.
%
  t = bartlett_sample ( n, df, sigma );
  r8mat_print ( n, n, t, '  bartlett_sample ( 5, 8, Identity ):' );
%
%  Try a diagonal matrix.
%
  sigma = diag ( [1.0, 2.0, 3.0, 4.0, 5.0 ] );
  t = bartlett_sample ( n, df, sigma );
  r8mat_print ( n, n, t, '  bartlett_sample ( 5, 8, diag(1,2,3,4,5) ):' );
%
%  Try a smaller matrix.
%
  n = 3;
  df = 3;
  r = [ 5.0, 1.0, 3.0; ...
        0.0, 4.0, 2.0; ...
        0.0, 0.0, 6.0 ];
  sigma = r' * r;
  r8mat_print ( n, n, sigma, '  Set covariance SIGMA:' );
  t = bartlett_sample ( n, df, sigma );
  r8mat_print ( n, n, t, '  bartlett_sample ( 3, 3, sigma ):' );
%
%  What is the eigendecomposition of the matrix T' * T?
%
  w = t' * t;
  [ v, lambda ] = eigs ( w );
  r8mat_print ( n, n, v, '  Eigenvectors of W = T'' * T:' );
  r8mat_print ( n, n, lambda, '  Eigenvalues of W = T'' * T:' );

  rmpath ( '../pdflib' );
  rmpath ( '../rnglib' );

  return
end
