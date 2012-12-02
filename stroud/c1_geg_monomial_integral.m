function value = c1_geg_monomial_integral ( alpha, expon )

%*****************************************************************************80
%
%% C1_GEG_MONOMIAL_INTEGRAL: integral of monomial with Gegenbauer weight on C1.
%
%  Discussion:
%
%    C1_GEG is the interval [-1,+1] with the Gegenbauer weight function
%
%      w(alpha;x) = (1-x^2)^alpha
%
%    with -1.0 < alpha.
%
%    value = integral ( -1 <= x <= +1 ) x^expon (1-x^2)^alpha dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the exponent of (1-X^2).
%    - 1.0 < ALPHA.
%
%    Input, integer EXPON, the exponent.
%    0 <= EXPON.
%
%    Output, real VALUE, the value of the integral.
%
  if ( alpha <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'C1_GEG_MONOMIAL_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  ALPHA <= -1.0\n' );
    error ( 'C1_GEG_MONOMIAL_INTEGRAL - Fatal error!' );
  end

  if ( mod ( expon, 2 ) == 1 )
    value = 0.0;
    return
  end

  c = expon;

  arg1 = - alpha;
  arg2 =   1.0 + c;
  arg3 =   2.0 + alpha + c;
  arg4 = - 1.0;

  value1 = r8_hyper_2f1 ( arg1, arg2, arg3, arg4 );

  value = 2.0 * gamma ( 1.0 + c ) * gamma ( 1.0 + alpha ) ...
    * value1 / gamma ( 2.0 + alpha  + c );

  return
end
