function value = r8_diff ( x, y, n )

%*****************************************************************************80
%
%% R8_DIFF computes (X-Y) to a specified accuracy.
%
%  Discussion:
%
%    The user controls how many binary digits of accuracy
%    are to be used.
%
%    N determines the accuracy of the value of the result.  If N = 10,
%    for example, only 11 binary places will be used in the arithmetic.
%    In general, only N+1 binary places will be used.
%
%    N may be zero.  However, a negative value of N should
%    not be used, since this will cause both X and Y to look like 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the two values whose difference is desired.
%
%    Input, integer N, the number of binary digits to use.
%
%    Output, real VALUE, the value of X-Y.
%
  if ( x == y )
    value = 0.0;
    return
  end

  pow2 = 2.0 ^ n;
%
%  Compute the magnitude of X and Y, and take the larger of the
%  two.  At least one of the two values is not zero!
%
  size = max ( abs ( x ), abs ( y ) );
%
%  Make normalized copies of X and Y.  One of the two values will
%  actually be equal to 1.
%
  x = x / size;
  y = y / size;
%
%  Here's where rounding comes in.  We know that the larger of the
%  the two values equals 1.  We multiply both values by 2**N,
%  where N+1 is the number of binary digits of accuracy we want
%  to use, truncate the values, and divide back by 2**N.
%
  x = ( floor ( x * pow2 + 0.5 * r8_sign ( x ) ) ) / pow2;
  y = ( floor ( y * pow2 + 0.5 * r8_sign ( y ) ) ) / pow2;
%
%  Take the difference now.
%
  value = x - y;
%
%  Undo the scaling.
%
  value = value * size;

  return
end
