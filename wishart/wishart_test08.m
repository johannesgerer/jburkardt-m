function wishart_test08 ( )

%*****************************************************************************80
%
%% WISHART_TEST08 samples the unit Wishart and unit Wishart inverse matrices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2013
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
  fprintf ( 1, 'WISHART_TEST08:\n' );
  fprintf ( 1, '  Verify that, if using the same set of random numbers,\n' );
  fprintf ( 1, '    inverse(W) = M,\n' );
  fprintf ( 1, '  where\n' );
  fprintf ( 1, '    W = wishart_unit_sample ( n, df );\n' );
  fprintf ( 1, '    M = wishart_unit_sample_inverse ( n, df );\n' );
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
%
%  Initialize the random number package again, and compute M.
%
  initialize ( );
  m = wishart_unit_sample_inverse ( n, df );
%
%  Compute W * M
%
  wm = w * m;
%
%  Compare W*M to I;
%
  ident = eye ( n, n );
  diff = r8mat_norm_fro_affine ( n, n, wm, ident );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Frobenius norm of error M*W-I is %g\n', diff );
%
%  Release the PDFLIB and RNGLIB libraries.
%
  rmpath ( '../pdflib' );
  rmpath ( '../rnglib' );

  return
end
