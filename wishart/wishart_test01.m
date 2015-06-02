function wishart_test01 ( )

%*****************************************************************************80
%
%% WISHART_TEST01 demonstrates the unit Wishart sampling function.
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
  fprintf ( 1, 'WISHART_TEST01:\n' );
  fprintf ( 1, '  We can compute sample unit Wishart matrices by:\n' );
  fprintf ( 1, '    W = wishart_unit_sample ( n, df );\n' );
%
%  Set the parameters and call.
%
  n = 5;
  df = 8;
  w = wishart_unit_sample ( n, df );
  r8mat_print ( n, n, w, '  wishart_unit_sample ( 5, 8 ):' );
%
%  Calling again yields a new matrix.
%
  w = wishart_unit_sample ( n, df );
  r8mat_print ( n, n, w, '  wishart_unit_sample ( 5, 8 ):' );
%
%  Reduce DF
%
  n = 5;
  df = 5;
  w = wishart_unit_sample ( n, df );
  r8mat_print ( n, n, w, '  wishart_unit_sample ( 5, 5 ):' );
%
%  Try a smaller matrix.
%
  n = 3;
  df = 5;
  w = wishart_unit_sample ( n, df );
  r8mat_print ( n, n, w, '  wishart_unit_sample ( 3, 5 ):' );
%
%  What is the eigendecomposition of the matrix?
%
  [ v, lambda ] = eigs ( w );
  r8mat_print ( n, n, v, '  Eigenvectors of previous matrix:' );
  r8mat_print ( n, n, lambda, '  Eigenvalues of previous matrix:' );

  rmpath ( '../pdflib' );
  rmpath ( '../rnglib' );

  return
end
