function x = power_mod ( a, n, m )

%*****************************************************************************80
%
%% POWER_MOD computes mod ( A^N, M ).
%
%  Discussion:
%
%    Some programming tricks are used to speed up the computation, and to
%    allow computations in which A**N is much too large to store in a
%    real word.
%
%    First, for efficiency, the power A**N is computed by determining
%    the binary expansion of N, then computing A, A**2, A**4, and so on
%    by repeated squaring, and multiplying only those factors that
%    contribute to A**N.
%
%    Secondly, the intermediate products are immediately "mod'ed", which
%    keeps them small.
%
%    For instance, to compute mod ( A^13, 11 ), we essentially compute
%
%       13 = 1 + 4 + 8
%
%       A^13 = A * A^4 * A^8
%
%       mod ( A^13, 11 ) = mod ( A, 11 ) * mod ( A^4, 11 ) * mod ( A^8, 11 ).
%
%    Fermat's little theorem says that if P is prime, and A is not divisible
%    by P, then ( A^(P-1) - 1 ) is divisible by P.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the base of the expression to be tested.
%    A should be nonnegative.
%
%    Input, integer N, the power to which the base is raised.
%    N should be nonnegative.
%
%    Input, integer M, the divisor against which the expression is tested.
%    M should be positive.
%
%    Output, integer X, the remainder when A^N is divided by M.
%
  if ( a < 0 )
    x = -1;
    return
  end

  if ( floor ( a ) ~= a )
    x = -1;
    return
  end

  if ( n < 0 )
    x = -1;
    return
  end

  if ( floor ( n ) ~= n )
    x = -1;
    return
  end 

  if ( m <= 0 )
    x = -1;
    return
  end

  if ( floor ( m ) ~= m )
    x = -1;
    return
  end
%
%  A contains the successive squares of A.
%
  x = 1;

  while ( 0 < n )

    d = mod ( n, 2 );

    if ( d == 1 )
      x = mod ( x * a, m );
    end

    a = mod ( a * a, m );
    n = floor ( ( n - d ) / 2 );

  end
%
%  Ensure that 0 <= X.
%
  while ( x < 0 )
    x = x + m;
  end

  return
end
