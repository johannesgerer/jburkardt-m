function wishart_test06 ( )

%*****************************************************************************80
%
%% WISHART_TEST06 compares the Wishart and Bartlett sample matrices.
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
  fprintf ( 1, 'WISHART_TEST06:\n' );
  fprintf ( 1, '  Verify that, if using the same set of random numbers,\n' );
  fprintf ( 1, '    W = T'' * T,\n' );
  fprintf ( 1, '  where\n' );
  fprintf ( 1, '    W = wishart_sample ( n, df, sigma );\n' );
  fprintf ( 1, '    T = bartlett_sample ( n, df, sigma );\n' );
%
%  Set the parameters.
%
  n = 3;
  df = 5;
  r = [ 5.0, 1.0, 3.0; ...
        0.0, 4.0, 2.0; ...
        0.0, 0.0, 6.0 ];
  sigma = r' * r;
  r8mat_print ( n, n, sigma, '  Covariance SIGMA:' );
%
%  Initialize the random number package and compute W.
%
  initialize ( );
  w = wishart_sample ( n, df, sigma );
%
%  Initialize the random number package again, and compute T.
%
  initialize ( );
  t = bartlett_sample ( n, df, sigma );
%
%  Compute T' * T and compare it to W.
%
  tt = t' * t;

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
