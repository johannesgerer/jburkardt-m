function [ value, ifault ] = trigamma ( x )

%*****************************************************************************80
%
%% TRIGAMMA calculates trigamma(x) = d**2 log(gamma(x)) / dx**2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by BE Schneider.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    BE Schneider,
%    Algorithm AS 121:
%    Trigamma Function,
%    Applied Statistics,
%    Volume 27, Number 1, pages 97-99, 1978.
%
%  Parameters:
%
%    Input, real X, the argument of the trigamma function.
%    0 < X.
%
%    Output, real VALUE, the value of the trigamma function at X.
%
%    Output, integer IFAULT, error flag.
%    0, no error.
%    1, X <= 0.
%
  a = 0.0001;
  b = 5.0;
  b2 =  0.1666666667;
  b4 = -0.03333333333;
  b6 =  0.02380952381;
  b8 = -0.03333333333;
%
%  Check the input.
%
  if ( x <= 0.0 )
    ifault = 1;
    value = 0.0;
    return
  end

  ifault = 0;
  z = x;
%
%  Use small value approximation if X <= A.
%
  if ( x <= a )
    value = 1.0 / x / x;
    return
  end
%
%  Increase argument to ( X + I ) >= B.
%
  value = 0.0;

  while ( z < b )
    value = value + 1.0 / z / z;
    z = z + 1.0;
  end
%
%  Apply asymptotic formula if argument is B or greater.
%
  y = 1.0 / z / z;

  value = value + 0.5 * ...
      y + ( 1.0 ...
    + y * ( b2  ...
    + y * ( b4  ...
    + y * ( b6  ...
    + y *   b8 )))) / z;

  return
end
