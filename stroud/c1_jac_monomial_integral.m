function value = c1_jac_monomial_integral ( alpha, beta, expon )

%*****************************************************************************80
%
%% C1_JAC_MONOMIAL_INTEGRAL: integral of a monomial with Jacobi weight over C1.
%
%  Discussion:
%
%    value = integral ( -1 <= x <= +1 ) x^expon (1-x)^alpha (1+x)^beta dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the exponent of (1-X) in the weight factor.
%
%    Input, real BETA, the exponent of (1+X) in the weight factor.
%
%    Input, integer EXPON, the exponent.
%
%    Output, real VALUE, the value of the integral.
%
  c = expon;

  if ( mod ( expon, 2 ) == 0 )
    s = +1.0;
  else
    s = -1.0;
  end

  arg1 = - alpha;;
  arg2 =   1.0 + c;
  arg3 =   2.0 + beta + c;
  arg4 = - 1.0;

  value1 = r8_hyper_2f1 ( arg1, arg2, arg3, arg4 );

  arg1 = - beta;
  arg2 =   1.0 + c;
  arg3 =   2.0 + alpha + c;
  arg4 = - 1.0;

  value2 = r8_hyper_2f1 ( arg1, arg2, arg3, arg4 );

  value = gamma ( 1.0 + c ) ...
    * ( s * gamma ( 1.0 + beta  ) * value1 / gamma ( 2.0 + beta  + c ) ...
    +       gamma ( 1.0 + alpha ) * value2 / gamma ( 2.0 + alpha + c ) );

  return
end
