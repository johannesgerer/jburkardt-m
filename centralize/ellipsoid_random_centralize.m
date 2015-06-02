function [ c_est, r_est, c_err, r_err ] = ellipsoid_random_centralize ( ...
  m, n, c, r )

%*****************************************************************************80
%
%% ELLIPSOID_RANDOM_CENTRALIZE estimates the center and radius of an ellipsoid.
%
%  Discussion:
%
%    We generate N points on the M dimensional ellipsoid of center C,
%    and radiuses R.  We seek to estimate the values of C and R.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2013
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
%    Input, real R(M,1), the radiuses.
%
%    Output, real C_EST(M,1), R_EST, the estimated center and radius.
%
%    Output, real C_ERR, R_ERR, the errors in the estimates.
%
  c = c(:);
  r = r(:);
%
%  Construct a diagonal matrix from R.
%
  a = diag ( r );
%
%  Multiply it by a random orthogonal matrix.
%
  q = r8mat_orth_uniform ( m );
  a = q * a * q';
%
%  Now generate points on the ellipsoid surface (X-C)' * A * (X-C) = R * R.
%
  rr = 1.0;
  x = ellipsoid_surface_sample ( m, n, a, c, rr );

  c_est = sum ( x, 2 ) / n;
  c_err = norm ( c - c_est );

  r_mat = x - repmat ( c_est, 1, n );
  r_mat = r_mat.^2;
  r_mat = sum ( r_mat, 1 );
  r_mat = sqrt ( r_mat );
  r_est = sum ( r_mat ) / n;
% r_err = abs ( r - r_est );
  r_err = 0.0;

  return
end
