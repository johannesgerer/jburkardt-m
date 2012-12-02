function [ x, seed ] = uniform_on_ellipsoid_map ( dim_num, n, a, r, seed )

%*****************************************************************************80
%
%% UNIFORM_ON_ELLIPSOID_MAP maps uniform points onto an ellipsoid.
%
%  Discussion:
%
%    The points X on the ellipsoid are described by an M by M positive
%    definite symmetric matrix A, and a "radius" R, such that
%
%      X' * A * X = R * R
%
%    The algorithm computes the Cholesky factorization of A:
%
%      A = U' * U.
%
%    A set of uniformly random points Y is generated, satisfying:
%
%      Y' * Y = R * R.
%
%    The appropriate points in the ellipsoid are found by solving
%
%      U * X = Y
%
%    Thanks to Dr Karl-Heinz Keil for pointing out that the original
%    coding was actually correct only if A was replaced by its inverse.
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
%    Input, real A(DIM_NUM,DIM_NUM), the matrix that describes
%    the ellipsoid.
%
%    Input, real R, the right hand side of the ellipsoid equation.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), the points.
%

%
%  Get the factor U.
%
  [ u_fa, info ] = dpo_fa ( dim_num, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'UNIFORM_ON_ELLIPSOID_MAP - Fatal error!\n' );
    fprintf ( 1, '  DPO_FA reports that the matrix A \n' );
    fprintf ( 1, '  is not positive definite symmetric.\n' );
    error ( 'UNIFORM_ON_ELLIPSOID_MAP - Fatal error!' );
  end
%
%  Get the points Y that satisfy Y' * Y = R * R.
%
  [ x, seed ] = uniform_on_sphere01_map ( dim_num, n, seed );

  x(1:dim_num,1:n) = r * x(1:dim_num,1:n);
%
%  Solve U * X = Y.
%
  for j = 1 : n
    x(1:dim_num,j) = dpo_sl ( dim_num, u_fa, x(1:dim_num,j) );
  end

  return
end
