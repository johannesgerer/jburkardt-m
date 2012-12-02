function tg = triangle_grid ( n, t )

%*****************************************************************************80
%
%% TRIANGLE_GRID computes points on a triangular grid.
%
%  Discussion:
%
%    The grid is defined by specifying the coordinates of an enclosing
%    triangle T, and the number of subintervals each side of the triangle
%    should be divided into.
%
%    Choosing N = 10, for instance, breaks each side into 10 subintervals,
%    and produces a grid of ((10+1)*(10+2))/2 = 66 points.
%
%              X
%             9 X
%            8 9 X
%           7 8 9 X
%          6 7 8 9 X
%         5 6 7 8 9 X
%        4 5 6 7 8 9 X
%       3 4 5 6 7 8 9 X
%      2 3 4 5 6 7 8 9 X
%     1 2 3 4 5 6 7 8 9 X
%    0 1 2 3 4 5 6 7 8 9 X
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of subintervals.
%
%    Input, real T(2,3), the coordinates of the points
%    defining the triangle.
%
%    Output, real TG(2,((N+1)*(N+2))/2), the coordinates
%    of the points in the triangle.
%
  ng = ( ( n + 1 ) * ( n + 2 ) ) / 2;
  tg = zeros ( 2, ng );

  p = 0;

  for i = 0 : n
    for j = 0 : n - i
      k = n - i - j;
      p = p + 1;
      tg(1:2,p) = ( i * t(1:2,1) + j * t(1:2,2) + k * t(1:2,3) ) / n;
    end
  end

  return
end
