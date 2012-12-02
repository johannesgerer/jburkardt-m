function fx = p38_fun ( n, x )

%*****************************************************************************80
%
%% P38_FUN evaluates the integrand for problem 38.
%
%  Discussion:
%
%    The problem has a parameter ALPHA that can be set by calling
%    P38_PARAM_SET.
%
%    The integrand oscillates more strongly as ALPHA is increased.
%
%    The suggested range for ALPHA is 0 to 10.
%
%  Interval:
%
%    0 <= x <= pi
%
%  Integrand:
%
%    cos ( 2^ALPHA * sin ( x ) )
%
%  Exact Integral:
%
%    pi * J0 ( 2^ALPHA )
%
%    where J0 ( x ) is the J Bessel function of order 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Piessens, Elise de Doncker-Kapenga,
%    Christian Ueberhuber, David Kahaner,
%    QUADPACK: A Subroutine Package for Automatic Integration,
%    Springer, 1983, page 83.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  alpha = p38_param_get ( );

  fx = cos ( 2.0^alpha * sin ( x ) );

  return
end
