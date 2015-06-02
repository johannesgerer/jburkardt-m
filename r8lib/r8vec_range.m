function [ ymin, ymax ] = r8vec_range ( n, x, xmin, xmax, y )

%*****************************************************************************80
%
%% R8VEC_RANGE finds the range of Y's within a restricted X range.
%
%  Discussion:
%
%    The routine is given a set of pairs of points (X,Y), and a range
%    XMIN to XMAX of valid X values.  Over this range, it seeks
%    YMIN and YMAX, the minimum and maximum values of Y for
%    valid X's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real X(N), the X array.
%
%    Input, real XMIN, XMAX, the range of X to be checked
%
%    Input, real Y(N), the Y array.
%
%    Output, real YMIN, YMAX, the range of Y values for which the corresponding
%    X value is in the X range.
%
  ymin =   realmax ( );
  ymax = - realmax ( );

  for i = 1 : n

    if ( xmin <= x(i) && x(i) <= xmax )

      ymin = min ( ymin, y(i) );
      ymax = max ( ymax, y(i) );

    end

  end

  return
end
