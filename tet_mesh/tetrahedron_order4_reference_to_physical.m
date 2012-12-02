function phy = tetrahedron_order4_reference_to_physical ( t, n, ref )

%*****************************************************************************80
%
%% TETRAHEDRON_ORDER4_REFERENCE_TO_PHYSICAL maps T4 reference points to physical points.
%
%  Discussion:
%
%    Given the vertices of an order 4 physical tetrahedron and a point
%    (R,S,T) in the reference triangle, the routine computes the value
%    of the corresponding image point (X,Y,Z) in physical space.
%
%    This routine will also be correct for an order 10 tetrahedron,
%    if the mapping between reference and physical space
%    is linear.  This implies, in particular, that the sides of the
%    image tetrahedron are straight, the faces are flat, and
%    the "midside" nodes in the physical tetrahedron are
%    halfway along the edges of the physical tetrahedron.
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
%    Input, real T(3,4), the coordinates of the vertices.
%    The vertices are assumed to be the images of (0,0,0), (1,0,0),
%    (0,1,0) and (0,0,1) respectively.
%
%    Input, integer N, the number of points to transform.
%
%    Input, real REF(3,N), points in the reference tetrahedron.
%
%    Output, real PHY(3,N), corresponding points in the
%    physical tetrahedron.
%
  for i = 1 : 3
    phy(i,1:n) = t(i,1) * ( 1.0 - ref(1,1:n) - ref(2,1:n) - ref(3,1:n) ) ...
               + t(i,2) *       + ref(1,1:n)                             ...
               + t(i,3) *                    + ref(2,1:n)                ...
               + t(i,4) *                                 + ref(3,1:n);
  end

  return
end
