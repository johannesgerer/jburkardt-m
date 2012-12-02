function l = legendre_symbol ( q, p )

%*****************************************************************************80
%
%% LEGENDRE_SYMBOL evaluates the Legendre symbol (Q/P).
%
%  Definition:
%
%    Let P be an odd prime.  Q is a QUADRATIC RESIDUE modulo P
%    if there is an integer R such that R**2 = Q ( mod P ).
%    The Legendre symbol ( Q / P ) is defined to be:
%
%      + 1 if Q ( mod P ) /= 0 and Q is a quadratic residue modulo P,
%      - 1 if Q ( mod P ) /= 0 and Q is not a quadratic residue modulo P,
%        0 if Q ( mod P ) == 0.
%
%    We can also define ( Q / P ) for P = 2 by:
%
%      + 1 if Q ( mod P ) /= 0
%        0 if Q ( mod P ) == 0
%
%  Example:
%
%    (0/7) =   0
%    (1/7) = + 1  ( 1**2 = 1 mod 7 )
%    (2/7) = + 1  ( 3**2 = 2 mod 7 )
%    (3/7) = - 1
%    (4/7) = + 1  ( 2**2 = 4 mod 7 )
%    (5/7) = - 1
%    (6/7) = - 1
%
%  Note:
%
%    For any prime P, exactly half of the integers from 1 to P-1
%    are quadratic residues.
%
%    ( 0 / P ) = 0.
%
%    ( Q / P ) = ( mod ( Q, P ) / P ).
%
%    ( Q / P ) = ( Q1 / P ) * ( Q2 / P ) if Q = Q1 * Q2.
%
%    If Q is prime, and P is prime and greater than 2, then:
%
%      if ( Q == 1 ) then
%
%        ( Q / P ) = 1
%
%      else if ( Q == 2 ) then
%
%        ( Q / P ) = + 1 if mod ( P, 8 ) = 1 or mod ( P, 8 ) = 7,
%        ( Q / P ) = - 1 if mod ( P, 8 ) = 3 or mod ( P, 8 ) = 5.
%
%      else
%
%        ( Q / P ) = - ( P / Q ) if Q = 3 ( mod 4 ) and P = 3 ( mod 4 ),
%                  =   ( P / Q ) otherwise.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Charles Pinter,
%    A Book of Abstract Algebra,
%    McGraw Hill, 1982, pages 236-237.
%
%    Daniel Zwillinger,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996, pages 86-87.
%
%  Parameters:
%
%    Input, integer Q, an integer whose Legendre symbol with
%    respect to P is desired.
%
%    Input, integer P, a prime number, greater than 1, with respect
%    to which the Legendre symbol of Q is desired.
%
%    Output, integer L, the Legendre symbol (Q/P).
%    Ordinarily, L will be -1, 0 or 1.
%    L = -2, P is less than or equal to 1.
%    L = -3, P is not prime.
%    L = -4, the internal stack of factors overflowed.
%    L = -5, not enough factorization space.
%

%
%  P must be greater than 1.
%
  if ( p <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEGENDRE_SYMBOL - Fatal error!\n' );
    fprintf ( 1, '  P must be greater than 1.\n' );
    l = -2;
    error ( 'LEGENDRE_SYMBOL - Fatal error!' );
  end
%
%  P must be prime.
%
  if ( ~i4_is_prime ( p ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEGENDRE_SYMBOL - Fatal error!\n' );
    fprintf ( 1, '  P is not prime.\n' );
    l = -3;
    error ( 'LEGENDRE_SYMBOL - Fatal error!' );
  end
%
%  ( k*P / P ) = 0.
%
  if ( mod ( q, p ) == 0 )
    l = 0;
    return
  end
%
%  For the special case P = 2, (Q/P) = 1 for all odd numbers.
%
  if ( p == 2 )
    l = 1;
    return
  end
%
%  Make a copy of Q, and force it to be nonnegative.
%
  qq = q;

  while ( qq < 0 )
    qq = qq + p;
  end

  nstack = 0;
  pp = p;
  l = 1;

  while ( 1 )

    qq = mod ( qq, pp );
%
%  Decompose QQ into factors of prime powers.
%
    [ nfactor, factor, power, nleft ] = i4_factor ( qq );

    if ( nleft ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'LEGENDRE_SYMBOL - Fatal error!\n' );
      fprintf ( 1, '  Not enough factorization space.\n' );
      l = -5;
      error ( 'LEGENDRE_SYMBOL - Fatal error!' );
    end
%
%  Each factor which is an odd power is added to the stack.
%
    nmore = 0;

    for i = 1 : nfactor

      if ( mod ( power(i), 2 ) == 1 )

        nmore = nmore + 1;
        nstack = nstack + 1;

        pstack(nstack) = pp;
        qstack(nstack) = factor(i);

      end

    end

    if ( nmore ~= 0 )

      qq = qstack(nstack);
      nstack = nstack - 1;
%
%  Check for a QQ of 1 or 2.
%
      if ( qq == 1 )

        l = + 1 * l;

      elseif ( qq == 2 && ( mod ( pp, 8 ) == 1 || mod ( pp, 8 ) == 7 ) )

        l = + 1 * l;

      elseif ( qq == 2 && ( mod ( pp, 8 ) == 3 || mod ( pp, 8 ) == 5 ) )

        l = - 1 * l;

      else

        if ( mod ( pp, 4 ) == 3 && mod ( qq, 4 ) == 3 )
          l = - 1 * l;
        end

        [ pp, qq ] = i4_swap ( pp, qq );

        continue

      end

    end
%
%  If the stack is empty, we're done.
%
    if ( nstack == 0 )
      break
    end
%
%  Otherwise, get the last P and Q from the stack, and process them.
%
    pp = pstack(nstack);
    qq = qstack(nstack);
    nstack = nstack - 1;

  end

  return
end
