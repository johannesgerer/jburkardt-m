function ref = physical_to_reference_tet4 ( t, n, phy )

%*****************************************************************************80
%
%% PHYSICAL_TO_REFERENCE_TET4 maps physical points to reference points.
%
%  Discussion:
%
%    Given the vertices of an order 4 physical tetrahedron and a point 
%    (X,Y,Z) in the physical tetrahedron, the routine computes the value 
%    of the corresponding point (R,S,T) in the reference tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(3,4), the coordinates of the vertices of the
%    physical tetrahedron.  The vertices are assumed to be the images of
%    (1,0,0), (0,1,0), (0,0,1) and (0,0,0) respectively.
%
%    Input, integer N, the number of points to transform.
%
%    Input, real PHY(3,N), the coordinates of physical points
%    to be transformed.
%
%    Output, real REF(3,N), the coordinates of the corresponding
%    points in the reference tetrahedron.
%
  a(1:3,1:3) = t(1:3,1:3);
  for i = 1 : 3
    a(i,1:3) = a(i,1:3) - t(i,4);
  end

  for i = 1 : 3
    ref(i,1:n) = phy(i,1:n) - t(i,4);
  end

  ref(1:3,1:n) = a(1:3,1:3) \ ref(1:3,1:n);

  return
end