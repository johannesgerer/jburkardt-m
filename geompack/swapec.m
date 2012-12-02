function [ top, btri, bedg, tri_vert, tri_nabe ] = swapec ( ...
  i, top, btri, bedg, point_num, p, tri_num, tri_vert, tri_nabe, work )

%*****************************************************************************80
%
%% SWAPEC swaps diagonal edges until all triangles are Delaunay.
%
%  Discussion:
%
%    The routine swaps diagonal edges in a 2D triangulation, based on
%    the empty circumcircle criterion, until all triangles are Delaunay,
%    given that I is the index of the new vertex added to the triangulation.
%
%  Modified:
%
%    07 February 2005
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
%  Parameters:
%
%    Input, integer I, the index of the new vertex.
%
%    Input/output, integer TOP, the index of the top of the stack.
%    On output, TOP is zero.
%
%    Input/output, integer BTRI, BEDG; on input, if positive, are the
%    triangle and edge indices of a boundary edge whose updated indices
%    must be recorded.  On output, these may be updated because of swaps.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, real P(2,POINT_NUM), the coordinates of
%    the points.
%
%    Input, integer TRI_NUM, the number of triangles.
%
%    Input/output, integer TRI_VERT(3,TRI_NUM), the triangle incidence list.  
%    May be updated on output because of swaps.
%
%    Input/output, integer TRI_NABE(3,TRI_NUM), the triangle neighbor list; 
%    negative values are used for links of the counter-clockwise linked 
%    list of boundary edges;  May be updated on output because of swaps.
%
%      LINK = -(3*I + J-1) where I, J = triangle, edge index.
%
%    Workspace, integer WORK(MAXST); on input, entries 1 through TOP
%    contain the indices of initial triangles (involving vertex I)
%    put in stack; the edges opposite I should be in interior;  entries
%    TOP+1 through MAXST are used as a stack.
%

%
%  Determine whether triangles in stack are Delaunay, and swap
%  diagonal edge of convex quadrilateral if not.
%
  x = p(1,i);
  y = p(2,i);

  while ( 1 )

    if ( top <= 0 )
      break
    end

    t = work(top);
    top = top - 1;

    if ( tri_vert(1,t) == i )
      e = 2;
      b = tri_vert(3,t);
    elseif ( tri_vert(2,t) == i )
      e = 3;
      b = tri_vert(1,t);
    else
      e = 1;
      b = tri_vert(2,t);
    end

    a = tri_vert(e,t);
    u = tri_nabe(e,t);

    if ( tri_nabe(1,u) == t )
      f = 1;
      c = tri_vert(3,u);
    elseif ( tri_nabe(2,u) == t )
      f = 2;
      c = tri_vert(1,u);
    else
      f = 3;
      c = tri_vert(2,u);
    end

    swap = diaedg ( x, y, p(1,a), p(2,a), p(1,c), p(2,c), p(1,b), p(2,b) );

    if ( swap == 1 )

      em1 = i4_wrap ( e - 1, 1, 3 );
      ep1 = i4_wrap ( e + 1, 1, 3 );
      fm1 = i4_wrap ( f - 1, 1, 3 );
      fp1 = i4_wrap ( f + 1, 1, 3 );

      tri_vert(ep1,t) = c;
      tri_vert(fp1,u) = i;
      r = tri_nabe(ep1,t);
      s = tri_nabe(fp1,u);
      tri_nabe(ep1,t) = u;
      tri_nabe(fp1,u) = t;
      tri_nabe(e,t) = s;
      tri_nabe(f,u) = r;

      if ( 0 < tri_nabe(fm1,u) )
        top = top + 1;
        work(top) = u;
      end

      if ( 0 < s )

        if ( tri_nabe(1,s) == u )
          tri_nabe(1,s) = t;
        elseif ( tri_nabe(2,s) == u )
          tri_nabe(2,s) = t;
        else
          tri_nabe(3,s) = t;
        end

        top = top + 1;

        if ( point_num < top )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'SWAPEC - Fatal error!\n' );
          fprintf ( 1, '  Exceeded stacksize.\n' );
          error ( 'SWAPEC - Fatal error!' );
        end

        work(top) = t;

      else

        if ( u == btri & fp1 == bedg )
          btri = t;
          bedg = e;
        end

        l = - ( 3 * t + e - 1 );
        tt = t;
        ee = em1;

        while ( 0 < tri_nabe(ee,tt) )

          tt = tri_nabe(ee,tt);

          if ( tri_vert(1,tt) == a )
            ee = 3;
          elseif ( tri_vert(2,tt) == a )
            ee = 1;
          else
            ee = 2;
          end

        end

        tri_nabe(ee,tt) = l;

      end

      if ( 0 < r )

        if ( tri_nabe(1,r) == t )
          tri_nabe(1,r) = u;
        elseif ( tri_nabe(2,r) == t )
          tri_nabe(2,r) = u;
        else
          tri_nabe(3,r) = u;
        end

      else

        if ( t == btri & ep1 == bedg )
          btri = u;
          bedg = f;
        end

        l = - ( 3 * u + f - 1 );
        tt = u;
        ee = fm1;

        while ( 0 < tri_nabe(ee,tt) )

          tt = tri_nabe(ee,tt);

          if ( tri_vert(1,tt) == b )
            ee = 3;
          elseif ( tri_vert(2,tt) == b )
            ee = 1;
          else
            ee = 2;
          end

        end

        tri_nabe(ee,tt) = l;

      end

    end

  end

  return
end
