function [ t, dtdr, dtds ] = shape_t10 ( r, s )

%*****************************************************************************80
%
%% SHAPE_T10 evaluates shape functions for a 10 node reference triangle.
%
%  Reference Element T10:
%
%    |
%    1  10
%    |  |\
%    |  | \
%    |  8  9
%    |  |   \
%    S  |    \
%    |  5  6  7
%    |  |      \
%    |  |       \
%    0  1--2--3--4
%    |
%    +--0----R---1-->
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
%    Output, real T(10), the basis functions at the point.
%
%    Output, real DTDR(10), the R basis derivatives at the point.
%
%    Output, real DTDS(10), the S basis derivatives at the point.
%
  a = 1.0 / 3.0;
  b = 2.0 / 3.0;
  c = 1.0;

  t(1)  = 4.5 * ( a - r - s ) * ( b - r - s ) * ( c - r - s );
  t(2)  = 13.5 * r * ( b - r - s ) * ( c - r - s );
  t(3)  = - 13.5 * r * ( a - r ) * ( c - r - s );
  t(4)  = 4.5 * r * ( a - r ) * ( b - r );
  t(5)  = 13.5 * s * ( b - r - s ) * ( c - r - s );
  t(6)  = 27.0 * r * s * ( c - r - s );
  t(7)  = 13.5 * r * s * ( r - a );
  t(8)  = 13.5 * s * ( s - a ) * ( c - r - s );
  t(9)  = 13.5 * r * s * ( s - a );
  t(10) = 4.5 * s * ( a - s ) * ( b - s );

  dtdr(1) = 4.5 * ( ( a - s ) * ( 2.0 * r - c - b + 2.0 * s ) ...
    - ( s - b ) * ( s - c ) - 2.0 * ( 2.0 * s - b - c ) * r - 3.0 * r * r );
  dtdr(2) = 13.5 * ( ( s - b ) * ( s - c ) + 2.0 * ( 2.0 * s - b - c ) * r ...
    + 3.0 * r * r );
  dtdr(3) = - 13.5 * ( a * ( c - s ) + 2.0 * ( s - a - c ) * r + 3.0 * r * r );
  dtdr(4) = 4.5 * ( a * b - 2.0 * ( a + b ) * r + 3.0 * r * r );
  dtdr(5) = 13.5 * s * ( 2.0 * s - b - c + 2.0 * r );
  dtdr(6) = 27.0 * s * ( c - s - 2.0 * r );
  dtdr(7) = 13.5 * s * ( 2.0 * r - a );
  dtdr(8) = - 13.5 * s * ( s - a );
  dtdr(9) = 13.5 * s * ( s - a);
  dtdr(10) = 0.0;

  dtds(1) = 4.5 * ( ( a - r ) * ( 2.0 * s - c - b + 2.0 * r ) ...
    - ( r - b ) * ( r - c ) - 2.0 * ( 2.0 * r - b - c ) * s - 3.0 * s * s );
  dtds(2) = 13.5 * r * ( 2.0 * s + 2.0 * r - b - c );
  dtds(3) = 13.5 * r * ( a - r );
  dtds(4) = 0.0;
  dtds(5) = 13.5 * ( ( r - b ) * ( r - c ) + 2.0 * ( 2.0 * r - b - c ) * s ...
    + 3.0 * s * s );
  dtds(6) = 27.0 * r * ( c - r - 2.0 * s );
  dtds(7) = 13.5 * r * ( r - a );
  dtds(8) = - 13.5 * ( a * ( c - r ) + 2.0 * ( r - c - a ) * s + 3.0 * s * s );
  dtds(9) = 13.5 * r * ( 2.0 * s - a );
  dtds(10) = 4.5 * ( a * b - 2.0 * ( a + b ) * s + 3.0 * s * s );

  return
end
