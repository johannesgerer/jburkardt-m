function [ x, seed ] = sphere01_sample ( n, seed )

%*****************************************************************************80
%
%% SPHERE01_SAMPLE picks random points on the unit sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 April 2014
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
  x = zeros ( 3, n );

  for j = 1 : n
%
%  Pick a uniformly random VDOT, which must be between -1 and 1.
%  This represents the dot product of the random vector with the Z unit vector.
%
%  Note: this works because the surface area of the sphere between
%  Z and Z + dZ is independent of Z.  So choosing Z uniformly chooses
%  a patch of area uniformly.
%
    [ vdot, seed ] = r8_uniform_01 ( seed );
    vdot = 2.0 * vdot - 1.0;

    phi = r8_acos ( vdot );
%
%  Pick a uniformly random rotation between 0 and 2 Pi around the
%  axis of the Z vector.
%
    [ theta, seed ] = r8_uniform_01 ( seed );
    theta = 2.0 * pi * theta;

    x(1,j) = cos ( theta ) * sin ( phi );
    x(2,j) = sin ( theta ) * sin ( phi );
    x(3,j) = cos ( phi );

  end

  return
end