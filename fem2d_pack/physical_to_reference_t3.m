function ref = physical_to_reference_t3 ( t, n, phy )

%*****************************************************************************80
%
%% PHYSICAL_TO_REFERENCE_T3 maps a physical point to a reference point.
%
%  Discussion:
%
%    Given the vertices of an order 3 physical triangle and a point
%    (X,Y) in the physical triangle, the routine computes the value
%    of the corresponding image point (XSI,ETA) in reference space.
%
%    Note that this routine may also be appropriate for an order 6
%    triangle, if the mapping between reference and physical space
%    is linear.  This implies, in particular, that the sides of the
%    image triangle are straight and that the "midside" nodes in the
%    physical triangle are halfway along the sides of
%    the physical triangle.
%
%  Reference Element T3:
%
%    |
%    1  3
%    |  |\
%    |  | \
%    S  |  \
%    |  |   \
%    |  |    \
%    0  1-----2
%    |
%    +--0--R--1-->
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the X and Y coordinates
%    of the vertices.  The vertices are assumed to be the images of
%    (0,0), (1,0) and (0,1) respectively.
%
%    Input, integer N, the number of points to transform.
%
%    Input, real PHY(2,N), the coordinates of points in the physical space.
%
%    Output, real REF(2,N), the coordinates of the corresponding
%    points in the reference space.
%
  ref(1,1:n) = ( ( t(2,3) - t(2,1) ) * ( phy(1,1:n) - t(1,1) )   ...
               - ( t(1,3) - t(1,1) ) * ( phy(2,1:n) - t(2,1) ) ) ...
             / ( ( t(2,3) - t(2,1) ) * ( t(1,2)   - t(1,1) )   ...
               - ( t(1,3) - t(1,1) ) * ( t(2,2)   - t(2,1) ) );

  ref(2,1:n) = ( ( t(1,2) - t(1,1) ) * ( phy(2,1:n) - t(2,1) )   ...
               - ( t(2,2) - t(2,1) ) * ( phy(1,1:n) - t(1,1) ) ) ...
             / ( ( t(2,3) - t(2,1) ) * ( t(1,2)   - t(1,1) )   ...
               - ( t(1,3) - t(1,1) ) * ( t(2,2)   - t(2,1) ) );

  return
end
