function value = parallelogram_contains_point_2d ( p1, p2, p3, p )

%*****************************************************************************80
%
%% PARALLELOGRAM_CONTAINS_POINT_2D determines if a point is inside a parallelogram in 2D.
%
%  Discussion:
%
%       P2..............
%       /              .
%      /              .
%     /              .
%    P1----------->P3
%
%    The algorithm used here essentially computes the barycentric
%    coordinates of the point P, and accepts it if both coordinates
%    are between 0 and 1.  ( For a triangle, they must be positive,
%    and sum to no more than 1.)  The same trick works for a parallelepiped.
%
%    Thanks to Gernot Grabmair for pointing out that a previous
%    version of this routine was incorrect.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2,1), P2(2,1), P3(2,1), three corners of the
%    parallelogram, with P1 between P2 and P3.
%
%    Input, real P(2,1), the point to be checked.
%
%    Output, logical VALUE, is TRUE if P is inside
%    the parallelogram.
%
  dim_num = 2;
%
%  Set up the linear system
%
%    ( X2-X1  X3-X1 ) XSI(1)  = X-X1
%    ( Y2-Y1  Y3-Y1 ) XSI(2)    Y-Y1
%
%  which is satisfied by the barycentric coordinates of P.
%
  a(1,1) = p2(1,1) - p1(1,1);
  a(1,2) = p3(1,1) - p1(1,1);
  a(1,3) = p(1,1)  - p1(1,1);

  a(2,1) = p2(2,1) - p1(2,1);
  a(2,2) = p3(2,1) - p1(2,1);
  a(2,3) = p(2,1)  - p1(2,1);
%
%  Solve the linear system.
%
  [ a, info ] = r8mat_solve ( dim_num, 1, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PARALLELOGRAM_CONTAINS_CONTAIN_2D - Fatal error!\n' );
    fprintf ( 1, '  The linear system is singular.\n' );
    fprintf ( 1, '  The input data does not form a proper triangle.\n' );
    error ( 'PARALLELOGRAM_CONTAINS_POINT_2D - Error!' );
  end

  if ( a(1,3) < 0.0 | 1.0 < a(1,3) )
    value = 0;
  elseif ( a(2,3) < 0.0 | 1.0 < a(2,3) )
    value = 0;
  else
    value = 1;
  end

  return
end

