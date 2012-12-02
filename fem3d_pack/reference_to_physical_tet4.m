function phy = reference_to_physical_tet4 ( t, n, ref )

%*****************************************************************************80
%
%% REFERENCE_TO_PHYSICAL_TET4 maps TET4 reference points to physical points.
%
%  Discussion:
%
%    Given the vertices of an order 4 physical tetrahedron and a point 
%    (R,S,T) in the reference tetrahedron, the routine computes the value 
%    of the corresponding image point (X,Y,Z) in physical space.
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
%    Input, real T(3,4), the coordinates of the vertices.  
%    The vertices are assumed to be the images of (1,0,0), (0,1,0),
%    (0,0,1) and (0,0,0) respectively.
%
%    Input, integer N, the number of points to transform.
%
%    Input, real REF(3,N), points in the reference element.
%
%    Output, real PHY(3,N), corresponding points in the
%    physical element.
%
  for i = 1 : 3
    phy(i,1:n) =                                                ...
        t(i,1) *         ref(1,1:n)                             ...
      + t(i,2) *                      ref(2,1:n)                ...
      + t(i,3) *                                   ref(3,1:n)   ...
      + t(i,4) * ( 1.0 - ref(1,1:n) - ref(2,1:n) - ref(3,1:n) );
  end

  return
end