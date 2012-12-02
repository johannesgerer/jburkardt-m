function centroid = annulus_sector_centroid_2d ( pc, r1, r2, theta1, theta2 )

%*****************************************************************************80
%
%% ANNULUS_SECTOR_CENTROID_2D computes the centroid of an annular sector in 2D.
%
%  Discussion:
%
%    An annular sector with center PC, inner radius R1 and
%    outer radius R2, and angles THETA1, THETA2, is the set of points 
%    P so that
%
%      R1**2 <= (P(1)-PC(1))**2 + (P(2)-PC(2))**2 <= R2**2
%
%    and
%
%      THETA1 <= THETA ( P - PC ) <= THETA2
%
%    Thanks to Ed Segall for pointing out a mistake in the computation
%    of the angle THETA assciated with the centroid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Harris and Horst Stocker,
%    Handbook of Mathematics and Computational Science,
%    Springer, 1998, QA40.S76
%
%  Parameters:
%
%    Input, real PC(2), the center.
%
%    Input, real R1, R2, the inner and outer radii.
%
%    Input, real THETA1, THETA2, the angles.
%
%    Output, real CENTROID(2), the centroid.
%
  theta = theta2 - theta1;

  r = 4.0 * sin ( theta / 2.0 ) / ( 3.0 * theta ) ...
    * ( r1 * r1 + r1 * r2 + r2 * r2 ) / ( r1 + r2 );

  centroid(1) = pc(1) + r * cos ( theta1 + theta / 2.0 );
  centroid(2) = pc(2) + r * sin ( theta1 + theta / 2.0 );

  return
end
