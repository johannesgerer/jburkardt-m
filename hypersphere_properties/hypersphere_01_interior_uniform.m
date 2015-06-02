function [ x, seed ] = hypersphere_01_interior_uniform ( m, n, seed )

%*****************************************************************************80
%
%% HYPERSPHERE_01_INTERIOR_UNIFORM: uniform points inside unit hypersphere.
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
%    03 August 2005
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
    [ x(1:m,j), seed ] = r8vec_normal_01 ( m, seed );
%
%  Compute the length of the vector.
%
    norm = sqrt ( sum ( x(1:m,j).^2 ) );
%
%  Normalize the vector.
%
    x(1:m,j) = x(1:m,j) / norm;
%
%  Now compute a value to map the point ON the sphere INTO the sphere.
%
    [ r, seed ] = r8_uniform_01 ( seed );

    x(1:m,j) = r^exponent * x(1:m,j);

  end

  return
end
