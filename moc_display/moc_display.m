function moc_display ( a, b, n, f )

%*****************************************************************************80
%
%% MOC_DISPLAY plots data related to the modulus of continuity of a function.
%
%  Discussion:
%
%    Three graphs will be shown:
%    1) A plot of F(X) from A to B.
%    2) A plot of the function MC1(X) for 0 <= T <= B-A, where
%       MC1(T) = max | F(X+DX) - F(X) |, for DX = T, X and X+DX in [A,B].
%    3) A plot of the function MC(X) for 0 <= T <= B-A, where
%       MC(T) = max | F(X+DX) - F(X) |, for DX <= T, X and X+DX in [A,B].
%
%    The functions MC1 and MC are estimated by evaluating F(X) at N
%    equally spaced points in [A,B].
%
%    MC(T) is known as the "modulus of continuity" for F(X); 
%    MC1(T) has no special name.
%
%    The exact function MC(T) should be a monotone increasing function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the left and right endpoints of the interval.
%
%    Input, integer N, the number of equally spaced sample points used to
%    estimate MC1(T) and MC(T).
%
%    Input, function F(x), a handle to the function whose modulus of
%    continuity function is to be estimated and plotted.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MOC_DISPLAY:\n' );
  fprintf ( 1, '  Estimate and plot the Modulus of Continuity function\n' );
  fprintf ( 1, '  over an interval [A,B], using N sample points, and a\n' );
  fprintf ( 1, '  user-specified function F(X).\n' );

  if ( nargin < 1 )
    a = 0.0;
  end

  if ( nargin < 2 )
    b = a + 1.0;
  end

  if ( nargin < 3 )
    n = 501;
  end
%
%  Compute discrete data for given N.
%
  x = linspace ( a, b, n );
  dx = linspace ( 0, b - a, n );
  fx = f ( x );

  mc1 = zeros ( n, 1 );
  for i = 0 : n - 1
    mc1(i+1) = max ( abs ( fx(1+i:n) - fx(1:n-i) ) );
  end

  mc = zeros ( n, 1 );
  for i = 1 : n - 1
    mc(i+1) = max ( mc(i), mc1(i+1) );
  end
%
%  Display the plots.
%
  subplot ( 3, 1, 1 )
  n_fine = 1000;
  x_fine = linspace ( a, b, n_fine );
  fx_fine = f ( x_fine );
  plot ( x_fine, fx_fine, 'LineWidth', 2 )
  grid on
  title ( 'F(X)' );

  subplot ( 3, 1, 2 )
  plot ( dx, mc1, 'LineWidth', 2 );
  grid on
  title ( sprintf ( 'MC1(DX): max |F(X+DX)-F(X)|, N = %d', n ) )

  subplot ( 3, 1, 3 )
  plot ( dx, mc, 'LineWidth', 2 );
  grid on
  title ( sprintf ( 'MC(T): max |F(X+DX)-F(X)| for DX <= T, N = %d', n ) )

  return
end
  