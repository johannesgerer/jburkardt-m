function a = fibonacci1 ( n, f1, f2 )

%*****************************************************************************80
%
%% FIBONACCI1 returns the FIBONACCI1 matrix.
%
%  Example:
%
%    N = 5
%    F1 = 1, F2 = 2
%
%    1  2  3  5  8
%    2  3  5  8 13
%    3  5  8 13 21
%    5  8 13 21 34
%    8 13 21 34 55
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    If F1 and F2 are integral, then so is A.
%
%    If A is integral, then det ( A ) is integral, and
%    det ( A ) * inverse ( A ) is integral.
%
%    A is a Hankel matrix: constant along anti-diagonals.
%
%    If B is the Fibonacci iteration matrix:
%
%      B * A(F1,F2) = A(F2,F2+F1) = A(F2,F3)
%
%    and in general,
%
%      B^N * A(F1,F2) = A(F(N+1),F(N+2))
%
%    For 2 < N, the matrix is singular, because row 3 is the sum
%    of row 1 and row 2.
%
%    For 2 <= N,
%
%      rank ( A ) = 2
%
%    If N = 1, then
%      det ( A ) = 1
%    else if N = 2 then
%      det ( A ) = -1
%    else if 1 < N then
%      det ( A ) = 0
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real F1, F2, the first two elements of the sequence
%    that will generate the Fibonacci sequence.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  a(1,1) = f1;
  a(2,1) = f2;
  a(1,2) = f2;

  fnm2 = f1;
  fnm1 = f2;
  fn   = fnm1 + fnm2;

  for k = 4 : n + n

    i = min ( k - 1,     n );
    j = max (     1, k - n );

    while ( 1 <= i & j <= n )
      a(i,j) = fn;
      i = i - 1;
      j = j + 1;
    end

    fnm2 = fnm1;
    fnm1 = fn;
    fn   = fnm1 + fnm2;

  end

  return
end
