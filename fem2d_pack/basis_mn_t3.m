function [ phi, dphidx, dphidy ] = basis_mn_t3 ( t, n, p )

%*****************************************************************************80
%
%% BASIS_MN_T3: all bases functions at N points for a T3 element.
%
%  Discussion:
%
%    The routine is given the coordinates of the vertices of a triangle.
%    It works directly with these coordinates, and does not refer to a 
%    reference element.
%
%    The sides of the triangle DO NOT have to lie along a coordinate
%    axis.
%
%    The routine evaluates the basis functions associated with each vertex,
%    and their derivatives with respect to X and Y.
%
%  Physical Element T3:
%
%            3
%           / \
%          /   \
%         /     \
%        /       \
%       1---------2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the vertices of the triangle.  It is common to list 
%    these points in counter clockwise order.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real P(2,N), the coordinates of the evaluation points.
%
%    Output, real PHI(3,N), the basis functions at the evaluation points.
%
%    Output, real DPHIDX(3,N), DPHIDY(3,N), the basis derivatives 
%    at the evaluation points.
%
%  Local parameters:
%
%    Local, real AREA, is (twice) the area of the triangle.
%
  area = t(1,1) * ( t(2,2) - t(2,3) ) ...
       + t(1,2) * ( t(2,3) - t(2,1) ) ...
       + t(1,3) * ( t(2,1) - t(2,2) );

  phi(1,1:n) =     (  ( t(1,3) - t(1,2) ) * ( p(2,1:n) - t(2,2) )     ...
                    - ( t(2,3) - t(2,2) ) * ( p(1,1:n) - t(1,2) ) );
  dphidx(1,1:n) =   - ( t(2,3) - t(2,2) );
  dphidy(1,1:n) =     ( t(1,3) - t(1,2) );

  phi(2,1:n) =     (  ( t(1,1) - t(1,3) ) * ( p(2,1:n) - t(2,3) )     ...
                    - ( t(2,1) - t(2,3) ) * ( p(1,1:n) - t(1,3) ) );
  dphidx(2,1:n) =   - ( t(2,1) - t(2,3) );
  dphidy(2,1:n) =     ( t(1,1) - t(1,3) );

  phi(3,1:n) =     (  ( t(1,2) - t(1,1) ) * ( p(2,1:n) - t(2,1) )     ...
                    - ( t(2,2) - t(2,1) ) * ( p(1,1:n) - t(1,1) ) );
  dphidx(3,1:n) =   - ( t(2,2) - t(2,1) );
  dphidy(3,1:n) =     ( t(1,2) - t(1,1) );
%
%  Normalize.
%
  phi(1:3,1:n)    = phi(1:3,1:n) / area;
  dphidx(1:3,1:n) = dphidx(1:3,1:n) / area;
  dphidy(1:3,1:n) = dphidy(1:3,1:n) / area;

  return
end
