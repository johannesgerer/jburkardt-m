function area = triangle_area ( xa, ya, xb, yb, xc, yc )

%*****************************************************************************80
%
%% TRIANGLE_AREA computes the signed area of a triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real XA, YA, XB, YB, XC, YC, the vertices.
%
%    Output, real AREA, the signed area of the triangle.
%
  area = 0.5 * ( ( xb - xa ) * ( yc - ya ) ...
               - ( xc - xa ) * ( yb - ya ) );

  return
end
