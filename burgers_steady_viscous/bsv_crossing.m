function x0 = bsv_crossing ( a, b, n, x, u )

%*****************************************************************************80
%
%% BSV_CROSSING estimates the location X0 where U(X0) = 0.
%
%  Discussion:
%
%    This function is intended for a special case, in which we are solving
%    the Burgers equation over an interval [A,B], with positive boundary
%    condition at one end and negative at the other.  In that case, the
%    solution must change be zero at some point X0 in the interval.
%
%    We assume the solution is discretized by a piecewise linear function.
%    We use binary search to locate consecutive indices I and I+1 so that
%    U(I) and U(I+1) are of opposite signs.  We use linear interpolation to
%    estimate the location of X0 between X(I) and X(I+1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the left and right endpoints.
%
%    Input, integer N, the number of nodes to use between A and B.
%
%    Input, real X(N), the node coordinates.
%
%    Input, real U(N), the computed discretized solution.
%    It must be the case that U(1) and U(N) are of opposite sign.
%
%    Output, real X0, a point where the piecewise linear approximation to
%    the solution is zero.
%
  if ( u(1) == 0.0 )
    x0 = x(1);
    return
  end

  if ( u(n) == 0.0 )
    x0 = x(n);
    return
  end

  if ( r8_sign ( u(1) ) == r8_sign ( u(n) ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BSV_CROSSING - Fatal error!\n' );
    fprintf ( 1, '  We require opposite signs for U(1) and U(N).\n' );
    error ( 'BSV_CROSSING - Fatal error!\n' );
  end
%
%  Set the initial change of sign indices.
%
  i = 1;
  k = n;
%
%  Do a binary search for the smallest change of sign interval.
%
  while ( 1 < k - i )
%
%  Try halfway.
%
    j = floor ( ( i + k ) / 2 );

    if ( u(j) == 0.0 )
      x0 = x(j)
      return
    end

    if ( r8_sign ( u(j) ) == r8_sign ( u(i) ) )
      i = j;
    else
      k = j;
    end

  end
%
%  The change of sign interval indices are I and K=I+1.
%  Now interpolate to get X0.
%
  x0 = x(i) + u(i) * ( x(i) - x(k) ) / ( u(k) - u(i) );

  return
end
