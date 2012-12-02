function fx = p39_fun ( n, x )

%*****************************************************************************80
%
%% P39_FUN evaluates the integrand for problem 39.
%
%  Discussion:
%
%    The problem has a parameter ALPHA that can be set by calling
%    P39_PARAM_SET.
%
%    The integrand has a singularity at an internal point ( x = 1/3 )
%    with small binary period.
%
%    The suggested range for ALPHA is -0.8 through 2.1.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    ( abs ( x - 1/3 ) )^alpha
%
%  Exact Integral:
%
%    ( (2/3)^(alpha+1) + (1/3)^(alpha+1) ) / ( alpha + 1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2009
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
  alpha = p39_param_get ( );

  fx = ( abs ( x - 1.0 / 3.0 ) ).^alpha;

  if ( alpha <= 0.0 )
    i = ( abs ( x - 1.0 / 3.0 ) == 0 );
    fx(i) = 0.0;
  end

  return
end
