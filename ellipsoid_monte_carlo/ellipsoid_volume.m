function volume = ellipsoid_volume ( m, a, v, r )

%*****************************************************************************80
%
%% ELLIPSOID_VOLUME returns the volume of an ellipsoid.
%
%  Discussion:
%
%    The points X in the ellipsoid are described by an M by M
%    positive definite symmetric matrix A, an M-dimensional point V,
%    and a "radius" R, such that
%      (X-V)' * A * (X-V) <= R * R
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, real A(M,M), the matrix that describes
%    the ellipsoid.  A must be symmetric and positive definite.
%
%    Input, real V(M), the "center" of the ellipse.
%    The value of V is not actually needed by this function.
%
%    Input, real R, the "radius" of the ellipse.
%
%    Output, real VOLUME, the volume of the ellipsoid.
%
  [ u, info ] = r8po_fa ( m, a );
  
  sqrt_det = 1.0;
  for i = 1 : m
    sqrt_det = sqrt_det * u(i,i);
  end

  volume = r ^ m * hypersphere_unit_volume ( m ) / sqrt_det;

  return
end