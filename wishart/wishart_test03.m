function wishart_test03 ( )

%*****************************************************************************80
%
%% WISHART_TEST03 compares the unit Wishart and Bartlett sample matrices.
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
%  Normally, we would do this just once, here at the beginning.
%  In this example, however, we really want to do it just before
%  we call each of the sampling routines, so that they both access
%  the same set of random numbers...
%
  initialize ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'WISHART_TEST03:\n' );
  fprintf ( 1, '  Verify that, if using the same set of random numbers,\n' );
  fprintf ( 1, '    W = T'' * T,\n' );
  fprintf ( 1, '  where\n' );
  fprintf ( 1, '    W = wishart_unit_sample ( n, df );\n' );
  fprintf ( 1, '    T = bartlett_unit_sample ( n, df );\n' );
%
%  Set the parameters.
%
  n = 5;
  df = 8;
%
%  Initialize the random number package and compute W.
%
  initialize ( );
  w = wishart_unit_sample ( n, df );
  r8mat_print ( n, n, w, '  DEBUG: W:' );
%
%  Initialize the random number package again, and compute T.
%
  initialize ( );
  t = bartlett_unit_sample ( n, df );
%
%  Compute T' * T.
%
  tt = t' * t;
%
%  Compare T'T to W.
%
  diff = r8mat_norm_fro_affine ( n, n, w, tt );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Frobenius norm of error is %g\n', diff );
%
%  Release the PDFLIB and RNGLIB libraries.
%
  rmpath ( '../pdflib' );
  rmpath ( '../rnglib' );

  return
end
