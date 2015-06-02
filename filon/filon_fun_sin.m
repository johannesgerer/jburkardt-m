function value = filon_fun_sin ( n, f, a, b, t )

%*****************************************************************************80
%
%% FILON_FUN_SIN uses Filon's method on integrals with a sine factor.
%
%  Discussion:
%
%    The integral to be approximated has the form
%
%      Integral ( A <= X <= B ) F(X) * SIN(T*X) dX
%
%    where T is user specified.
%
%    The function is interpolated over each subinterval by
%    a parabolic arc.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
%
%    Stephen Chase, Lloyd Fosdick,
%    An Algorithm for Filon Quadrature,
%    Communications of the Association for Computing Machinery,
%    Volume 12, Number 8, August 1969, pages 453-457.
%
%    Stephen Chase, Lloyd Fosdick,
%    Algorithm 353:
%    Filon Quadrature,
%    Communications of the Association for Computing Machinery,
%    Volume 12, Number 8, August 1969, pages 457-458.
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%  Parameters:
%
%    Input, integer N, the number of data points, 
%    including the endpoints.  N must be odd, and greater than 1.
%
%    Input, function pointer F, the subroutine which evaluates the integrand,
%    of the form "function fx = f ( n, x )".
%
%    Input, real A, B, the limits of integration.
%
%    Input, real T, multiplier of the X argument of the sine.
%
%    Output, real VALUE, the approximate value of the integral.
%
  if ( a == b )
    value = 0.0;
    return
  end
 
  if ( n <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILON_FUN_SIN - Fatal error!\n' );
    fprintf ( 1, '  N < 2\n' );
    fprintf ( 1, '  N = %d\n', n );
    error ( 'FILON_FUN_SIN - Fatal error!' );
  end
 
  if ( mod ( n, 2 ) ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILON_FUN_SIN - Fatal error!\n' );
    fprintf ( 1, '  N must be odd.\n' );
    fprintf ( 1, '  N = %d\n', n );
    error ( 'FILON_FUN_SIN - Fatal error!' );
  end
%
%  Set the X values.
%
  x = linspace ( a, b, n );
  h = ( b - a ) / ( n - 1 );
  theta = t * h;

  sint = sin ( theta );
  cost = cos ( theta );

  if ( 6.0 * abs ( theta ) <= 1.0 )

    alpha = 2.0 * theta^3 /   45.0 ...
          - 2.0 * theta^5 /  315.0 ...
          + 2.0 * theta^7 / 4725.0;
  
    beta =  2.0           /     3.0 ...
          + 2.0 * theta^2 /    15.0 ...
          - 4.0 * theta^4 /   105.0 ...
          + 2.0 * theta^6 /   567.0 ...
          - 4.0 * theta^8 / 22275.0;

    gamma = 4.0           /      3.0 ...
          - 2.0 * theta^2 /     15.0 ...
          +       theta^4 /    210.0 ...
          -       theta^6 /  11340.0;

  else
 
    alpha = ( theta^2 + theta * sint * cost ...
      - 2.0 * sint^2 ) / theta^3;

    beta = ( 2.0 * theta + 2.0 * theta * cost^2 ...
      - 4.0 * sint * cost ) / theta^3;

    gamma = 4.0 * ( sint - theta * cost ) / theta^3;
 
  end
%
%  Tabulate the function.
%
  ftab = f ( n, x );

  s2n = sum ( ftab(1:2:n) .* sin ( t * x(1:2:n) ) ) ...
    - 0.5 * ( ftab(n) * sin ( t * x(n) ) ...
            + ftab(1) * sin ( t * x(1) ) );

  s2nm1 = sum ( ftab(2:2:n-1) .* sin ( t * x(2:2:n-1) ) );

  value = h * ( ...
      alpha * ( ftab(1) * cos ( t * x(1) ) ...
              - ftab(n) * cos ( t * x(n) ) ) ...
    + beta * s2n ...
    + gamma * s2nm1 );
 
  return
end