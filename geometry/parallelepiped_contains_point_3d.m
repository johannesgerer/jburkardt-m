function value = parallelepiped_contains_point_3d ( p1, p2, p3, p4, p )

%*****************************************************************************80
%
%% PARALLELEPIPED_CONTAINS_POINT_3D determines if a point is inside a parallelepiped in 3D.
%
%  Discussion:
%
%    A parallelepiped is a "slanted box", that is, opposite
%    sides are parallel planes.
%
%  Diagram:
%
%               *------------------*
%              / .                / \
%             /   .              /   \
%            /     .            /     \
%          P4------------------*       \
%            \        .         \       \
%             \        .         \       \
%              \        .         \       \
%               \       P2.........\.......\
%                \     .            \     /
%                 \   .              \   /
%                  \ .                \ /
%                  P1-----------------P3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3,1), P2(3,1), P3(3,1), P4(3,1), four corners
%    of the parallelepiped.  It is assumed that P2, P3 and P4 are
%    immediate neighbors of P1.
%
%    Input, real P(3,1), the point to be checked.
%
%    Output, logical VALUE, is true if P is inside the parallelepiped.
%
  dim_num = 3;

  parallelepiped_contains_point_3d = 0;

  dot = ( p(1:dim_num,1) - p1(1:dim_num,1) )' * ( p2(1:dim_num,1) - p1(1:dim_num,1) );

  if ( dot < 0.0 )
    return
  end

  if ( sum ( ( p2(1:dim_num,1) - p1(1:dim_num,1) ).^2 ) < dot )
    return
  end

  dot = ( p(1:dim_num,1) - p1(1:dim_num,1) )' * ( p3(1:dim_num,1) - p1(1:dim_num,1) );

  if ( dot < 0.0 )
    return
  end

  if ( sum ( ( p3(1:dim_num,1) - p1(1:dim_num,1) ).^2 ) < dot )
    return
  end

  dot = ( p(1:dim_num,1) - p1(1:dim_num,1) )' * ( p4(1:dim_num,1) - p1(1:dim_num,1) );

  if ( dot < 0.0 )
    return
  end

  if ( sum ( ( p4(1:dim_num,1) - p1(1:dim_num,1) ).^2 ) < dot )
    return
  end

  parallelepiped_contains_point_3d = 1;

  return
end
