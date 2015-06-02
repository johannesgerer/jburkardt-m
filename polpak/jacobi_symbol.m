function j = jacobi_symbol ( q, p )

%*****************************************************************************80
%
%% JACOBI_SYMBOL evaluates the Jacobi symbol (Q/P).
%
%  Definition:
%
%    If P is prime, then
%
%      Jacobi Symbol (Q/P) = Legendre Symbol (Q/P)
%
%    Else 
%
%      let P have the prime factorization
%
%        P = Product ( 1 <= I <= N ) P(I)^E(I)
%
%      Jacobi Symbol (Q/P) =
%
%        Product ( 1 <= I <= N ) Legendre Symbol (Q/P(I))^E(I)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Daniel Zwillinger,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996, pages 86-87.
%
%  Parameters:
%
%    Input, integer Q, an integer whose Jacobi symbol with
%    respect to P is desired.
%
%    Input, integer P, the number with respect to which the Jacobi
%    symbol of Q is desired.  P should be 2 or greater.
%
%    Output, integer J, the Jacobi symbol (Q/P).
%    Ordinarily, J will be -1, 0 or 1.
%    -2, not enough factorization space.
%    -3, an error during Legendre symbol calculation.
%

%
%  P must be greater than 1.
%
  if ( p <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'JACOBI_SYMBOL - Fatal error!\n' );
    fprintf ( 1, '  P must be greater than 1.\n' );
    j = -2;
    return
  end
%
%  Decompose P into factors of prime powers.
%
  [ nfactor, factor, power, nleft ] = i4_factor ( p );

  if ( nleft ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'JACOBI_SYMBOL - Fatal error!\n' );
    fprintf ( 1, '  Not enough factorization space.\n' );
    j = -2;
    error ( 'JACOBI_SYMBOL - Fatal error!' );
  end
%
%  Force Q to be nonnegative.
%
  qq = q;

  while ( qq < 0 )
    qq = qq + p;
  end
%
%  For each prime factor, compute the Legendre symbol, and
%  multiply the Jacobi symbol by the appropriate factor.
%
  j = 1;
  for i = 1 : nfactor
    pp = factor(i);
    l = legendre_symbol ( qq, pp );
    if ( l < -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'JACOBI_SYMBOL - Fatal error!\n' );
      fprintf ( 1, '  Error during Legendre symbol calculation.\n' );
      j = -3;
      error ( 'JACOBI_SYMBOL - Fatal error!' );
    end
    j = j * l^power(i);
  end

  return
end
