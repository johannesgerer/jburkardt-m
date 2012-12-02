function npower3 = fac_lcm ( nprime, npower1, npower2 )

%*****************************************************************************80
%
%% FAC_LCM finds the LCM of two products of prime factors.
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
%    in the representation of the first quantity.
%
%    Input, integer NPOWER2(NPRIME), the powers of primes
%    in the representation of the second quantity.
%
%    Output, integer NPOWER3(NPRIME), the powers of primes
%    in the representation of the LCM.
%
  for i = 1 : nprime

    if ( npower1(i) < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'FAC_LCM - Fatal error!\n' );
      fprintf ( 1, '  One of the powers is negative!\n' );
      error ( 'FAC_LCM - Fatal error!' );
    end

    if ( npower2(i) < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'FAC_LCM - Fatal error!\n' );
      fprintf ( 1, '  One of the powers is negative!\n' );
      error ( 'FAC_LCM - Fatal error!' );
    end

    npower3(i) = max ( npower1(i), npower2(i) );

  end

  return
end
