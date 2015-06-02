function [ a, b, c, d, e, f ] = xy_to_rs_map ( t )

%*****************************************************************************80
%
%% XY_TO_RS_MAP returns the linear map from physical to reference triangle.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/xy_to_rs_map.m
%
%  Discussion:
%
%    Given the vertices T of an arbitrary triangle in the (X,Y) coordinate
%    system, this function returns the coefficients of the linear map
%    that sends the vertices of T to (0,0), (1,0) and (0,1) respectively
%    in the reference triangle with coordinates (R,S):
%
%      R = A + B * X + C * Y;
%      S = D + E * X + F * Y.
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
%    16 April 2015
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
%    Output, real A, B, C, D, E, F, the mapping coefficients.
%
  g =   ( ( t(2,3) - t(2,1) ) * ( t(1,2) - t(1,1) )   ...
        - ( t(1,3) - t(1,1) ) * ( t(2,2) - t(2,1) ) );

  a = ( - ( t(2,3) - t(2,1) ) * t(1,1)   ...
        + ( t(1,3) - t(1,1) ) * t(2,1) ) / g;

  b =     ( t(2,3) - t(2,1) ) / g;

  c =   - ( t(1,3) - t(1,1) ) / g;

  d = (   ( t(2,2) - t(2,1) ) * t(1,1) ...
        - ( t(1,2) - t(1,1) ) * t(2,1) ) / g;

  e =   - ( t(2,2) - t(2,1) ) / g;

  f =     ( t(1,2) - t(1,1) ) / g;

  return
end
