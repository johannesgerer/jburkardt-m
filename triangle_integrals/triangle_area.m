function area = triangle_area ( t )

%*****************************************************************************80
%
%% TRIANGLE_AREA returns the area of a triangle.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/triangle_area.m
%
%  Discussion:
%
%    If the vertices are given in counter clockwise order, the area
%    will be positive.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    18 April 2015
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, real T(2,3), the vertices of the triangle.
%
%    Output, real AREA, the area of the triangle.
%
  area = 0.5 * ...
    ( ...
        ( t(1,2) - t(1,1) ) * ( t(2,3) - t(2,1) ) ...
      - ( t(1,3) - t(1,1) ) * ( t(2,2) - t(2,1) ) ...
    );

  return
end
