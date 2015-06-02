function [ x ] = ellipsoid_surface_sample ( m, n, a, c, r )

%*****************************************************************************80
%
%% ELLIPSOID_SURFACE_SAMPLE maps uniform points onto an ellipsoid.
%
%  Discussion:
%
%    The points X on the surface of the ellipsoid are described by an 
%    N by N positive definite symmetric matrix A, and a "radius" R, such that
%
%      (X-C)' * A * (X-C) = R * R
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
%      U * ( X - C ) = Y
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
%    24 April 2013
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
%    Input, integer M, the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input, real A(M,M), the matrix that describes the ellipsoid.
%    The matrix A should be positive definite symmetric, but this
%    is not checked.
%
%    Input, real C(M,1), the center of the ellipsoid.
%
%    Input, real R, the right hand side of the ellipsoid equation.
%    This simply scales the X values.
%
%    Output, real X(M,N), the points.
%

%
%  Get the Cholesky factor U such that U' * U = A.
%
  u = chol ( a );
%
%  Get the points Y that satisfy Y' * Y = 1.
%
  x = sphere01_surface_sample ( m, n );
%
%  Get the points Y that satisfy Y' * Y = R * R.
%
  x(1:m,1:n) = r * x(1:m,1:n);
%
%  Solve U * X = Y.
%
  x = u \ x;
%
%  Set X = X + C.
%
  x = x + repmat ( c, 1, n );

  return
end
