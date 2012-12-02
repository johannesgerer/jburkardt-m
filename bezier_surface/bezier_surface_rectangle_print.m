function bezier_surface_rectangle_print ( rectangle_num, rectangle_node )

%*****************************************************************************80
%
%% BEZIER_SURFACE_RECTANGLE_PRINT prints rectangles.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer RECTANGLE_NUM, the number of rectangles.
%
%    Input, integer RECTANGLE_NODE(16,RECTANGLE_NUM), the nodes
%    that make up each rectangle.
%
  dim_num = 16;
  
  i4mat_transpose_print ( dim_num, rectangle_num, rectangle_node, ...
    '  Bezier Rectangles:' );

  return
end
