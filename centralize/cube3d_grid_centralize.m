function [ cc_est, r_min, r_max ] = cube3d_grid_centralize ( ng, oc )

%*****************************************************************************80
%
%% CUBE3D_GRID_CENTRALIZE centralizes grid data from the surface of a 3D cube.
%
%  Discussion:
%
%    We generate a hypersphere grid of 1D index NG, with origin at OC,
%    and project these points onto the 3D cube of center [0,0,0]
%    and radius 1.
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
%    Input, integer NG, the grid index.  The hypersphere grid will have
%    order N = (2*NG+1) * (NG+1)^(M-2).
%
%    Input, real OC(M,1), the observation point, the original of the
%    hypersphere coordinate system.  OC should be inside the cube.
%
%    Output, real CC_EST(M,1), the estimated cube center.
%
%    Output, real R_MIN, R_MAX, the minimum and maximum distances
%    between the observation point and sample points on the cube surface.
%
  m = 3;
  n = ( 2 * ng + 1 ) * ( ng + 1 ) ^ ( m - 2 );
%
%  Destroy all row vectors!
%
  oc = oc(:);
%
%  Compute sample points on the cube surface.
%
  [ x1, x2, x3 ] = cube3d_grid ( ng, oc );
%
%  "Flatten" the data into vectors.
%
  x1 = reshape ( x1, n, 1 );
  x2 = reshape ( x2, n, 1 );
  x3 = reshape ( x3, n, 1 );
%
%  The center estimate is simply the average.
%
  cc_est = zeros ( 3, 1 );
  cc_est(1,1) = sum ( x1 ) / n;
  cc_est(2,1) = sum ( x2 ) / n;
  cc_est(3,1) = sum ( x3 ) / n;
%
%  For each point on the cube surface, the "radius" ROC is the norm of X - OC.
%
  roc = [ x1, x2, x3 ]' - repmat ( oc, 1, n );
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
