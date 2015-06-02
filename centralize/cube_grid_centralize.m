function [ cc_est, r_min, r_max ] = cube_grid_centralize ( m, ng, oc, cc, cr )

%*****************************************************************************80
%
%% CUBE_GRID_CENTRALIZE centralizes grid data from the surface of an MD cube.
%
%  Discussion:
%
%    We generate a hypersphere grid of 1D index NG, with origin at OC,
%    and project these points onto the D cube of center CC
%    and radius CR.
%
%    The cube is aligned with the coordinate axes.
%
%    We seek to estimate the value of the center.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer NG, the grid index.  The hypersphere grid will have
%    order N = 2 * NG * (NG-1)^(M-2).
%
%    Input, real OC(M,1), the observation point, the original of the
%    hypersphere coordinate system.  OC should be inside the cube.
%
%    Input, real CC(M,1), the center of the cube.
%
%    Input, real CR, the radius of the cube.
%
%    Output, real CC_EST(M,1), the estimated cube center.
%
%    Output, real R_MIN, R_MAX, the minimum and maximum distances
%    between the observation point and sample points on the cube surface.
%
  n = ( 2 * ng ) * ( ng - 1 ) ^ ( m - 2 );
%
%  Destroy all row vectors!
%
  oc = oc(:);
  cc = cc(:);
%
%  Compute sample points on the cube01 surface.
%
  x = cube_grid ( m, ng, oc );
%
%  Shift and scale, so we really have points on the surface of the cube
%  with center CC and radius CR.
%
  x = cr * x + repmat ( cc, 1, n );
%
%  Estimate the centroid.
%
  cc_est = sum ( x, 2 ) / n;
%
%  For each point on the cube surface, the "radius" ROC is the norm of X - OC.
%
  roc = x - repmat ( oc, 1, n );
  roc = roc.^2;
  roc = sum ( roc, 1 );
  roc = sqrt ( roc );
%
%  Return the minimum and maximum radiuses.
%
  r_min = min ( roc );
  r_max = max ( roc );

  return
end
