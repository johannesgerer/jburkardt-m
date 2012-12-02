function [ ltri, ledg, rtri, redg ] = vbedg ( x, y, node_num, node_xy, ...
  triangle_num, triangle_node, triangle_neighbor, ltri, ledg, rtri, redg )

%*****************************************************************************80
%
%% VBEDG determines which boundary edges are visible to a point.
%
%  Discussion:
%
%    The point (X,Y) is assumed to be outside the convex hull of the
%    region covered by the 2D triangulation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2008
%
%  Author:
%
%    Original FORTRAN77 version by Barry Joe,
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Barry Joe,
%    GEOMPACK - a software package for the generation of meshes
%    using geometric algorithms,
%    Advances in Engineering Software,
%    Volume 13, pages 325-331, 1991.
%
%  Parameters:
%
%    Input, real X, Y, the coordinates of a point outside the
%    convex hull of the current triangulation.
%
%    Input, integer NODE_NUM, the number of points.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the
%    vertices.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(3,TRIANGLE_NUM), the triangle incidence list.
%
%    Input, integer TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), the triangle neighbor list; negative
%    values are used for links of a counter clockwise linked list of boundary
%    edges;
%      LINK = -(3*I + J-1) where I, J = triangle, edge index.
%
%    Input/output, integer LTRI, LEDG.  If LTRI /= 0 then these values are
%    assumed to be already computed and are not changed, else they are updated.
%    On output, LTRI is the index of boundary triangle to the left of the
%    leftmost boundary triangle visible from (X,Y), and LEDG is the boundary
%    edge of triangle LTRI to the left of the leftmost boundary edge visible
%    from (X,Y).  1 <= LEDG <= 3.
%
%    Input/output, integer RTRI.  On input, the index of the boundary triangle
%    to begin the search at.  On output, the index of the rightmost boundary
%    triangle visible from (X,Y).
%
%    Input/output, integer REDG, the edge of triangle RTRI that is visible
%    from (X,Y).  1 <= REDG <= 3.
%
  dim_num = 2;
%
%  Find the rightmost visible boundary edge using links, then possibly
%  leftmost visible boundary edge using triangle neighbor information.
%
  if ( ltri == 0 )
    ldone = 0;
    ltri = rtri;
    ledg = redg;
  else
    ldone = 1;
  end

  while ( 1 )

    l = -triangle_neighbor(redg,rtri);
    t = floor ( l / 3 );
    e = mod ( l, 3 ) + 1;
    a = triangle_node(e,t);

    if ( e <= 2 )
      b = triangle_node(e+1,t);
    else
      b = triangle_node(1,t);
    end

    lr = lrline ( x, y, node_xy(1,a), node_xy(2,a), node_xy(1,b), ...
      node_xy(2,b), 0.0 );

    if ( lr <= 0 )
      break;
    end

    rtri = t;
    redg = e;

  end

  if ( ldone )
    return
  end

  t = ltri;
  e = ledg;

  while ( 1 )

    b = triangle_node(e,t);
    e = i4_wrap ( e-1, 1, 3 );

    while ( 0 < triangle_neighbor(e,t) )

      t = triangle_neighbor(e,t);

      if ( triangle_node(1,t) == b )
        e = 3;
      elseif ( triangle_node(2,t) == b )
        e = 1;
      else
        e = 2;
      end

    end

    a = triangle_node(e,t);

    lr = lrline ( x, y, node_xy(1,a), node_xy(2,a), node_xy(1,b), ...
      node_xy(2,b), 0.0 );

    if ( lr <= 0 )
      break
    end

  end

  ltri = t;
  ledg = e;

  return
end
