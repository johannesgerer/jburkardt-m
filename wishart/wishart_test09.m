function wishart_test09 ( )

%*****************************************************************************80
%
%% WISHART_TEST09 samples the Wishart and Wishart inverse matrices.
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
  fprintf ( 1, 'WISHART_TEST09:\n' );
  fprintf ( 1, '  Verify that, if using the same set of random numbers,\n' );
  fprintf ( 1, '    inverse(W) = M,\n' );
  fprintf ( 1, '  where\n' );
  fprintf ( 1, '    W = wishart_sample ( n, df, sigma );\n' );
  fprintf ( 1, '    M = wishart_sample_inverse ( n, df, sigma );\n' );
%
%  Set the parameters.
%
  n = 5;
  df = 8;
  r = [ 3.0, 1.0, 1.0, 1.0, 1.0; ...
        0.0, 7.0, 1.0, 2.0, 3.0; ...
        0.0, 0.0, 5.0, 1.0, 3.0; ...
        0.0, 0.0, 0.0, 4.0, 2.0; ...
        0.0, 0.0, 0.0, 0.0, 6.0 ];
  sigma = r' * r;
%
%  Initialize the random number package and compute W.
%
  initialize ( );
  w = wishart_sample ( n, df, sigma );
%
%  Initialize the random number package again, and compute T.
%
  initialize ( );
  m = wishart_sample_inverse ( n, df, sigma );
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
