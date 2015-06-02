function a = herndon ( n )

%*****************************************************************************80
%
%% HERNDON returns the HERNDON matrix.
%
%  Formula:
%
%    c = ( n * ( n + 1 ) * ( 2 * n - 5 ) ) / 6
%    a(n,n) = - 1 / c
%    for i = 1 : n - 1
%      a(i,n) = a(n,i) = i / c
%      a(i,i) = ( c - i*i ) / c
%      for j = 1, i - 1
%        a(i,j) = a(j,i) = - i * j / c
%       end
%     end
%
%  Example:
%
%    N = 5
%
%     0.96  -0.08  -0.12  -0.16   0.04
%    -0.08   0.84  -0.24  -0.32   0.08
%    -0.12  -0.24   0.64  -0.48   0.12
%    -0.16  -0.32  -0.48   0.36   0.16
%     0.04   0.08   0.12   0.16  -0.04
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal: A' * A = A * A'.
%
%    The eigenvalues of A are:
%
%      1 (multiplicity N-2),
%      6 / ( P * ( N + 1 ),
%      P / ( N * ( 5 - 2 * N ) ),
%
%    where
%
%      P = 3 + sqrt ( ( 4 * N - 3 ) * ( N - 1 ) * 3 / ( N + 1 ) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Herndon,
%    Algorithm 52, A Set of Test Matrices,
%    Communications of the ACM,
%    April, 1961.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  c = n * ( n + 1 ) * ( 2 * n - 5 ) / 6.0;

  a(n,n) = - 1.0 / c;

  for i = 1 : n - 1;

    a(i,n) = i / c;
    a(n,i) = i / c;;
    a(i,i) = ( c - i * i ) / c;

    for j = 1 : i - 1

      a(i,j) = - ( i * j ) / c;
      a(j,i) = - ( i * j ) / c;

    end

  end

  return
end
