function quadrule_test065 ( n )

%*****************************************************************************80
%
%% QUADRULE_TEST065 uses CHEBSHEV2_COMPUTE to integral over the semicircle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 January 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADRULE_TEST065\n' );
  fprintf ( 1, '  Approximate the integral of f(x,y) over the semicircle\n' );
  fprintf ( 1, '    -1 <= x <= 1, y = sqrt ( 1 - x^2 )\n' );
  fprintf ( 1, '  using N Chebyshev points.\n' );
  fprintf ( 1, '  If p(x,y) involves any term of odd degree in y,\n' );
  fprintf ( 1, '  the estimate will only be approximate.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Polynomial    N    Integral        Estimate       Error\n' );
  fprintf ( 1, '\n' );

  [ x, w ] = chebyshev2_compute ( n );
%
%  f(x,y) = 1
%
  exact = 1.5707963267948966192;
  f(1:n,1) = 1.0;
  q = w(1:n)' * f(1:n);
  error = abs ( q - exact );
  fprintf ( 1, '  1            %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = x
%
  exact = 0.0;
  f(1:n,1) = x(1:n);
  q = w(1:n)' * f(1:n);
  error = abs ( q - exact );
  fprintf ( 1, '  x            %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = y = sqrt ( 1 - x^2 )
%
  exact = 0.66666666666666666667;
  f(1:n,1) = sqrt ( 1.0 - x(1:n).^2 );
  q = w(1:n)' * f(1:n) / 2.0;
  error = abs ( q - exact );
  fprintf ( 1, '     y         %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = x^2
%
  exact = 0.39269908169872415481;
  f(1:n,1) = x(1:n).^2;
  q = w(1:n)' * f(1:n);
  error = abs ( q - exact );
  fprintf ( 1, '  x^2          %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = xy = x * sqrt ( 1 - x^2 )
%
  exact = 0.0;
  f(1:n,1) = x(1:n) .* sqrt ( 1.0 - x(1:n).^2 );
  q = w(1:n)' * f(1:n) / 2.0;
  error = abs ( q - exact );
  fprintf ( 1, '  x  y         %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = y^2 -> ( 1 - x^2 )
%
  exact = 0.39269908169872415481;
  f(1:n,1) = 1.0 - x(1:n).^2;
  q = w(1:n)' * f(1:n) / 3.0;
  error = abs ( q - exact );
  fprintf ( 1, '     y^2       %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = x^3
%
  exact = 0.0;
  f(1:n,1) = x(1:n).^3;
  q = w(1:n)' * f(1:n);
  error = abs ( q - exact );
  fprintf ( 1, '  x^3          %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = x^2 y = x^2 sqrt ( 1 - x^2 )
%
  exact = 0.13333333333333333333;
  f(1:n,1) = x(1:n).^2 .* sqrt ( 1.0 - x(1:n).^2 );
  q = w(1:n)' * f(1:n) / 2.0;
  error = abs ( q - exact );
  fprintf ( 1, '  x^2y         %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = x y^2 = x * ( 1 - x^2 )
%
  exact = 0.0;
  f(1:n,1) = x(1:n) .* ( 1.0 - x(1:n).^2 );
  q = w(1:n)' * f(1:n) / 3.0;
  error = abs ( q - exact );
  fprintf ( 1, '  x  y^2       %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = y^3
%
  exact = 0.26666666666666666667;
  f(1:n,1) = ( 1.0 - x(1:n).^2 ).^(1.5);
  q = w(1:n)' * f(1:n) / 4.0;
  error = abs ( q - exact );
  fprintf ( 1, '     y^3       %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = x^4
%
  exact = 0.19634954084936207740;
  f(1:n,1) = x(1:n).^4;
  q = w(1:n)' * f(1:n);
  error = abs ( q - exact );
  fprintf ( 1, '  x^4          %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = x^2y^2 -> x^2( 1 - x^2 )
%
  exact = 0.065449846949787359135;
  f(1:n,1) = x(1:n).^2 .* ( 1.0 - x(1:n).^2 );
  q = w(1:n)' * f(1:n) / 3.0;
  error = abs ( q - exact );
  fprintf ( 1, '  x^2y^2       %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = y^4 -> ( 1 - x^2 )^2
%
  exact = 0.19634954084936207740;
  f(1:n,1) = ( 1.0 - x(1:n).^2 ).^2;
  q = w(1:n)' * f(1:n) / 5.0;
  error = abs ( q - exact );
  fprintf ( 1, '     y^4       %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = x^4y = x^4 sqrt ( 1 - x^2 )
%
  exact = 0.057142857142857142857;
  f(1:n,1) = x(1:n).^4 .* sqrt ( 1.0 - x(1:n).^2 );
  q = w(1:n)' * f(1:n) / 2.0;
  error = abs ( q - exact );
  fprintf ( 1, '  x^4y         %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  x^2y^3 = x^2 ( 1 - x^2 )**(3/2)
%
  exact = 0.038095238095238095238;
  f(1:n,1) = x(1:n).^2 .* ( 1.0 - x(1:n).^2 ).^(1.5);
  q = w(1:n)' * f(1:n) / 4.0;
  error = abs ( q - exact );
  fprintf ( 1, '  x^2y^3       %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = y^5
%
  exact = 0.15238095238095238095;
  f(1:n,1) = ( 1.0 - x(1:n).^2 ).^(2.5);
  q = w(1:n)' * f(1:n) / 6.0;
  error = abs ( q - exact );
  fprintf ( 1, '     y^5       %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = x^6
%
  exact = 0.12271846303085129838;
  f(1:n,1) = x(1:n).^6;
  q = w(1:n)' * f(1:n);
  error = abs ( q - exact );
  fprintf ( 1, '  x^6          %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = x^4y^2 -> x^4( 1 - x^2 )
%
  exact = 0.024543692606170259675;
  f(1:n,1) = x(1:n).^4 .* ( 1.0 - x(1:n).^2 );
  q = w(1:n)' * f(1:n) / 3.0;
  error = abs ( q - exact );
  fprintf ( 1, '  x^4y^2       %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = x^2y^4 -> x^2( 1 - x^2 )^2
%
  exact = 0.024543692606170259675;
  f(1:n,1) = x(1:n).^2 .* ( 1.0 - x(1:n).^2 ).^2;
  q = w(1:n)' * f(1:n) / 5.0;
  error = abs ( q - exact );
  fprintf ( 1, '  x^2y^4       %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );
%
%  f(x,y) = y^6 -> ( 1 - x^2 )^3
%
  exact = 0.12271846303085129838;
  f(1:n,1) = ( 1.0 - x(1:n).^2 ).^3;
  q = w(1:n)' * f(1:n) / 7.0;
  error = abs ( q - exact );
  fprintf ( 1, '     y^6       %2d  %14.6g  %14.6g  %14.6g\n', n, exact, q, error );

  return
end