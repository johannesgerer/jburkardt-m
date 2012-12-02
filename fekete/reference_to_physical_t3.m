function phy = reference_to_physical_t3 ( t, n, ref )

%*****************************************************************************80
%
%% REFERENCE_TO_PHYSICAL_T3 maps a reference point to a physical point.
%
%  Discussion:
%
%    Given the vertices of an order 3 physical triangle and a point
%    (XSI,ETA) in the reference triangle, the routine computes the value
%    of the corresponding image point (X,Y) in physical space.
%
%    Note that this routine may also be appropriate for an order 6
%    triangle, if the mapping between reference and physical space
%    is linear.  This implies, in particular, that the sides of the
%    image triangle are straight and that the "midside" nodes in the
%    physical triangle are literally halfway along the sides of
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
%    24 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the coordinates of the vertices.  The vertices are assumed 
%    to be the images of (0,0), (1,0) and (0,1) respectively.
%
%    Input, integer N, the number of objects to transform.
%
%    Input, real REF(2,N), the coordinates of points in the reference space.
%
%    Output, real PHY(2,N), the coordinates of the corresponding points in the 
%    physical space.
%
  for i = 1 : 2

    phy(i,1:n) = t(i,1) * ( 1.0 - ref(1,1:n) - ref(2,1:n) ) ...
               + t(i,2) *        ref(1,1:n)                ...
               + t(i,3) *                     ref(2,1:n);
  end

  return
end
