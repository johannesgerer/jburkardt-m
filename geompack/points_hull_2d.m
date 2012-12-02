function [ hull_num, hull ] = points_hull_2d ( node_num, node_xy )

%*****************************************************************************80
%
%% POINTS_HULL_2D computes the convex hull of a set of points in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Output, integer HULL_NUM, the number of nodes that lie on the convex hull.
%
%    Output, integer HULL(HULL_NUM).  The first HULL_NUM entries contain
%    the indices of the nodes that form the convex hull, in order.
%    These indices are 1-based, not 0-based!
%
  dim_num = 2;

  if ( node_num < 1 )
    hull_num = 0;
    return
  end
%
%  If NODE_NUM = 1, the hull is the point.
%
  if ( node_num == 1 )
    hull_num = 1;
    hull(1) = 1;
    return
  end
%
%  If NODE_NUM = 2, then the convex hull is either the two distinct points,
%  or possibly a single (repeated) point.
%
  if ( node_num == 2 )

    if ( any ( node_xy(1:dim_num,1) ~= node_xy(1:dim_num,2) ) )
      hull_num = 2;
      hull(1) = 1;
      hull(2) = 2;
    else
      hull_num = 1;
      hull(1) = 1;
    end

    return

  end
%
%  Find the leftmost point and call it Q.
%  In case of ties, take the bottom-most.
%
  q = 1;
  for i = 2 : node_num
    if ( node_xy(1,i) < node_xy(1,q) | ...
       ( node_xy(1,i) == node_xy(1,q) & node_xy(2,i) < node_xy(2,q) ) )
      q = i;
    end
  end

  q_xy(1:2) = node_xy(1:2,q);
%
%  Remember the starting point.
%
  first = q;
  hull_num = 1;
  hull(1) = q;
%
%  For the first point, make a fictitious previous point, 1 unit south,
%  and call it "P".
%
  p_xy(1) = q_xy(1);
  p_xy(2) = q_xy(2) - 1.0;
%
%  Now, having old point P, and current point Q, find the new point R
%  so the angle PQR is maximal.
%
%  Watch out for the possibility that the two nodes are identical.
%
  while ( 1 )

    r = 0;
    angle_max = 0.0;

    for i = 1 : node_num

      if ( i ~= q & ...
           ( node_xy(1,i) ~= q_xy(1) | node_xy(2,i) ~= q_xy(2) ) )

        angle = angle_rad_2d ( p_xy, q_xy, node_xy(1:2,i) );

        if ( r == 0 | angle_max < angle )

          r = i;
          r_xy(1:2) = node_xy(1:2,r);
          angle_max = angle;
%
%  In case of ties, choose the nearer point.
%
        elseif ( r ~= 0 & angle == angle_max )

          di = ( node_xy(1,i) - q_xy(1) )^2 + ( node_xy(2,i) - q_xy(2) )^2;
          dr = ( r_xy(1)      - q_xy(1) )^2 + ( r_xy(2)      - q_xy(2) )^2;

          if ( di < dr )
            r = i;
            r_xy(1:2) = node_xy(1:2,r);
            angle_max = angle;
          end

        end

      end

    end
%
%  If we've returned to our starting point, exit.
%
    if ( r == first )
      break
    end

    hull_num = hull_num + 1;

    if ( node_num < hull_num )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'POINTS_HULL_2D - Fatal error!\n' );
      fprintf ( 1, '  The algorithm failed.\n' );
      error ( 'POINTS_HULL_2D - Fatal error!' );
    end
%
%  Add point R to the convex hull.
%
    hull(hull_num) = r;
%
%  Set Q := P, P := R, and repeat.
%
    q = r;

    p_xy(1:2) = q_xy(1:2);
    q_xy(1:2) = r_xy(1:2);

  end

  return
end
