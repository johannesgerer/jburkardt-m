function wishart_test07 ( )

%*****************************************************************************80
%
%% WISHART_TEST07 demonstrates a property of the Wishart distribution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2013
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
  fprintf ( 1, 'WISHART_TEST07:\n' );
  fprintf ( 1, '  For given values of N, DF, SIGMA, the random\n' );
  fprintf ( 1, '  matrices from the Wishart distribution:\n' );
  fprintf ( 1, '    W = wishart_sample ( n, df, sigma );\n' );
  fprintf ( 1, '  should have mean DF * SIGMA.\n' );
%
%  Set the parameters.
%
  n = 3;
  fprintf ( 1, '  Fix N = %d\n', n );
  df = 5;
  fprintf ( 1, '  Fix DF = %d\n', df );
  r = [ 5.0, 1.0, 3.0; ...
        0.0, 4.0, 2.0; ...
        0.0, 0.0, 6.0 ];
  sigma = r' * r;
  r8mat_print ( n, n, sigma, '  Fix covariance SIGMA:' );
%
%  Sample many times and average.
%
  sample_num = 1000;
  w_average = zeros ( n, n );
  for i = 1 : sample_num
    w = wishart_sample ( n, df, sigma );
    w_average = w_average + w;
  end
  w_average = w_average / sample_num;
%
%  Compare SIGMA and W_SAMPLE / DF.
%
  w_average = w_average / df;

  r8mat_print ( n, n, w_average, '  W_Average / DF: ' );

  diff = r8mat_norm_fro_affine ( n, n, sigma, w_average );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Frobenius norm of SIGMA-W_average/DF = %g\n', diff );

  rmpath ( '../pdflib' );
  rmpath ( '../rnglib' );

  return
end
