function [ v1, v2, v3, v4, v5 ] = pyramid_unit_vertices ( )

%*****************************************************************************80
%
%% PYRAMID_UNIT_VERTICES returns the vertices of the unit pyramid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real V1(3), V2(3), V3(3), V4(3), V5(3), the vertices.
%
  v1 = [  0.0,  0.0, +1.0 ]';
  v2 = [ -1.0, -1.0,  0.0 ]';
  v3 = [ +1.0, -1.0,  0.0 ]';
  v4 = [ +1.0, +1.0,  0.0 ]';
  v5 = [ -1.0, +1.0,  0.0 ]';

  return
end