function value = trigamma ( x )

%*****************************************************************************80
%
%% TRIGAMMA calculates trigamma(x) = d**2 log(Gamma(x)) / dx**2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    B Schneider,
%    Trigamma Function,
%    Algorithm AS 121,
%    Applied Statistics,
%    Volume 27, Number 1, page 97-99, 1978.
%
%  Parameters:
%
%    Input, X, the argument of the trigamma function.
%    0 < X.
%
%    Output, real VALUE, the value of the trigamma function at X.
%
  a = 0.0001;
  b = 5.0;
  b2 =  1.0 / 6.0;
  b4 = -1.0 / 30.0;
  b6 =  1.0 / 42.0;
  b8 = -1.0 / 30.0;
%
%  1): If X is not positive, fail.
%
  if ( x <= 0.0 )

    value = 0.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIGAMMA - Fatal error!\n' );
    fprintf ( 1, '  X <= 0.\n' );
    error ( 'TRIGAMMA - Fatal error!' );
%
%  2): If X is smaller than A, use a small value approximation.
%
  elseif ( x <= a )

    value = 1.0 / x^2;
%
%  3): Otherwise, increase the argument to B <= ( X + I ).
%
  else

    z = x;
    value = 0.0;

    while ( z < b )
      value = value + 1.0 / z^2;
      z = z + 1.0;
    end
%
%  ...and then apply an asymptotic formula.
%
    y = 1.0 / z^2;

    value = value + 0.5 * ...
            y + ( 1.0 ...
          + y * ( b2 ...
          + y * ( b4 ...
          + y * ( b6 ...
          + y *   b8 )))) / z;

  end

  return
end
