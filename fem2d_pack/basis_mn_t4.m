function [ phi, dphidx, dphidy ] = basis_mn_t4 ( t, n, p )

%*****************************************************************************80
%
%% BASIS_MN_T4: all bases at N points for a T4 element.
%
%  Discussion:
%
%    The T4 element is the cubic bubble triangle.
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
%  Physical Element T4: 
%        
%            3
%           / \
%          /   \
%         /  4  \
%        /       \
%       1---------2
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
%    Input, real T(2,4), the coordinates of the vertices
%    of the triangle, and the coordinates of the centroid.  
%    It is common to list the first three points in counter clockwise
%    order.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real P(2,N), the points where the basis functions 
%    are to be evaluated.
%
%    Output, real PHI(4,N), the value of the basis functions 
%    at the evaluation points.
%
%    Output, real DPHIDX(4,N), DPHIDY(4,N), the value of the 
%    derivatives at the evaluation points.
%
%  Local parameters:
%
%    Local, real AREA, is (twice) the area of the triangle.
%
  area = t(1,1) * ( t(2,2) - t(2,3) ) ...
       + t(1,2) * ( t(2,3) - t(2,1) ) ...
       + t(1,3) * ( t(2,1) - t(2,2) );

  phi(1,1:n) =     (   ( t(1,3) - t(1,2) ) * ( p(2,1:n) - t(2,2) )     ...
                     - ( t(2,3) - t(2,2) ) * ( p(1,1:n) - t(1,2) ) );
  dphidx(1,1:n) =    - ( t(2,3) - t(2,2) );
  dphidy(1,1:n) =      ( t(1,3) - t(1,2) );

  phi(2,1:n) =     (   ( t(1,1) - t(1,3) ) * ( p(2,1:n) - t(2,3) )     ...
                     - ( t(2,1) - t(2,3) ) * ( p(1,1:n) - t(1,3) ) );
  dphidx(2,1:n) =    - ( t(2,1) - t(2,3) );
  dphidy(2,1:n) =      ( t(1,1) - t(1,3) );

  phi(3,1:n) =     (   ( t(1,2) - t(1,1) ) * ( p(2,1:n) - t(2,1) )     ...
                     - ( t(2,2) - t(2,1) ) * ( p(1,1:n) - t(1,1) ) );
  dphidx(3,1:n) =    - ( t(2,2) - t(2,1) );
  dphidy(3,1:n) =      ( t(1,2) - t(1,1) );
%
%  Normalize the first three functions.
%
  phi(1:3,1:n)    =    phi(1:3,1:n) / area;
  dphidx(1:3,1:n) = dphidx(1:3,1:n) / area;
  dphidy(1:3,1:n) = dphidy(1:3,1:n) / area;
%
%  Compute the cubic bubble function.
%
  phi(4,1:n) = 27.0 * phi(1,1:n) .* phi(2,1:n) .* phi(3,1:n);

  dphidx(4,1:n) = 27.0 * ( ...
                dphidx(1,1:n) .*    phi(2,1:n) .*    phi(3,1:n) ...
                +  phi(1,1:n) .* dphidx(2,1:n) .*    phi(3,1:n) ...
                +  phi(1,1:n) .*    phi(2,1:n) .* dphidx(3,1:n) );

  dphidy(4,1:n) = 27.0 * ( ...
                dphidy(1,1:n) .*    phi(2,1:n) .*    phi(3,1:n) ...
                +  phi(1,1:n) .* dphidy(2,1:n) .*    phi(3,1:n) ...
                +  phi(1,1:n) .*    phi(2,1:n) .* dphidy(3,1:n) );
%
%  Subtract 1/3 of the cubic bubble function from each of the three linears.
%
  for i = 1 : 3
    phi(i,1:n)    =    phi(i,1:n) -    phi(4,1:n) / 3.0;
    dphidx(i,1:n) = dphidx(i,1:n) - dphidx(4,1:n) / 3.0;
    dphidy(i,1:n) = dphidy(i,1:n) - dphidy(4,1:n) / 3.0;
  end

  return
end
