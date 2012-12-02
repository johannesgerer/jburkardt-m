function value = triangulation_area ( x_num, x, t_num, t )

%*****************************************************************************80
%
%% TRIANGULATION_AREA computes the area of a triangulation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X_NUM, the number of nodes.
%
%    Input, real X(2,X_NUM), the coordinates of the nodes.
%
%    Input, integer T_NUM, the number of triangles.
%
%    Input, integer T(3,T_NUM), the nodes making up each triangle.
%
%    Output, real VALUE, the area.
%
  value = 0.0;

  for triangle = 1 : t_num

    triangle_xy(1:2,1:3) = x(1:2,t(1:3,triangle));

    triangle_area = 0.5 * abs ( ...
        triangle_xy(1,1) * ( triangle_xy(2,2) - triangle_xy(2,3) ) ...
      + triangle_xy(1,2) * ( triangle_xy(2,3) - triangle_xy(2,1) ) ...
      + triangle_xy(1,3) * ( triangle_xy(2,1) - triangle_xy(2,2) ) );

    value = value + triangle_area;

  end

  return
end
