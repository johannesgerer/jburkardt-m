function ref = tetrahedron_order4_physical_to_reference ( t, n, phy )

%*****************************************************************************80
%
%% TETRAHEDRON_ORDER4_PHYSICAL_TO_REFERENCE maps physical points to reference points.
%
%  Discussion:
%
%    Given the vertices of an order 4 physical tetrahedron and a point
%    (X,Y,Z) in the physical tetrahedron, the routine computes the value
%    of the corresponding image point (R,S,T) in reference space.
%
%    This routine may be appropriate for an order 10 tetrahedron,
%    if the mapping between reference and physical space is linear.
%    This implies, in particular, that the edges of the image tetrahedron
%    are straight, the faces are flat, and the "midside" nodes in the
%    physical tetrahedron are halfway along the sides of the physical
%    tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(3,4), the X, Y,Z coordinates
%    of the vertices.  The vertices are assumed to be the images of
%    (0,0,0), (1,0,0), (0,1,0) and (0,0,1) respectively.
%
%    Input, integer N, the number of points to transform.
%
%    Input, real PHY(3,N), the coordinates of physical points
%    to be transformed.
%
%    Output, real REF(3,N), the coordinates of the corresponding
%    points in the reference space.
%

%
%  Set up the matrix.
%
  a(1:3,1) = t(1:3,2) - t(1:3,1);
  a(1:3,2) = t(1:3,3) - t(1:3,1);
  a(1:3,3) = t(1:3,4) - t(1:3,1);
%
%  Compute the determinant.
%
  det =  a(1,1) * ( a(2,2) * a(3,3) - a(2,3) * a(3,2) ) ...
       + a(1,2) * ( a(2,3) * a(3,1) - a(2,1) * a(3,3) ) ...
       + a(1,3) * ( a(2,1) * a(3,2) - a(2,2) * a(3,1) );
%
%  If the determinant is zero, bail out.
%
  if ( det == 0.0 )
    ref(1:3,1:n) = 0.0;
    return
  end
%
%  Compute the solution.
%
  ref(1,1:n) = ...
    (   ( a(2,2) * a(3,3) - a(2,3) * a(3,2) ) * ( phy(1,1:n) - t(1,1) ) ...
      - ( a(1,2) * a(3,3) - a(1,3) * a(3,2) ) * ( phy(2,1:n) - t(2,1) ) ...
      + ( a(1,2) * a(2,3) - a(1,3) * a(2,2) ) * ( phy(3,1:n) - t(3,1) ) ...
    ) / det;

  ref(2,1:n) = ...
    ( - ( a(2,1) * a(3,3) - a(2,3) * a(3,1) ) * ( phy(1,1:n) - t(1,1) ) ...
      + ( a(1,1) * a(3,3) - a(1,3) * a(3,1) ) * ( phy(2,1:n) - t(2,1) ) ...
      - ( a(1,1) * a(2,3) - a(1,3) * a(2,1) ) * ( phy(3,1:n) - t(3,1) ) ...
    ) / det;

  ref(3,1:n) = ...
    (   ( a(2,1) * a(3,2) - a(2,2) * a(3,1) ) * ( phy(1,1:n) - t(1,1) ) ...
      - ( a(1,1) * a(3,2) - a(1,2) * a(3,1) ) * ( phy(2,1:n) - t(2,1) ) ...
      + ( a(1,1) * a(2,2) - a(1,2) * a(2,1) ) * ( phy(3,1:n) - t(3,1) ) ...
    ) / det;

  return
end
