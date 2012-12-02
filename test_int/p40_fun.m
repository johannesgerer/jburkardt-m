function fx = p40_fun ( n, x )

%*****************************************************************************80
%
%% P40_FUN evaluates the integrand for problem 40.
%
%  Discussion:
%
%    The problem has a parameter ALPHA that can be set by calling
%    P40_PARAM_SET.
%
%    The integrand has a singularity at an internal point ( x = pi/4 ).
%
%    The suggested range for ALPHA is -0.8 through 2.1.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    ( abs ( x - pi/4 ) )^alpha
%
%  Exact Integral:
%
%    ( (1-pi/4)^(alpha+1) + (pi/4)^(alpha+1) ) / ( alpha + 1 )
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
  alpha = p40_param_get ( );

  fx = ( abs ( x - 0.25 * pi ) ).^alpha;

  return
end
