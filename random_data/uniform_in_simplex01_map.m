function [ x, seed ] = uniform_in_simplex01_map ( dim_num, n, seed )

%*****************************************************************************80
%
%% UNIFORM_IN_SIMPLEX01_MAP maps uniform points into the unit simplex.
%
%  Discussion:
%
%    The interior of the unit DIM_NUM-dimensional simplex is the set of
%    points X(1:DIM_NUM) such that each X(I) is nonnegative, and
%    sum(X(1:DIM_NUM)) <= 1.
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
%    Reuven Rubinstein,
%    Monte Carlo Optimization, Simulation, and Sensitivity
%    of Queueing Networks,
%    Wiley, 1986.
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

%
%  The construction begins by sampling DIM_NUM+1 points from the
%  exponential distribution with parameter 1.
%
  for j = 1 : n

    [ e, seed ] = r8vec_uniform_01 ( dim_num+1, seed );

    e(1:dim_num+1) = -log ( e(1:dim_num+1) );

    x(1:dim_num,j) = e(1:dim_num)' / sum ( e(1:dim_num+1) );

  end

  return
end
