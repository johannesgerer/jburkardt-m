function wishart_test04 ( )

%*****************************************************************************80
%
%% WISHART_TEST04 demonstrates the Wishart sampling function.
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
  fprintf ( 1, 'WISHART_TEST04:\n' );
  fprintf ( 1, '  We can compute sample Wishart matrices by:\n' );
  fprintf ( 1, '    W = wishart_sample ( n, df, sigma );\n' );
%
%  Set the parameters and call.
%
  n = 5;
  df = 8;
  sigma = eye ( 5, 5 );
  w = wishart_sample ( n, df, sigma );
  r8mat_print ( n, n, w, '  wishart_sample ( 5, 8, Identity ):' );
%
%  Calling again yields a new matrix.
%
  w = wishart_sample ( n, df, sigma );
  r8mat_print ( n, n, w, '  wishart_sample ( 5, 8, Identity ):' );
%
%  Try a diagonal matrix.
%
  sigma = diag ( [1.0, 2.0, 3.0, 4.0, 5.0 ] );
  w = wishart_sample ( n, df, sigma );
  r8mat_print ( n, n, w, '  wishart_sample ( 5, 8, diag(1,2,3,4,5) ):' );
%
%  Try a smaller matrix.  Sigma must be positive definite symmetric.
%
  n = 3;
  df = 3;
  r = [ 5.0, 1.0, 3.0; ...
        0.0, 4.0, 2.0; ...
        0.0, 0.0, 6.0 ];
  sigma = r' * r;
  r8mat_print ( n, n, sigma, '  Set covariance SIGMA:' );
  w = wishart_sample ( n, df, sigma );
  r8mat_print ( n, n, w, '  wishart_sample ( 3, 3, sigma ):' );
%
%  What is the eigendecomposition of this matrix?
%
  [ v, lambda ] = eigs ( w );
  r8mat_print ( n, n, v, '  Eigenvectors of previous matrix:' );
  r8mat_print ( n, n, lambda, '  Eigenvalues of previous matrix:' );

  rmpath ( '../pdflib' );
  rmpath ( '../rnglib' );

  return
end
