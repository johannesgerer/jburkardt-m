function [ x, seed ] = normal ( dim_num, n, r, mu, seed )

%*****************************************************************************80
%
%% NORMAL creates normally distributed points.
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
%    This routine requires that the user supply the upper triangular
%    Cholesky factor R, which has the property that
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
%    Input, real R(DIM_NUM,DIM_NUM), the upper triangular
%    Cholesky factor of the variance-covariance matrix.
%
%    Input, real MU(DIM_NUM), the mean vector.
%
%    Output, real X(DIM_NUM,N), the points.
%

%
%  Get a matrix of normal data.
%
  [ x(1:dim_num,1:n), seed ] = r8mat_normal_01 ( dim_num, n, seed );
%
%  Compute R' * X.
%  We actually carry out this computation in the equivalent form X' * R.
%
  for j = 1 : n
    x(1:dim_num,j) = mu(1:dim_num)' ...
      + ( r(1:dim_num,1:dim_num) )' * x(1:dim_num,j);
  end

  return
end
