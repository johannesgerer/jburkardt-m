function area = annulus_area_2d ( r1, r2 )

%*****************************************************************************80
%
%% ANNULUS_AREA_2D computes the area of a circular annulus in 2D.
%
%  Discussion:
%
%    A circular annulus with center (XC,YC), inner radius R1 and
%    outer radius R2, is the set of points (X,Y) so that
%
%      R1**2 <= (X-XC)**2 + (Y-YC)**2 <= R2**2
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
%    Input, real R1, R2, the inner and outer radii of the annulus.
%
%    Output, real AREA, the area of the annulus.
%
  area = pi * ( r2 + r1 ) * ( r2 - r1 );

  return
end
