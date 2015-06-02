function a = carry ( n, alpha )

%*****************************************************************************80
%
%% CARRY returns the CARRY matrix.
%
%  Discussion:
%
%    We assume that arithmetic is being done in base ALPHA.  We are adding
%    a column of N digits base ALPHA, as part of adding N random numbers.
%    We know the carry digit, between 0 and N-1, that is being carried into the
%    column sum (the incarry digit), and we want to know the probability of
%    the various carry digits 0 through N-1 (the outcarry digit) that could
%    be carried out of the column sum.
%
%    The carry matrix summarizes this data.  The entry A(I,J) represents
%    the probability that, given that the incarry digit is I-1, the
%    outcarry digit will be J-1.
%
%  Formula:
%
%    A(I,J) = ( 1 / ALPHA )^N * sum ( 0 <= K <= J-1 - floor ( I-1 / ALPHA ) )
%      (-1)^K * C(N+1,K) * C(N-I+(J-K)*ALPHA, N )
%
%  Example:
%
%    ALPHA = 10, N = 4
%
%    0.0715 0.5280 0.3795 0.0210
%    0.0495 0.4840 0.4335 0.0330
%    0.0330 0.4335 0.4840 0.0495
%    0.0210 0.3795 0.5280 0.0715
%
%  Square Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is a Markov matrix.
%
%    A is centrosymmetric: A(I,J) = A(N+1-I,N+1-J).
%
%    LAMBDA(I) = 1 / ALPHA^(I-1)
%
%    det ( A ) = 1 / ALPHA^((N*(N-1))/2)
%
%    The eigenvectors do not depend on ALPHA.
%
%    A is generally not normal: A' * A /= A * A'.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Holte,
%    Carries, Combinatorics, and an Amazing Matrix,
%    The American Mathematical Monthly,
%    February 1997, pages 138-149.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer ALPHA, the numeric base being used in the addition.
%
%    Output, real A(N,N), the matrix.
%
  alpha = floor ( alpha );

  for i = 1 : n
    for j = 1 : n

      temp = 0.0;
      s = -1.0;

      for k = 0 : j - 1 - floor ( ( i - 1 ) / alpha )
        s = - s;
        c1 = r8_choose ( n + 1, k );
        c2 = r8_choose ( n - i + ( j - k ) * alpha, n );
        temp = temp + s * c1 * c2;
      end

      a(i,j) = temp / alpha^n;

    end

  end

  return
end
