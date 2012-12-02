function [ result, n ] = p00_wandzura05_sub ( problem, level )

%*****************************************************************************80
%
%% P00_WANDZURA05_SUB uses subdivision and a Wandzura rule.
%
%  Discussion:
%
%    The Wandzura rule is a seven point rule of polynomial exactness 5.
%
%    The function f(x,y) is to be integrated over a triangle T.
%
%    The triangle is subdivided by subdividing each side into LEVEL sections,
%    which produces LEVEL*LEVEL subtriangles.  The Wandzura rule is then
%    applied to each subtriangle, and the result is summed.
%
%    The abscissas of this Wandzura rule do not lie on the vertices
%    or sides of the reference triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Stephen Wandzura, Hong Xiao,
%    Symmetric Quadrature Rules on a Triangle,
%    Computers and Mathematics with Applications,
%    Volume 45, pages 1829-1840, 2003.
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer LEVEL, the level of subdivision.  This indicates the
%    number of equally spaced subedges into which each edge of the triangle
%    is to be divided.  This will result in a total of LEVEL*LEVEL subtriangles
%    being used.
%
%    Output, real RESULT, the approximate integral.
%
%    Output, integer N, the number of function evaluations used.
%
  order = 7;

  w = [ ...
    0.22500000000000, ...
    0.13239415278851, ...
    0.13239415278851, ...
    0.13239415278851, ...
    0.12593918054483, ...
    0.12593918054483, ...
    0.12593918054483 ];

  xy_ref = [ ...
      0.33333333333333, 0.33333333333333, 0.33333333333333; ...
      0.05971587178977, 0.47014206410512, 0.47014206410512; ...
      0.47014206410512, 0.05971587178977, 0.47014206410512; ...
      0.47014206410512, 0.47014206410512, 0.05971587178977; ...
      0.79742698535309, 0.10128650732346, 0.10128650732346; ...
      0.10128650732346, 0.79742698535309, 0.10128650732346; ...
      0.10128650732346, 0.10128650732346, 0.79742698535309 ]';

  result = 0.0;

  tri_phys = p00_vertices ( problem );

  area = triangle_area ( tri_phys );

  more = 0;
  i1 = -1;
  j1 = -1;
  i2 = -1;
  j2 = -1;
  i3 = -1;
  j3 = -1;

  while ( 1 );
%
%  Get the integer indices of the next reference subtriangle.
%
    [ more, i1, j1, i2, j2, i3, j3 ] = subtriangle_next ( level, ...
      more, i1, j1, i2, j2, i3, j3 );
%
%  Get the barycentric coordinates of the vertices of the reference subtriangle.
%   
    xsi(1,1) = (         i1      ) / level;
    xsi(2,1) = (              j1 ) / level;
    xsi(3,1) = ( level - i1 - j1 ) / level;

    xsi(1,2) = (         i2      ) / level;
    xsi(2,2) = (              j2 ) / level;
    xsi(3,2) = ( level - i2 - j2 ) / level;

    xsi(1,3) = (         i3      ) / level;
    xsi(2,3) = (              j3 ) / level;
    xsi(3,3) = ( level - i3 - j3 ) / level;
%
%  Map the reference subtriangle to the physical subtriangle.
%
    sub_tri_phys(1:2,1:3) = tri_phys(1:2,1:3) * xsi(1:3,1:3);
%
%  Now map the integration abscissas to the physical subtriangle.
%
    xy_phys(1:2,1:order) = sub_tri_phys(1:2,1:3) * xy_ref(1:3,1:order);
%
%  Evaluate the function.
%
    f = p00_fun ( problem, order, xy_phys );
%
%  Update the quadrature estimate.
%
    result = result + w(1:order) * f(1:order)';

    if ( ~more )
      break
    end

  end
%
%  Scale by area and number of subtriangles.
%
  n = level * level * order;

  result = result * area / ( level * level );

  return
end



