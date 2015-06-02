function [ cc_est, r_min, r_max ] = cube_random_centralize ( m, n, oc, cc, cr )

%*****************************************************************************80
%
%% CUBE_RANDOM_CENTRALIZE centralizes random data from a cube surface.
%
%  Discussion:
%
%    We generate N points uniformly at random on the surface of the
%    M dimensional cube, of center CC and radius R.
%
%    The cube is aligned with the coordinate axes.
%
%    We seek to estimate the value of CC.
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
%    Input, integer N, the number of random points to generate.
%
%    Input, real OC(M,1), the observation point.
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

%
%  Destroy all row vectors!
%
  cc = cc(:);
  oc = oc(:);
%
%  Compute sample points on the cube surface.
%
  x = cube_surface_sample ( m, n, cc, cr );
%
%  The center estimate is simply the average.
%
  cc_est(1:m,1) = sum ( x, 2 ) / n;
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
