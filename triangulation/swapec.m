function [ top, btri, bedg, triangle_node, triangle_neighbor ] = swapec ( ...
  i, top, btri, bedg, node_num, node_xy, triangle_num, triangle_node, ...
  triangle_neighbor, work )

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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2005
%
%  Author:
%
%    Original FORTRAN77 version by Barry Joe,
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
%    Input, integer NODE_NUM, the number of node.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of
%    the points.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input/output, integer TRIANGLE_NODE(3,TRIANGLE_NUM), the triangle incidence list.  
%    May be updated on output because of swaps.
%
%    Input/output, integer TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), the triangle neighbor list; 
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
  x = node_xy(1,i);
  y = node_xy(2,i);

  while ( 1 )

    if ( top <= 0 )
      break
    end

    t = work(top);
    top = top - 1;

    if ( triangle_node(1,t) == i )
      e = 2;
      b = triangle_node(3,t);
    elseif ( triangle_node(2,t) == i )
      e = 3;
      b = triangle_node(1,t);
    else
      e = 1;
      b = triangle_node(2,t);
    end

    a = triangle_node(e,t);
    u = triangle_neighbor(e,t);

    if ( triangle_neighbor(1,u) == t )
      f = 1;
      c = triangle_node(3,u);
    elseif ( triangle_neighbor(2,u) == t )
      f = 2;
      c = triangle_node(1,u);
    else
      f = 3;
      c = triangle_node(2,u);
    end

    swap = diaedg ( x, y, node_xy(1,a), node_xy(2,a), node_xy(1,c), node_xy(2,c), ...
      node_xy(1,b), node_xy(2,b) );

    if ( swap == 1 )

      em1 = i4_wrap ( e - 1, 1, 3 );
      ep1 = i4_wrap ( e + 1, 1, 3 );
      fm1 = i4_wrap ( f - 1, 1, 3 );
      fp1 = i4_wrap ( f + 1, 1, 3 );

      triangle_node(ep1,t) = c;
      triangle_node(fp1,u) = i;
      r = triangle_neighbor(ep1,t);
      s = triangle_neighbor(fp1,u);
      triangle_neighbor(ep1,t) = u;
      triangle_neighbor(fp1,u) = t;
      triangle_neighbor(e,t) = s;
      triangle_neighbor(f,u) = r;

      if ( 0 < triangle_neighbor(fm1,u) )
        top = top + 1;
        work(top) = u;
      end

      if ( 0 < s )

        if ( triangle_neighbor(1,s) == u )
          triangle_neighbor(1,s) = t;
        elseif ( triangle_neighbor(2,s) == u )
          triangle_neighbor(2,s) = t;
        else
          triangle_neighbor(3,s) = t;
        end

        top = top + 1;

        if ( node_num < top )
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

        while ( 0 < triangle_neighbor(ee,tt) )

          tt = triangle_neighbor(ee,tt);

          if ( triangle_node(1,tt) == a )
            ee = 3;
          elseif ( triangle_node(2,tt) == a )
            ee = 1;
          else
            ee = 2;
          end

        end

        triangle_neighbor(ee,tt) = l;

      end

      if ( 0 < r )

        if ( triangle_neighbor(1,r) == t )
          triangle_neighbor(1,r) = u;
        elseif ( triangle_neighbor(2,r) == t )
          triangle_neighbor(2,r) = u;
        else
          triangle_neighbor(3,r) = u;
        end

      else

        if ( t == btri & ep1 == bedg )
          btri = u;
          bedg = f;
        end

        l = - ( 3 * u + f - 1 );
        tt = u;
        ee = fm1;

        while ( 0 < triangle_neighbor(ee,tt) )

          tt = triangle_neighbor(ee,tt);

          if ( triangle_node(1,tt) == b )
            ee = 3;
          elseif ( triangle_node(2,tt) == b )
            ee = 1;
          else
            ee = 2;
          end

        end

        triangle_neighbor(ee,tt) = l;

      end

    end

  end

  return
end
