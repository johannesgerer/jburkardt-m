function fx = p44_fun ( n, x )

%*****************************************************************************80
%
%% P44_FUN evaluates the integrand for problem 57.
%
%  Discussion:
%
%    The problem has a parameter ALPHA that can be set by calling
%    P44_PARAM_SET.
%
%    The suggested parameter range is 0.0 <= ALPHA <= 9.0.
%
%    As ALPHA increases, the integrand becomes more oscillatory.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    exp ( 20 * ( x - 1 ) ) * sin ( 2^alpha * x )
%
%  Exact Integral:
%
%    ( 20 sin ( 2^alpha ) - 2^alpha cos ( 2^alpha )
%    + 2^alpha exp ( -20 ) ) / ( 400 + 4^alpha )
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
%    Springer, 1983, page 84.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  alpha = p44_param_get ( );

  fx = exp ( 20.0 * ( x(1:n) - 1.0 ) ) .* sin ( 2.0^alpha * x(1:n) );

  return
end
