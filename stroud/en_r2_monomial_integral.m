function value = en_r2_monomial_integral ( n, alpha )

%*****************************************************************************80
%
%% EN_R2_MONOMIAL_INTEGRAL evaluates monomial integrals in EN_R2.
%
%  Discussion:
%
%    ALPHA is the set of polynomial exponents.
%
%    EN_R2 is the entire N-dimensional space with weight function
%
%      w(x) = exp ( - x1^2 - x2^2 ... - xn^2 ) 
%
%    The integral to be evaluated is
%
%      value = integral ( EN ) x(1)^alpha(1) * x(2)^alpha(2) * ... 
%        * x(n)^alpha(n) * w(x) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Input, integer ALPHA(N), the polynomial exponents.
%    0 <= ALPHA(*).
%
%    Output, real VALUE, the value of the integral.
%
  if ( any ( alpha(1:n) < 0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EN_R2_MONOMIAL_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  Some ALPHA(I) < 0.\n' );
    error ( 'EN_R2_MONOMIAL_INTEGRAL' );
  elseif ( any ( mod ( alpha, 2 ) == 1 ) )
    value = 0.0;
  else
    arg = ( alpha(1:n) + 1.0 ) / 2.0;
    value = prod ( gamma ( arg ) );
  end

  return
end
