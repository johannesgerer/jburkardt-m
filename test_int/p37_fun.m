function fx = p37_fun ( n, x )

%*****************************************************************************80
%
%% P37_FUN evaluates the integrand for problem 37.
%
%  Discussion:
%
%    The problem has a parameter ALPHA that can be set by calling
%    P37_PARAM_SET.  It had a default value of 5.0.
%
%    The integrand has a peak of height 4^ALPHA at X = PI/4.
%
%    Suggested values of ALPHA include 0 through 20.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    4^(-ALPHA) / ( ( x - PI/4 )^2 + 16^(-ALPHA) )
%
%  Exact Integral:
%
%    atan ( ( 4 - PI ) * 4^(ALPHA-1) ) + atan ( PI * 4^(ALPHA-1) )
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
  alpha = p37_param_get ( );

  fx = 4.0^( -alpha ) ./ ( ( x - 0.25 * pi ).^2 + 16.0^(-alpha) );

  return
end
