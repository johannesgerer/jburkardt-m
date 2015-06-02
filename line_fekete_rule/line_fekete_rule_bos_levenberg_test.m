function line_fekete_rule_bos_levenberg_test ( m )

%*****************************************************************************80
%
%% LINE_FEKETE_RULE_BOS_LEVENBERG_TESTS: Bos Levenberg code for Fekete points.
%
%  Discussion:
%
%    I wanted to run the code in the Bos Levenberg paper for
%    comparison with mine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 March 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Len Bos, Norm Levenberg,
%    On the calculation of approximate Fekete points: the univariate case,
%    Electronic Transactions on Numerical Analysis,
%    Volume 30, pages 377-397, 2008.
%
%  Parameters:
%
%    Input, integer M, the dimension of the polynomial space.
%    In the paper, M is 21.
%
  if ( nargin < 1 )
    m = 5;
  end
  n = 1000;
  a = -1.0;
  b = +1.0;
  x = linspace ( a, b, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_FEKETE_RULE_BOS_LEVENBERG_TEST:\n' );
  fprintf ( 1, '  Seek Fekete points in [%g,%g]\n', a, b );
  fprintf ( 1, '  using %d equally spaced sample points\n', n );
  fprintf ( 1, '  for polynomial space of dimension M = %d\n', m );
  fprintf ( 1, '  with the Chebyshev basis\n' );
  fprintf ( 1, '  and weight 1/sqrt(1-x^2).\n' );

  A = chebvand ( m, x );
  b = rand ( m, 1 );
  y = A \ b;
  pp = ( y ~= 0.0 );
  xf = x(pp);
  nf = length ( xf );
  r8vec_print ( nf, xf, '  Estimated Fekete points XF:' );

  yf = ones ( nf, 1 );
  plot ( xf, yf, '*' );
  title ( 'Estimated Fekete point locations, Bos-Levenberg' );
  grid on

  filename = 'line_fekete_rule_bos_levenberg_test.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved plot in file "%s"\n', filename );

  return
end

