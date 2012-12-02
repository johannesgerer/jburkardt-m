function [ p, l, u ] = kms_plu ( alpha, n )

%*****************************************************************************80
%
%% KMS_PLU returns the PLU factors of the KMS matrix.
%
%  Example:
%
%    ALPHA = 0.5, N = 5
%
%    P = Identity matrix
%
%    L =
%
%       1    0   0   0   0
%      1/2   1   0   0   0
%      1/4  1/2  1   0   0
%      1/8  1/4 1/2  1   0
%      1/16 1/8 1/4 1/2  1
%
%    U =
%
%       1   1/2  1/4  1/8  1/16
%       0   3/4  3/8  3/16 3/32
%       0    0   3/4  3/8  3/16
%       0    0    0   3/4  3/8
%       0    0    0    0   3/4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2011
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
%    Output, real P(N,N), L(N,N), U(N,N), the PLU factors.
%
  p = zeros ( n, n );

  for j = 1 : n
    p(j,j) = 1.0;
  end

  l = zeros ( n, n );

  l(1,1) = 1.0;
  for i = 2 : n
    l(i,1) = alpha * l(i-1,1);
  end

  for j = 2 : n
    l(j:n,j) = l(1:n+1-j,1);
  end

  u(1:n,1:n) = l(1:n,1:n)';

  u(2:n,1:n) = u(2:n,1:n) * ( 1.0 - alpha * alpha );

  return
end
