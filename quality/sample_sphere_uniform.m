function [ x, seed ] = sample_sphere_uniform ( m, n, seed )

%*****************************************************************************80
%
%% SAMPLE_SPHERE_UNIFORM samples points inside the unit sphere.
%
%  Discussion:
%
%    The sphere has center 0 and radius 1.
%
%    We first generate a point ON the sphere, and then distribute it
%    IN the sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Russell Cheng,
%    Random Variate Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley, 1998, pages 168.
%
%    Reuven Rubinstein,
%    Monte Carlo Optimization, Simulation, and Sensitivity
%    of Queueing Networks,
%    Wiley, 1986, page 232.
%
%  Parameters:
%
%    Input, integer M, the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(M,N), the points.
%
  exponent = 1.0 / m;

  for j = 1 : n
%
%  Fill a vector with normally distributed values.
%
    [ y, seed ] = r8ec_normal_01 ( m, seed );
%
%  Compute the length of the vector.
%
    norm = sqrt ( sum ( y(1:m).^2 ) );
%
%  Normalize the vector.
%
    y(1:m) = y(1:m) / norm;
%
%  Now compute a value to map the point ON the sphere INTO the sphere.
%
    [ r, seed ] = r8_uniform_01 ( seed );

    x(1:m,j) = r^exponent * y(1:m)';

  end

  return
end
