function [ x, seed ] = sphere01_sample_3d ( n, seed )

%*****************************************************************************80
%
%% SPHERE01_SAMPLE_3D picks random points on a sphere in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of samples.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real X(3,N), the sample points.
%

%
%  Pick a uniformly random VDOT, which must be between -1 and 1.
%  This represents the dot product of the random vector with the Z unit vector.
%
%  Note: this works because the surface area of the sphere between
%  Z and Z + dZ is independent of Z.  So choosing Z uniformly chooses
%  a patch of area uniformly.
%
  phi = acos ( 2.0 * rand ( 1, n ) - 1.0 );
%
%  Pick a uniformly random rotation between 0 and 2 Pi around the
%  axis of the Z vector.
%
  theta = 2.0 * pi * rand ( 1, n );

  x(1,1:n) = cos ( theta(1,1:n) ) .* sin ( phi(1,1:n) );
  x(2,1:n) = sin ( theta(1,1:n) ) .* sin ( phi(1,1:n) );
  x(3,1:n) =                         cos ( phi(1,1:n) );

  return
end
