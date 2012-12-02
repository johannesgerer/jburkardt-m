function [ t, dtdr, dtds ] = shape_t4 ( r, s )

%*****************************************************************************80
%
%% SHAPE_T4 evaluates shape functions for a 4 node reference triangle.
%
%  Reference Element T4:
%
%    |
%    1  3
%    |  |\
%    |  | \
%    S  |  \
%    |  | 4 \
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
%    13 February 2006
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
  t(1) = ( 1.0 - 9.0 * r * s ) * ( 1.0 - r - s );
  t(2) = r * ( 1.0 - 9.0 * ( 1.0 - r - s ) * s );
  t(3) = s * ( 1.0 - 9.0 * ( 1.0 - r - s ) * r );
  t(4) = 27.0 * ( 1.0 - r - s ) * r * s;

  dtdr(1) = -1.0 +  9.0 * ( - s + 2.0 * r * s + s * s );
  dtdr(2) =  1.0 +  9.0 * ( - s + 2.0 * r * s + s * s );
  dtdr(3) =         9.0 * ( - s + 2.0 * r * s + s * s );
  dtdr(4) =      - 27.0 * ( - s + 2.0 * r * s + s * s );

  dtds(1) = -1.0 +  9.0 * ( - r + r * r + 2.0 * r * s );
  dtds(2) =         9.0 * ( - r + r * r + 2.0 * r * s );
  dtds(3) =  1.0 +  9.0 * ( - r + r * r + 2.0 * r * s );
  dtds(4) =      - 27.0 * ( - r + r * r + 2.0 * r * s );

  return
end
