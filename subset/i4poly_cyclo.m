function phi = i4poly_cyclo ( n )

%% I4POLY_CYCLO computes a cyclotomic polynomial.
%
%  Discussion:
%
%    For 1 <= N, let
%
%      I = SQRT ( - 1 )
%      L = EXP ( 2 * PI * I / N )
%
%    Then the N-th cyclotomic polynomial is defined by
%
%      PHI(N;X) = Product ( 1 <= K <= N and GCD(K,N) = 1 ) ( X - L**K )
%
%    We can use the Moebius MU function to write
%
%      PHI(N;X) = Product ( mod ( D, N ) = 0 ) ( X**D - 1 )**MU(N/D)
%
%    There is a sort of inversion formula:
%
%      X**N - 1 = Product ( mod ( D, N ) = 0 ) PHI(D;X)
%
%  Example:
%
%     N  PHI
%
%     0  1
%     1  X - 1
%     2  X + 1
%     3  X**2 + X + 1
%     4  X**2 + 1
%     5  X**4 + X**3 + X**2 + X + 1
%     6  X**2 - X + 1
%     7  X**6 + X**5 + X**4 + X**3 + X**2 + X + 1
%     8  X**4 + 1
%     9  X**6 + X**3 + 1
%    10  X**4 - X**3 + X**2 - X + 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Raymond Seroul,
%    Programming for Mathematicians,
%    Springer Verlag, 2000, page 269.
%
%  Parameters:
%
%    Input, integer N, the index of the cyclotomic polynomial desired.
%
%    Output, integer PHI(1:N+1), the N-th cyclotomic polynomial.
%
  max_poly = 100;

  num(1) = 1;
  num(2:max_poly+1) = 0;
  num_n = 0;

  den(1) = 1;
  den(2:max_poly+1) = 0;
  den_n = 0;

  phi(1:n+1) = 0;

  for d = 1 : n
%
%  For each divisor D of N, ...
%
    if ( mod ( n, d ) == 0 )

      mu = i4_moebius ( n / d );
%
%  ...multiply the numerator or denominator by (X^D-1).
%
      factor(1) = -1;
      factor(2:d) = 0;
      factor(d+1) = 1;

      if ( mu == +1 )

        if ( max_poly < num_n + d )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'I4POLY_CYCLO - Fatal error!\n' );
          fprintf ( 1, '  Numerator polynomial degree too high.\n' );
          return
        end

        num = i4poly_mul ( num_n, num, d, factor );

        num_n = num_n + d;

      elseif ( mu == -1 )

        if ( max_poly < den_n + d )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'I4POLY_CYCLO - Fatal error!\n' );
          fprintf ( 1, '  Denominator polynomial degree too high.\n' );
          return
        end

        den = i4poly_mul ( den_n, den, d, factor );

        den_n = den_n + d;

      end

    end

  end
%
%  PHI = NUM / DEN
%
  [ nq, q, nr, rem ] = i4poly_div ( num_n, num, den_n, den );

  phi(1:nq+1) = q(1:nq+1);

  return
end
