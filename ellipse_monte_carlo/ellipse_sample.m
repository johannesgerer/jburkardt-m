function [ x, seed ] = ellipse_sample ( n, a, r, seed )

%*****************************************************************************80
%
%% ELLIPSE_SAMPLE samples points in an ellipse.
%
%  Discussion:
%
%    The points X in the ellipse are described by a 2 by 2
%    positive definite symmetric matrix A, and a "radius" R, such that
%      X' * A * X <= R * R
%
%    If the ellipse is described by the formula
%      a x^2 + b xy + c y^2 = d
%    then
%      A = (  a  b/2 )
%          ( b/2  c  )
%      R = sqrt ( d )
%
%    The algorithm computes the Cholesky factorization of A:
%      A = U' * U.
%    A set of uniformly random points Y is generated, satisfying:
%      Y' * Y <= R * R.
%    The appropriate points in the ellipsoid are found by solving
%      U * X = Y
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 April 2014
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
%    Input, integer N, the number of points.
%
%    Input, real A(2,2), the matrix that describes the ellipse.
%
%    Input, real R, the right hand side of the ellipse equation.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(2,N), the points.
%
  m = 2;
%
%  Get the factor U such that U' * U = A.
%
  [ u_fa, info ] = r8po_fa ( m, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ELLIPSE_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  DPO_FA reports that the matrix A \n' );
    fprintf ( 1, '  is not positive definite symmetric.\n' );
    error ( 'ELLIPSE_SAMPLE - Fatal error!' );
  end
%
%  Get the points Y that satisfy Y' * Y = R * R.
%
  [ x, seed ] = uniform_in_sphere01_map ( m, n, seed );

  x(1:m,1:n) = r * x(1:m,1:n);
%
%  Solve U * X = Y.
%
  for j = 1 : n
    x(1:m,j) = r8po_sl ( m, u_fa, x(1:m,j) );
  end

  return
end
