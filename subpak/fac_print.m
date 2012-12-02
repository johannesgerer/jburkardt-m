function fac_print ( nprime, npower )

%*****************************************************************************80
%
%% FAC_PRINT prints a product of prime factors.
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
%    in the representation of the quantity.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '       Prime     Power\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nprime
    if ( npower(i) ~= 0 )
      fprintf ( 1, '%12d  %8d\n', prime(i), npower(i) );
    end
  end

  return
end
