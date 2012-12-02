function [ x, seed ] = normal_simple ( dim_num, n, seed )

%*****************************************************************************80
%
%% NORMAL_SIMPLE creates normally distributed points.
%
%  Discussion:
%
%    The multivariate normal distribution has the form:
%
%      f(x) = (2*pi*det(V))**(-DIM_NUM/2) * exp(-0.5*(x-mu)'*inverse(V)*(x-mu))
%
%    where mu is the mean vector, and V is a positive definite symmetric
%    matrix called the variance-covariance matrix.
%
%    This routine implements the simplest version of a multivariate
%    normal distribution.  The variance-covariance matrix is the identity,
%    and the mean vector is entirely zero.  Thus, a sample on N points
%    is simply DIM_NUM*N scalar values generated under the univariate
%    normal distribution with zero mean and unit variance.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2005
%
%  Author:
%
%    John Burkardt
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
  [ x(1:dim_num,1:n), seed ] = r8mat_normal_01 ( dim_num, n, seed );

  return
end
