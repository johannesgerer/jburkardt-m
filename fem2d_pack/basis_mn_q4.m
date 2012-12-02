function [ phi, dphidx, dphidy ] = basis_mn_q4 ( q, n, p )

%*****************************************************************************80
%
%% BASIS_MN_Q4: all bases at N points for a Q4 element.
%
%  Discussion:
%
%    The routine is given the coordinates of the vertices of a quadrilateral.
%    It works directly with these coordinates, and does not refer to a 
%    reference element.
%
%    The sides of the element are presumed to lie along coordinate axes.
%
%    The routine evaluates the basis functions associated with each corner,
%    and their derivatives with respect to X and Y.
%
%  Physical Element Q4:
%
%    |
%    |  4-----3
%    |  |     |
%    |  |     |
%    Y  |     |
%    |  |     |
%    |  |     |
%    |  1-----2
%    |
%    +-----X------>
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real Q(2,4),  the coordinates of the vertices.
%    It is common to list these points in counter clockwise order.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real P(2,N), the evaluation points.
%
%    Output, real PHI(4,N), the basis functions at the evaluation points.
%
%    Output, real DPHIDX(4,N), DPHIDY(4,N), the value of the
%    X and Y derivatives of the basis functions at the evaluation points.
%
%  Local Parameter:
%
%    Local, real AREA, the area of the rectangle.
%

  area =        ( q(1,3)         - q(1,1) ) * ( q(2,3)         - q(2,1) );

  phi(1,1:n) =       ( q(1,3) - p(1,1:n)           ) ...
                  .* ( q(2,3) - p(2,1:n)           );
  phi(2,1:n) =       (          p(1,1:n)  - q(1,1) ) ...
                  .* ( q(2,3) - p(2,1:n)           );
  phi(3,1:n) =       (          p(1,1:n)  - q(1,1) ) ...
                  .* (          p(2,1:n)  - q(2,1) );
  phi(4,1:n) =       ( q(1,3) - p(1,1:n)           ) ...
                  .* (          p(2,1:n)  - q(2,1) );
    
  dphidx(1,1:n) = - ( q(2,3) - p(2,1:n)           );
  dphidx(2,1:n) =   ( q(2,3) - p(2,1:n)           );
  dphidx(3,1:n) =   (          p(2,1:n)  - q(2,1) );
  dphidx(4,1:n) = - (          p(2,1:n)  - q(2,1) );
 
  dphidy(1,1:n) = - ( q(1,3) - p(1,1:n)           );
  dphidy(2,1:n) = - (          p(1,1:n)  - q(1,1) );
  dphidy(3,1:n) =   (          p(1,1:n)  - q(1,1) );
  dphidy(4,1:n) =   ( q(1,3) - p(1,1:n)           );
%
%  Normalize.
%
  phi(1:4,1:n)    = phi(1:4,1:n)    / area;
  dphidx(1:4,1:n) = dphidx(1:4,1:n) / area;
  dphidy(1:4,1:n) = dphidy(1:4,1:n) / area;

  return
end
