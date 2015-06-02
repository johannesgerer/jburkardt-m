function [ c_est, r_est, c_err, r_err ] = sphere_random_centralize ( ...
  m, n, c, r )

%*****************************************************************************80
%
%% SPHERE_RANDOM_CENTRALIZE estimates the center of a sphere.
%
%  Discussion:
%
%    We generate N points on the M dimensional sphere of center C and radius R.
%    We seek to estimate the values of C and R.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2013
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
%    Input, real C(M,1), the center.
%
%    Input, real R, the radius.
%
%    Output, real C_EST(M,1), R_EST, the estimated center and radius.
%
%    Output, real C_ERR, R_ERR, the errors in the estimates.
%
  c = c(:);
  x = sphere_surface_sample ( m, n, c, r );

  c_est = sum ( x, 2 ) / n;
  c_err = norm ( c - c_est );

  r_mat = x - repmat ( c_est, 1, n );
  r_mat = r_mat.^2;
  r_mat = sum ( r_mat, 1 );
  r_mat = sqrt ( r_mat );
  r_est = sum ( r_mat ) / n;
  r_err = abs ( r - r_est );

  return
end
