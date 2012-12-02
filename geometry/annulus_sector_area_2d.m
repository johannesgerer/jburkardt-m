function area = annulus_sector_area_2d ( r1, r2, theta1, theta2 )

%*****************************************************************************80
%
%% ANNULUS_SECTOR_AREA_2D computes the area of an annular sector in 2D.
%
%  Discussion:
%
%    An annular sector with center (XC,YC), inner radius R1 and
%    outer radius R2, and angles THETA1, THETA2, is the set of points
%    (X,Y) so that
%
%      R1**2 <= (X-XC)**2 + (Y-YC)**2 <= R2**2
%
%    and
%
%      THETA1 <= THETA ( X - XC, Y - YC ) <= THETA2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R1, R2, the inner and outer radii.
%
%    Input, real THETA1, THETA2, the angles.
%
%    Output, real AREA, the area.
%
  area = 0.5 * ( theta2 - theta1 ) * ( r2 + r1 ) * ( r2 - r1 );

  return
end
