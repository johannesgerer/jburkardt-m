function wishart_test02 ( )

%*****************************************************************************80
%
%% WISHART_TEST02 demonstrates the unit Bartlett sampling function.
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
  fprintf ( 1, 'WISHART_TEST02:\n' );
  fprintf ( 1, '  We can compute sample unit Bartlett matrices by:\n' );
  fprintf ( 1, '    T = bartlett_unit_sample ( n, df );\n' );
%
%  Set the parameters and call.
%
  n = 5;
  df = 8;
  t = bartlett_unit_sample ( n, df );
  r8mat_print ( n, n, t, '  bartlett_unit_sample ( 5, 8 ):' );
%
%  Calling again yields a new matrix.
%
  t = bartlett_unit_sample ( n, df );
  r8mat_print ( n, n, t, '  bartlett_unit_sample ( 5, 8 ):' );
%
%  Reduce DF.
%
  n = 5;
  df = 5;
  t = bartlett_unit_sample ( n, df );
  r8mat_print ( n, n, t, '  bartlett_unit_sample ( 5, 5 ):' );
%
%  Try a smaller matrix.
%
  n = 3;
  df = 5;
  t = bartlett_unit_sample ( n, df );
  r8mat_print ( n, n, t, '  bartlett_unit_sample ( 3, 5 ):' );
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
