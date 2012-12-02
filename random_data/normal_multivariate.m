function [ x, seed ] = normal_multivariate ( dim_num, n, r, mu, seed )

%*****************************************************************************80
%
%% NORMAL_MULTIVARIATE samples a multivariate normal distribution.
%
%  Discussion:
%
%    The multivariate normal distribution for the DIM_NUM dimensional vector X
%    has the form:
%
%      pdf(X) = (2*pi*det(V))**(-DIM_NUM/2)
%        * exp(-0.5*(X-MU)'*inverse(V)*(X-MU))
%
%    where MU is the mean vector, and V is a positive definite symmetric
%    matrix called the variance-covariance matrix.
%
%    This routine samples points associated with the DIM_NUM-dimensional
%    normal distribution with mean MU and covariance matrix V.
%
%    This routine requires that the user supply the upper triangular
%    Cholesky factor R of V, which has the property that
%
%      V = R' * R
%
%    This factorization always exists if V is actually symmetric and
%    positive definite.  This factorization can be computed by the
%    routine DPO_FA.
%
%    The user also supplies the mean vector MU.
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
%    Wiley, 1998, pages 167-168.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input, real R(DIM_NUM,DIM_NUM), the upper triangular
%    Cholesky factor of the variance-covariance matrix.
%
%    Input, real MU(DIM_NUM), the mean vector.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), corresponding points associated
%    with the multivariate normal distribution.
%

%
%  Create an M by N array U of samples of the standard normal distribution.
%
  [ u, seed ] = r8vec_normal_01 ( dim_num*n, seed );
%
%  Compute X = MU + R' * U.
%
  for j = 1 : n
    x(1:dim_num,j) = mu(1:dim_num) ...
      + r(1:dim_num,1:dim_num)' * u(1:dim_num,j);
  end

  return
end
