function xsi = triangle_xy_to_xsi_2d ( t, p )

%*****************************************************************************80
%
%% TRIANGLE_XY_TO_XSI_2D converts from XY to barycentric in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Input, real P(2,1), the XY coordinates of a point.
%
%    Output, real XSI(3,1), the barycentric coordinates of the point.
%    XSI1 + XSI2 + XSI3 should equal 1.
%
  det = ( t(1,1) - t(1,3) ) * ( t(2,2) - t(2,3) ) ...
      - ( t(1,2) - t(1,3) ) * ( t(2,1) - t(2,3) );

  xsi(1,1) = (   ( t(2,2) - t(2,3) ) * ( p(1,1) - t(1,3) ) ...
               - ( t(1,2) - t(1,3) ) * ( p(2,1) - t(2,3) ) ) / det;

  xsi(2,1) = ( - ( t(2,1) - t(2,3) ) * ( p(1,1) - t(1,3) ) ...
               + ( t(1,1) - t(1,3) ) * ( p(2,1) - t(2,3) ) ) / det;

  xsi(3,1) = 1.0 - xsi(1,1) - xsi(2,1);

  return
end
