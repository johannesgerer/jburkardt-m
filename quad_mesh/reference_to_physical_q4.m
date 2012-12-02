function xy = reference_to_physical_q4 ( q4, n, rs )

%*****************************************************************************80
%
%% REFERENCE_TO_PHYSICAL_Q4 maps Q4 reference points to physical points.
%
%  Discussion:
%
%    XY(R,S) = XY(0,0) * (1-R) * (1-S)
%            + XY(1,0) *    R  * (1-S)
%            + XY(1,1) *    R  *    S
%            + XY(0,1) * (1-R) *    S
%
%  Reference Element Q4:
%
%    |
%    1  4-----3
%    |  |     |
%    |  |     |
%    S  |     |
%    |  |     |
%    |  |     |
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
%    27 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real Q4(2,4), the coordinates of the vertices.
%    The vertices are assumed to be the images of the reference vertices
%    (0,0), (1,0), (1,1) and (0,1) respectively.
%
%    Input, integer N, the number of points to transform.
%
%    Input, real RS(2,N), (R,S) points in the reference element.
%
%    Output, real XY(2,N), (X,Y) points in the physical element.
%
  psi(1,1:n) = ( 1.0 - rs(1,1:n) ) .* ( 1.0 - rs(2,1:n) );
  psi(2,1:n) =         rs(1,1:n)   .* ( 1.0 - rs(2,1:n) );
  psi(3,1:n) =         rs(1,1:n)   .*         rs(2,1:n);
  psi(4,1:n) = ( 1.0 - rs(1,1:n) ) .*         rs(2,1:n);

  xy(1:2,1:n) = q4(1:2,1:4) * psi(1:4,1:n);

  return
end
