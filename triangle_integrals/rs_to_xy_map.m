function [ a, b, c, d, e, f ] = rs_to_xy_map ( t )

%*****************************************************************************80
%
%% RS_TO_XY_MAP returns the linear map from reference to physical triangle.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_poly_integral/rs_to_xy_map.m
%
%  Discussion:
%
%    This function returns the coefficients of the linear map that sends
%    the vertices of the reference triangle, (0,0), (1,0) and (0,1), to
%    the vertices of a physical triangle T, of the form:
%
%      X = A + B * R + C * S;
%      Y = D + E * R + F * S.
%
%  Reference Element:
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
%    18 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the coordinates of the vertices.  The vertices are 
%    assumed to be the images of (0,0), (1,0) and (0,1) respectively.
%
%    Output, real A, B, C, D, E, F, the mapping coefficients.
%
  a = t(1,1);
  b = t(1,2) - t(1,1);
  c = t(1,3) - t(1,1);

  d = t(2,1);
  e = t(2,2) - t(2,1);
  f = t(2,3) - t(2,1);

  return
end

