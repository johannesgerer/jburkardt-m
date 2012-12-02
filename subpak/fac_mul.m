function npower3 = fac_mul ( nprime, npower1, npower2 )

%*****************************************************************************80
%
%% FAC_MUL multiplies two quantities represented as prime factors.
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
%    in the representation of the product.
%
  npower3(1:nprime) = npower1(1:nprime) + npower2(1:nprime);

  return
end
