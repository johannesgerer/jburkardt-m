function [ t, dtdr, dtds ] = shape_q4 ( r, s )

%*****************************************************************************80
%
%% SHAPE_Q4 evaluates shape functions for a 4 node reference quadrilateral.
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
%    14 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, S, the reference coordinates of a point.
%
%    Output, real T(4), the basis functions at the point.
%
%    Output, real DTDR(4), the R basis derivatives at the point.
%
%    Output, real DTDS(4), the S basis derivatives at the point.
%
  t(1) = ( 1.0 - r ) * ( 1.0 - s );
  t(2) =         r   * ( 1.0 - s );
  t(3) =         r   *         s;
  t(4) = ( 1.0 - r ) *         s;

  dtdr(1) = - 1.0 + s;
  dtdr(2) =   1.0 - s;
  dtdr(3) =         s;
  dtdr(4) =       - s;

  dtds(1) = - 1.0 + r;
  dtds(2) =       - r;
  dtds(3) =         r;
  dtds(4) =   1.0 - r;

  return
end
