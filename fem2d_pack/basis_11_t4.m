function [ phi, dphidx, dphidy ] = basis_11_t4 ( t, i, p )

%*****************************************************************************80
%
%% BASIS_11_T4: one basis at one point for a T4 element.
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
%    12 March 2009
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
%    Input, integer I, the index of the basis function.
%
%    Input, real P(2), the points where the basis function
%    is to be evaluated.
%
%    Output, real PHI, the value of the basis function
%    at the evaluation point.
%
%    Output, real DPHIDX, DPHIDY, the value of the
%    derivatives at the evaluation point.
%
%  Local parameters:
%
%    Local, real AREA, is (twice) the area of the triangle.
%
  area = t(1,1) * ( t(2,2) - t(2,3) ) ...
       + t(1,2) * ( t(2,3) - t(2,1) ) ...
       + t(1,3) * ( t(2,1) - t(2,2) );

  psi(1) =     (   ( t(1,3) - t(1,2) ) * ( p(2) - t(2,2) )     ...
                 - ( t(2,3) - t(2,2) ) * ( p(1) - t(1,2) ) );
  dpsidx(1) =    - ( t(2,3) - t(2,2) );
  dpsidy(1) =      ( t(1,3) - t(1,2) );

  psi(2) =     (   ( t(1,1) - t(1,3) ) * ( p(2) - t(2,3) )     ...
                 - ( t(2,1) - t(2,3) ) * ( p(1) - t(1,3) ) );
  dpsidx(2) =    - ( t(2,1) - t(2,3) );
  dpsidy(2) =      ( t(1,1) - t(1,3) );

  psi(3) =     (   ( t(1,2) - t(1,1) ) * ( p(2) - t(2,1) )     ...
                 - ( t(2,2) - t(2,1) ) * ( p(1) - t(1,1) ) );
  dpsidx(3) =    - ( t(2,2) - t(2,1) );
  dpsidy(3) =      ( t(1,2) - t(1,1) );
%
%  Normalize the first three functions.
%
  psi(1:3)    =    psi(1:3) / area;
  dpsidx(1:3) = dpsidx(1:3) / area;
  dpsidy(1:3) = dpsidy(1:3) / area;
%
%  Compute the cubic bubble function.
%
  psi(4) = 27.0D+00 * psi(1) * psi(2) * psi(3);

  dpsidx(4) = 27.0D+00 * ( ...
                dpsidx(1) *    psi(2) *    psi(3) ...
                +  psi(1) * dpsidx(2) *    psi(3) ...
                +  psi(1) *    psi(2) * dpsidx(3) );

  dpsidy(4) = 27.0D+00 * ( ...
                dpsidy(1) *    psi(2) *    psi(3) ...
                +  psi(1) * dpsidy(2) *    psi(3) ...
                +  psi(1) *    psi(2) * dpsidy(3) );
%
%  Subtract 1/3 of the cubic bubble function from each of the three linears.
%
  for j = 1 : 3
    psi(j)    =    psi(j) -    psi(4) / 3.0;
    dpsidx(j) = dpsidx(j) - dpsidx(4) / 3.0;
    dpsidy(j) = dpsidy(j) - dpsidy(4) / 3.0;
  end

  phi    = psi(i);
  dphidx = dpsidx(i);
  dphidy = dpsidy(i);

  return
end
