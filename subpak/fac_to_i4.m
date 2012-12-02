function intval = fac_to_i4 ( nprime, npower )

%*****************************************************************************80
%
%% FAC_TO_I4 converts a product of prime factors into an integer.
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
%    Input, integer NPOWER(NPRIME), the powers of primes
%    in the representation of the quantity.  If any of these powers
%    are negative, then INTVAL will be set to 0.
%
%    Output, integer INTVAL, the integer represented by the product of the
%    prime factors.
%
  intval = 1;

  for i = 1 : nprime

    if ( npower(i) < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'FAC_TO_I4 - Fatal error!\n' );
      fprintf ( 1, '  One of the powers is negative!\n' );
      error ( 'FAC_TO_I4 - Fatal error!' );
    end

    intval = intval * prime(i)^npower(i);

  end

  return
end
