function [ ltri, ledg, rtri, redg ] = vbedg ( x, y, point_num, p, tri_num, ...
  tri_vert, tri_nabe, ltri, ledg, rtri, redg )

%*****************************************************************************80
%
%% VBEDG determines which boundary edges are visible to a point.
%
%  Discussion:
%
%    The point (X,Y) is assumed to be outside the convex hull of the
%    region covered by the 2D triangulation.
%
%  Author:
%
%    Original FORTRAN77 version by Barry Joe.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Barry Joe,
%    GEOMPACK - a software package for the generation of meshes
%    using geometric algorithms,
%    Advances in Engineering Software,
%    Volume 13, pages 325-331, 1991.
%
%  Modified:
%
%    07 February 2005
%
%  Parameters:
%
%    Input, real X, Y, the coordinates of a point outside the
%    convex hull of the current triangulation.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, real P(2,POINT_NUM), the coordinates of the
%    vertices.
%
%    Input, integer TRI_NUM, the number of triangles.
%
%    Input, integer TRI_VERT(3,TRI_NUM), the triangle incidence list.
%
%    Input, integer TRI_NABE(3,TRI_NUM), the triangle neighbor list; negative
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
  ndim = 2;
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

    l = -tri_nabe(redg,rtri);
    t = floor ( l / 3 );
    e = mod ( l, 3 ) + 1;
    a = tri_vert(e,t);

    if ( e <= 2 )
      b = tri_vert(e+1,t);
    else
      b = tri_vert(1,t);
    end

    lr = lrline ( x, y, p(1,a), p(2,a), p(1,b), p(2,b), 0.0 );

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

    b = tri_vert(e,t);
    e = i4_wrap ( e-1, 1, 3 );

    while ( 0 < tri_nabe(e,t) )

      t = tri_nabe(e,t);

      if ( tri_vert(1,t) == b )
        e = 3;
      elseif ( tri_vert(2,t) == b )
        e = 1;
      else
        e = 2;
      end

    end

    a = tri_vert(e,t);

    lr = lrline ( x, y, p(1,a), p(2,a), p(1,b), p(2,b), 0.0 );

    if ( lr <= 0 )
      break
    end

  end

  ltri = t;
  ledg = e;

  return
end
