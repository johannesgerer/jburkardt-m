function x2 = line_ccvt_lloyd_step ( n, a, b, x1 )

%*****************************************************************************80
%
%% LINE_CCVT_LLOYD_STEP takes one step of Lloyd's constrained CVT algorithm.
%
%  Discussion:
%
%    Each step of Lloyd's algorithm replaces a point by the center of mass
%    of the associated region.  For points on a line, with a uniform
%    density, the associated region is demarcated by the midways between 
%    successive points.
%
%    Here, we include the additional constraint that we want the first and last
%    points to be fixed at the endpoints of the line, that is, X(1) = A
%    and X(2) = B.  In that case, the calculation of the updates for the
%    first two and last two points must be handled differently.
%
%    For points away from the boundary, a step of Lloyd's method can be 
%    regarded as replacing each point by the average of the left and right
%    midways.  The midways, of course, are the average of two points.
%    So for point J, we have:
%
%      M(J-1,J) = ( X(J-1) + X(J) ) / 2
%      M(J,J+1) = ( X(J) + X(J+1) ) / 2
%      X*(J) = ( M(J-1,J) + M(J,J+1) ) / 2 = ( X(J-1) + 2 X(J) + X(J+1) ) / 4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%    1 <= N.
%
%    Input, real A, B, the left and right endpoints.
%
%    Input, real X1(N), the current point locations.
%
%    Output, real X2(N), the updated point locations.
%
  x2 = zeros ( n, 1 );

  if ( n == 1 )

    x2(1) = ( a + b ) / 2.0;

  elseif ( n == 2 )

    x2(1) = a;
    x2(2) = b;

  else

    x2(1) = a;

    for j = 2 : n - 1 
      x2(j) = ( 0.5 * ( x1(j-1) + x1(j) ) + 0.5 * ( x1(j) + x1(j+1) ) ) / 2.0;
    end

    x2(n) = b;

  end

  return
end
