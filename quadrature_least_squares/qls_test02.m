function qls_test02 ( )

%*****************************************************************************80
%
%% QLS_TEST02 xxx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 March 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QLS_TEST02\n' );
  fprintf ( 1, '  WEIGHTS_LS computes the weights for a \n' );
  fprintf ( 1, '  least squares quadrature rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Pick 50 random values in [-1,+1].\n' );
  fprintf ( 1, '  Compare Monte Carlo (equal weight) integral estimate\n' );
  fprintf ( 1, '  to least squares estimates of degree D = 0, 1, 2, 3, 4.\n' );
  fprintf ( 1, '  For low values of D, the least squares estimate improves.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  As D increases, the estimate can deteriorate.\n' );
%
%  Define the integration interval.
%
  a = -5.0;
  b = +5.0;
%
%  Get random values.
%
  n = 50;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, a, b, seed );
%
%  Evaluate the function.
%
  f = 1.0 ./ ( 1.0 + x .^ 2 );
  exact = atan ( b ) - atan ( a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rule         Estimate          Error\n' );
%
%  Get the MC estimate.
%
  q = ( b - a ) * sum ( f ) / n;
  e = abs ( q - exact );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  MC     %14.6g  %14.6g\n', q, e );
  fprintf ( 1, '\n' );
%
%  Using the same points, compute the least squares weights
%  for polynomial approximation of degree D.
%
  for d = 0 : 15

    w = weights_ls ( d, a, b, n, x );
    q = w' * f;
    e = abs ( q - exact );
    fprintf ( 1, '  LS%2d   %14.6g  %14.6g\n', d, q, e )

  end

  q = exact;
  e = abs ( q - exact );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EXACT %14.6g  %14.6g\n', q, e );

  return
end
