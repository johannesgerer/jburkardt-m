function npower3 = fac_gcd ( nprime, npower1, npower2 )

%*****************************************************************************80
%
%% FAC_GCD finds the GCD of two products of prime factors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NPRIME, the index of the highest prime number
%    used in the representations.
%
%    Input, integer NPOWER1(NPRIME), the powers of primes
%    in the representation of the first quantity.  All the powers
%    must be nonnegative.
%
%    Input, integer NPOWER2(NPRIME), the powers of primes
%    in the representation of the second quantity.  All the powers
%    must be nonnegative.
%
%    Output, integer NPOWER3(NPRIME), the powers of primes
%    in the representation of the GCD.
%
  for i = 1 : nprime

    if ( npower1(i) < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'FAC_GCD - Fatal error!\n' );
      fprintf ( 1, '  One of the powers is negative!\n' );
      error ( 'FAC_GCD - Fatal error!' );
    end

    if ( npower2(i) < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'FAC_GCD - Fatal error!\n' );
      fprintf ( 1, '  One of the powers is negative!\n' );
      error ( 'FAC_GCD - Fatal error!' );
    end

    npower3(i) = min ( npower1(i), npower2(i) );

  end

  return
end
