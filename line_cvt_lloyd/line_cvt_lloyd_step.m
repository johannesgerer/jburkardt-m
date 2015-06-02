function x2 = line_cvt_lloyd_step ( n, a, b, x1 )

%*****************************************************************************80
%
%% LINE_CVT_LLOYD_STEP takes one step of Lloyd's unconstrained CVT algorithm.
%
%  Discussion:
%
%    Each step of Lloyd's algorithm replaces a point by the center of mass
%    of the associated region.  For points on a line, with a uniform
%    density, the associated region is demarcated by the midways between 
%    successive points.
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

  else

    j = 1;
    x2(j) = (           a                 + 0.5 * ( x1(j) + x1(j+1) ) ) / 2.0;

    for j = 2 : n - 1 
      x2(j) = ( 0.5 * ( x1(j-1) + x1(j) ) + 0.5 * ( x1(j) + x1(j+1) ) ) / 2.0;
    end

    j = n;
    x2(j) =   ( 0.5 * ( x1(j-1) + x1(j) ) +                       b   ) / 2.0;

  end

  return
end
