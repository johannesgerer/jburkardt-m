function phy = reference_to_physical_t4 ( tetra, n, ref )

%*****************************************************************************80
%
%% REFERENCE_TO_PHYSICAL_T4 maps tetrahedron reference points to physical points.
%
%  Discussion:
%
%    Given the vertices of an order 4 physical tetrahedron and a point
%    (R,S,T) in the reference tetrahedron, the routine computes the value
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
%    31 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4), the coordinates of the vertices.
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
    phy(i,1:n) = tetra(i,1) * ( 1.0 - ref(1,1:n) - ref(2,1:n) - ref(3,1:n) ) ...
               + tetra(i,2) *       + ref(1,1:n)                             ...
               + tetra(i,3) *                    + ref(2,1:n)                ...
               + tetra(i,4) *                                 + ref(3,1:n);
  end

  return
end
