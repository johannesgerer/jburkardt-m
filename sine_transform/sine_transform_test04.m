function sine_transform_test04 ( )

%*****************************************************************************80
%
%% SINE_TRANSFORM_TEST04 evaluates the sine transform interpolant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 December 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SINE_TRANSFORM_TEST04:\n' );
  fprintf ( 1, '  SINE_TRANSFORM_FUNCTION does a sine transform of data\n' );
  fprintf ( 1, '  defined by a function F(X) evaluated at N equally spaced\n' );
  fprintf ( 1, '  points in an interval [A,B].\n' );
  fprintf ( 1, '  SINE_TRANSFORM_INTERPOLANT evaluates the interpolant.\n' );
  fprintf ( 1, '\n' ); 
  fprintf ( 1, '  The interpolant will be 0 at the 0th and (N+1)-th points.\n' );
  fprintf ( 1, '  It equals the function at points 1 through N.\n' );
  fprintf ( 1, '  In between, it can approximate smooth functions,\n' );
  fprintf ( 1, '  and the approximation improves with N.\n' );
%
%  N determines the number of data points, indexed by 1 to N.  
%  However, we essentially have N+2 data points, indexed 0 to N+1,
%  with the data value being 0 at the first and last auxilliary points.
%
  clf
  hold on

  n = 15;

  a = 0.0;
  b = 7.0;
  x = linspace ( a, b, n + 2 );
  x = x(2:n+1);
%
%  Determine the interpolant coefficients.
%
  s = sine_transform_function ( n, a, b, @cosine_sum );
%
%  Evaluate the interpolant.
%
  fa = cosine_sum ( a );
  fb = cosine_sum ( b );
  n2 = 1 + 5 * ( n + 1 );
  x2 = linspace ( a, b, n2 );
  f2 = sine_transform_interpolant ( n, a, b, fa, fb, s, n2, x2 );
%
%  Plot the sample points as blue dots,
%  the approximant as a red line,
%  the exact function as a black line.
%
  plot ( x, cosine_sum(x), 'k*' )
  plot ( x2, f2, 'r-' );

  x3 = linspace ( a, b, 501 );
  f3 = cosine_sum ( x3 );
  plot ( x3, f3, 'b-' );

  title ( 'Function and sine interpolant' )
  hold off

  print -djpeg sine_transform_test04.png
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Function and interpolant plot saved as sine_transform_test04.png\n' );

  return
end
