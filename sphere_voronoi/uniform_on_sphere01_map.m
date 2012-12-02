function [ x, seed ] = uniform_on_sphere01_map ( dim_num, n, seed )

%*****************************************************************************80
%
%% UNIFORM_ON_SPHERE01_MAP maps uniform points onto the unit sphere.
%
%  Discussion:
%
%    The sphere has center 0 and radius 1.
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
%    Wiley, 1986, page 234.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), the points.
%
  for j = 1 : n
%
%  Fill a vector with normally distributed values.
%
    [ x(1:dim_num,j), seed ] = r8vec_normal_01 ( dim_num, seed );
%
%  Compute the length of the vector.
%
    norm = sqrt ( sum ( x(1:dim_num,j).^2 ) );
%
%  Normalize the vector.
%
    x(1:dim_num,j) = x(1:dim_num,j) / norm;

  end

  return
end
