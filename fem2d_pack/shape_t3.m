function [ t, dtdr, dtds ] = shape_t3 ( r, s, t, dtdr, dtds )

%*****************************************************************************80
%
%% SHAPE_T3 evaluates shape functions for a 3 node reference triangle.
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
%    Output, real T(3), the basis functions at the point.
%
%    Output, real DTDR(3), the R basis derivatives at the point.
%
%    Output, real DTDS(3), the S basis derivatives at the point.
%
  t(1) = 1.0 - r - s;
  t(2) =       r;
  t(3) =           s;

  dtdr(1) = -1.0;
  dtdr(2) =  1.0;
  dtdr(3) =  0.0;

  dtds(1) = -1.0;
  dtds(2) =  0.0;
  dtds(3) =  1.0;

  return
end
