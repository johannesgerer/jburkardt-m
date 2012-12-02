function value = jacobi_integral ( expon, alpha, beta )

%*****************************************************************************80
%
%% JACOBI_INTEGRAL evaluates the integral of a monomial with Jacobi weight.
%
%  Discussion:
%
%    VALUE = Integral ( -1 <= X <= +1 ) x^EXPON (1-x)^ALPHA (1+x)^BETA dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer EXPON, the exponent.
%
%    Input, real ALPHA, the exponent of (1-X) in the weight factor.
%
%    Input, real BETA, the exponent of (1+X) in the weight factor.
%
%    Output, real VALUE, the value of the integral.
%
  c = expon;

  if ( mod ( expon, 2 ) == 0 )
    s = +1.0;
  else
    s = -1.0;
  end

  arg1 = - alpha;
  arg2 =   1.0 + c;
  arg3 =   2.0 + beta + c;
  arg4 = - 1.0;

  value1 = r8_hyper_2f1 ( arg1, arg2, arg3, arg4 );

  arg1 = - beta;
  arg2 =   1.0 + c;
  arg3 =   2.0 + alpha + c;
  arg4 = - 1.0;

  value2 = r8_hyper_2f1 ( arg1, arg2, arg3, arg4 );

  value = gamma ( 1.0 + c ) * ( ...
      s * gamma ( 1.0 + beta  ) * value1 ...
    / gamma ( 2.0 + beta  + c ) ...
    +     gamma ( 1.0 + alpha ) * value2 ...
    / gamma ( 2.0 + alpha + c ) );

  return
end
