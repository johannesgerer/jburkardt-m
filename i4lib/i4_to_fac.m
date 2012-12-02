function npower = i4_to_fac ( intval, nprime )

%*****************************************************************************80
%
%% I4_TO_FAC converts an integer into a product of prime factors.
%
%  Discussion:
%
%    This routine will fail if the input integer is not positive,
%    or if NPRIME is too small to account for the factors of the integer.
%
%    INTVAL = Product ( 1 <= I <= NPRIME ) PRIME(I)**NPOWER(I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer INTVAL, the integer to be factored.
%
%    Input, integer NPRIME, the number of prime factors for
%    which storage has been allocated.
%
%    Output, integer NPOWER(NPRIME), the powers of the primes.
%
  if ( intval <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_FAC - Fatal error!\n' );
    fprintf ( 1, '  Input integer is not positive.\n' );
    error ( 'I4_TO_FAC - Fatal error!' );
  end
%
%  Try dividing the remainder by each prime.
%
  for i = 1 : nprime

    npower(i) = 0;

    p = prime ( i );

    while ( mod ( intval, p ) == 0 )
      npower(i) = npower(i) + 1;
      intval = floor ( intval / p );
    end

  end

  return
end
