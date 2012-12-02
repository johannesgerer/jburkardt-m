function [ t, dtdr, dtds ] = shape_t6 ( r, s )

%*****************************************************************************80
%
%% SHAPE_T6 evaluates shape functions for a 6 node reference triangle.
%
%  Reference Element T6:
%
%    |
%    1  3
%    |  |\
%    |  | \
%    S  6  5
%    |  |   \
%    |  |    \
%    0  1--4--2
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
%    Output, real T(6), the basis functions at the point.
%
%    Output, real DTDR(6), the R basis derivatives at the point.
%
%    Output, real DTDS(6), the S basis derivatives at the point.
%
  t(1) = 2.0 *     ( 1.0 - r - s ) * ( 0.5 - r - s );
  t(2) = 2.0 * r * ( r - 0.5 );
  t(3) = 2.0 * s * ( s - 0.5 );
  t(4) = 4.0 * r * ( 1.0 - r - s );
  t(5) = 4.0 * r * s;
  t(6) = 4.0 * s * ( 1.0 - r - s );

  dtdr(1) = - 3.0 + 4.0 * r + 4.0 * s;
  dtdr(2) = - 1.0 + 4.0 * r;
  dtdr(3) =   0.0;
  dtdr(4) =   4.0 - 8.0 * r - 4.0 * s;
  dtdr(5) =                   4.0 * s;
  dtdr(6) =                 - 4.0 * s;

  dtds(1) = - 3.0 + 4.0 * r + 4.0 * s;
  dtds(2) =   0.0;
  dtds(3) = - 1.0           + 4.0 * s;
  dtds(4) =       - 4.0 * r;
  dtds(5) =         4.0 * r;
  dtds(6) =   4.0 - 4.0 * r - 8.0 * s;

  return
end
