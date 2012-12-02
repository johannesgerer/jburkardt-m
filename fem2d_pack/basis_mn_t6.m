function [ phi, dphidx, dphidy ] = basis_mn_t6 ( t, n, p )

%*****************************************************************************80
%
%% BASIS_MN_T6: all bases for N points in a T6 element.
%
%  Discussion:
%
%    The routine is given the coordinates of the vertices and midside
%    nodes of a triangle.  It works directly with these coordinates, and does 
%    not refer to a reference element.
%
%    This routine requires that the midside nodes be "in line"
%    with the vertices, that is, that the sides of the triangle be
%    straight.  However, the midside nodes do not actually have to
%    be halfway along the side of the triangle.  
%
%  Physical element T6:
%
%    This picture indicates the assumed ordering of the six nodes
%    of the triangle.
%
%             3
%            / \
%           /   \
%          6     5
%         /       \
%        /         \
%       1-----4-----2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,6), the nodal oordinates of the element.
%    It is common to list these points in counter clockwise order.
%
%    Input, real P(2,N), the evaluation points.
%
%    Output, real PHI(6,N), the basis functions at the evaluation points.
%
%    Output, real DPHIDX(6,N), DPHIDY(6,N), the basis derivatives at the 
%    evaluation points.
%
%  Local Parameters:
%
%    Local, real AREA, is (twice) the area of the triangle.
%

%
%  Basis function 1: PHI(X,Y) = G(3,2) * H(6,4) / normalization.
%
  gx(1:n) = ( p(1,1:n) - t(1,2) ) * ( t(2,3)   - t(2,2) ) ...
          - ( t(1,3)   - t(1,2) ) * ( p(2,1:n) - t(2,2) );

  gn(1:n) = ( t(1,1) - t(1,2) ) * ( t(2,3) - t(2,2) ) ...
          - ( t(1,3) - t(1,2) ) * ( t(2,1) - t(2,2) );

  hx(1:n) = ( p(1,1:n) - t(1,4) ) * ( t(2,6)   - t(2,4) ) ...
          - ( t(1,6)   - t(1,4) ) * ( p(2,1:n) - t(2,4) );

  hn(1:n) = ( t(1,1) - t(1,4) ) * ( t(2,6) - t(2,4) ) ...
          - ( t(1,6) - t(1,4) ) * ( t(2,1) - t(2,4) );

  phi(1,1:n) = ( gx(1:n) .* hx(1:n) ) ./ ( gn(1:n) .* hn(1:n) );

  dphidx(1,1:n) =  ( ( t(2,3) - t(2,2) ) * hx(1:n) ...
                    + gx(1:n) * ( t(2,6) - t(2,4) ) ) ...
                  ./ ( gn(1:n) .* hn(1:n) );

  dphidy(1,1:n) = -( ( t(1,3) - t(1,2) ) * hx(1:n) ...
                   + gx * ( t(1,6) - t(1,4) ) ) ...
                  ./ ( gn(1:n) .* hn(1:n) );
%
%  Basis function 2: PHI(X,Y) = G(3,1) * H(4,5) / normalization.
%
  gx(1:n) = ( p(1,1:n) - t(1,1) ) * ( t(2,3)   - t(2,1) ) ...
          - ( t(1,3)   - t(1,1) ) * ( p(2,1:n) - t(2,1) );

  gn(1:n) = ( t(1,2) - t(1,1) ) * ( t(2,3) - t(2,1) ) ...
          - ( t(1,3) - t(1,1) ) * ( t(2,2) - t(2,1) );

  hx(1:n) = ( p(1,1:n) - t(1,5) ) * ( t(2,4)   - t(2,5) ) ...
          - ( t(1,4)   - t(1,5) ) * ( p(2,1:n) - t(2,5) );

  hn(1:n) = ( t(1,2) - t(1,5) ) * ( t(2,4) - t(2,5) ) ...
          - ( t(1,4) - t(1,5) ) * ( t(2,2) - t(2,5) );

  phi(2,1:n) = ( gx(1:n) .* hx(1:n) ) ./ ( gn(1:n) .* hn(1:n) );

  dphidx(2,1:n) =  ( ( t(2,3) - t(2,1) ) * hx(1:n) ...
              + gx(1:n) * ( t(2,4) - t(2,5) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );

  dphidy(2,1:n) = -( ( t(1,3) - t(1,1) ) * hx(1:n) ...
              + gx(1:n) * ( t(1,4) - t(1,5) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );
%
%  Basis function 3: PHI(X,Y) = G(1,2) * H(5,6) / normalization.
%
  gx(1:n) = ( p(1,1:n) - t(1,2) ) * ( t(2,1)   - t(2,2) ) ...
          - ( t(1,1)   - t(1,2) ) * ( p(2,1:n) - t(2,2) );

  gn(1:n) = ( t(1,3) - t(1,2) ) * ( t(2,1) - t(2,2) ) ...
          - ( t(1,1) - t(1,2) ) * ( t(2,3) - t(2,2) );

  hx(1:n) = ( p(1,1:n) - t(1,6) ) * ( t(2,5)   - t(2,6) ) ...
          - ( t(1,5)   - t(1,6) ) * ( p(2,1:n) - t(2,6) );

  hn(1:n) = ( t(1,3) - t(1,6) ) * ( t(2,5) - t(2,6) ) ...
          - ( t(1,5) - t(1,6) ) * ( t(2,3) - t(2,6) );

  phi(3,1:n) = ( gx(1:n) .* hx(1:n) ) ./ ( gn(1:n) .* hn(1:n) );

  dphidx(3,1:n) =  ( ( t(2,1) - t(2,2) ) * hx(1:n) ...
              + gx(1:n) * ( t(2,5) - t(2,6) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );

  dphidy(3,1:n) = -( ( t(1,1) - t(1,2) ) * hx(1:n) ...
              + gx(1:n) * ( t(1,5) - t(1,6) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );
%
%  Basis function 4: PHI(X,Y) = G(1,3) * H(2,3) / normalization.
%
  gx(1:n) = ( p(1,1:n) - t(1,3) ) * ( t(2,1)   - t(2,3) ) ...
          - ( t(1,1)   - t(1,3) ) * ( p(2,1:n) - t(2,3) );

  gn(1:n) = ( t(1,4) - t(1,3) ) * ( t(2,1) - t(2,3) ) ...
          - ( t(1,1) - t(1,3) ) * ( t(2,4) - t(2,3) );

  hx(1:n) = ( p(1,1:n) - t(1,3) ) * ( t(2,2)   - t(2,3) ) ...
          - ( t(1,2)   - t(1,3) ) * ( p(2,1:n) - t(2,3) );

  hn(1:n) = ( t(1,4) - t(1,3) ) * ( t(2,2) - t(2,3) ) ...
          - ( t(1,2) - t(1,3) ) * ( t(2,4) - t(2,3) );

  phi(4,1:n) = ( gx(1:n) .* hx(1:n) ) ./ ( gn(1:n) .* hn(1:n) );

  dphidx(4,1:n) =  ( ( t(2,1) - t(2,3) ) * hx(1:n) ...
              + gx(1:n) * ( t(2,2) - t(2,3) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );

  dphidy(4,1:n) = -( ( t(1,1) - t(1,3) ) * hx(1:n) ...
              + gx(1:n) * ( t(1,2) - t(1,3) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );
%
%  Basis function 5: PHI(X,Y) = G(2,1) * H(3,1) / normalization.
%
  gx(1:n) = ( p(1,1:n) - t(1,1) ) * ( t(2,2)   - t(2,1) ) ...
          - ( t(1,2)   - t(1,1) ) * ( p(2,1:n) - t(2,1) );;

  gn(1:n) = ( t(1,5) - t(1,1) ) * ( t(2,2) - t(2,1) ) ...
          - ( t(1,2) - t(1,1) ) * ( t(2,5) - t(2,1) );

  hx(1:n) = ( p(1,1:n) - t(1,1) ) * ( t(2,3)   - t(2,1) ) ...
          - ( t(1,3)   - t(1,1) ) * ( p(2,1:n) - t(2,1) );

  hn(1:n) = ( t(1,5) - t(1,1) ) * ( t(2,3) - t(2,1) ) ...
          - ( t(1,3) - t(1,1) ) * ( t(2,5) - t(2,1) );

  phi(5,1:n) = ( gx(1:n) .* hx(1:n) ) ./ ( gn(1:n) .* hn(1:n) );

  dphidx(5,1:n) =  ( ( t(2,2) - t(2,1) ) * hx(1:n) ...
              + gx(1:n) * ( t(2,3) - t(2,1) ) ) ...
               ./ ( gn(1:n) .* hn(1:n) );

  dphidy(5,1:n) = -( ( t(1,2) - t(1,1) ) * hx(1:n) ...
              + gx(1:n) * ( t(1,3) - t(1,1) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );
%
%  Basis function 6: PHI(X,Y) = G(1,2) * H(3,2) / normalization.
%
  gx(1:n) = ( p(1,1:n) - t(1,2) ) * ( t(2,1)   - t(2,2) ) ...
          - ( t(1,1)   - t(1,2) ) * ( p(2,1:n) - t(2,2) );

  gn(1:n) = ( t(1,6) - t(1,2) ) * ( t(2,1) - t(2,2) ) ...
          - ( t(1,1) - t(1,2) ) * ( t(2,6) - t(2,2) );

  hx(1:n) = ( p(1,1:n) - t(1,2) ) * ( t(2,3)   - t(2,2) ) ...
          - ( t(1,3)   - t(1,2) ) * ( p(2,1:n) - t(2,2) );

  hn(1:n) = ( t(1,6) - t(1,2) ) * ( t(2,3) - t(2,2) ) ...
          - ( t(1,3) - t(1,2) ) * ( t(2,6) - t(2,2) );

  phi(6,1:n) = ( gx(1:n) .* hx(1:n) ) ./ ( gn(1:n) .* hn(1:n) );

  dphidx(6,1:n) =  ( ( t(2,1) - t(2,2) ) * hx(1:n) ...
              + gx(1:n) * ( t(2,3) - t(2,2) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );

  dphidy(6,1:n) = -( ( t(1,1) - t(1,2) ) * hx(1:n) ...
              + gx(1:n) * ( t(1,3) - t(1,2) ) ) ...
              ./ ( gn(1:n) .* hn(1:n) );

  return
end
