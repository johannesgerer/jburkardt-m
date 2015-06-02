function [ l, d ] = kms_ldl ( alpha, n )

%*****************************************************************************80
%
%% KMS_LDL returns the LDL factorization of the KMS matrix.
%
%  Discussion:
%
%    A = L * D * L'
%
%  Example:
%
%    ALPHA = 0.5, N = 5
%
%    D = 
%
%      1   0   0   0   0
%      0  3/4  0   0   0
%      0   0  3/4  0   0
%      0   0   0  3/4  0
%      0   0   0   0  3/4
%
%    L =
%
%       1    0   0   0   0
%      1/2   1   0   0   0
%      1/4  1/2  1   0   0
%      1/8  1/4 1/2  1   0
%      1/16 1/8 1/4 1/2  1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    William Trench,
%    Numerical solution of the eigenvalue problem for Hermitian
%    Toeplitz matrices,
%    SIAM Journal on Matrix Analysis and Applications,
%    Volume 10, Number 2, April 1989, pages 135-146.
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines A.  
%    A typical value is 0.5.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real L(N,N), the lower triangular factor.
%
%    Output, real D(N,N), the diagonal factor.
%
  l = zeros ( n, n );

  l(1,1) = 1.0;
  for i = 2 : n
    l(i,1) = alpha * l(i-1,1);
  end

  for j = 2 : n
    l(1:j-1,j) = 0.0;
    l(j:n,j) = l(1:n+1-j,1);
  end

  d = zeros ( n, n );
  d(1,1) = 1.0;
  for i = 2 : n
    d(i,i) = 1.0 - alpha * alpha;
  end

  return
end
