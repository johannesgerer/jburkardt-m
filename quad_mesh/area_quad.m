function area = area_quad ( quad_xy )

%*****************************************************************************80
%
%% AREA_QUAD returns the area of a quadrilateral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real QUAD_XY(2,4), the coordinates of the nodes.
%
%    Output, real AREA, the area of the quadrilateral.
%
  t1(1:2,1) = quad_xy(1:2,1);
  t1(1:2,2) = quad_xy(1:2,2);
  t1(1:2,3) = quad_xy(1:2,3);

  area1 = triangle_area ( t1 );

  t2(1:2,1) = quad_xy(1:2,3);
  t2(1:2,2) = quad_xy(1:2,4);
  t2(1:2,3) = quad_xy(1:2,1);

  area2 = triangle_area ( t2 );

  if ( area1 < 0.0 | area2 < 0.0 )

    t1(1:2,1) = quad_xy(1:2,2);
    t1(1:2,2) = quad_xy(1:2,3);
    t1(1:2,3) = quad_xy(1:2,4);

    area1 = triangle_area ( t1 );

    t2(1:2,1) = quad_xy(1:2,4);
    t2(1:2,2) = quad_xy(1:2,1);
    t2(1:2,3) = quad_xy(1:2,2);

    area2 = triangle_area ( t2 );

    if ( area1 < 0.0 | area2 < 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'AREA_QUAD - Fatal error!\n' );
      fprintf ( 1, '  The quadrilateral nodes seem to be listed in\n' );
      fprintf ( 1, '  the wrong order, or the quadrilateral is\n' );
      fprintf ( 1, '  degenerate.\n' );
      error ( 'AREA_QUAD - Fatal error!' );
    end

  end

  area = area1 + area2;

  return
end
