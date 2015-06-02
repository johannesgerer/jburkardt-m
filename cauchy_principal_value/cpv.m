function value = cpv ( f, a, b, n )

%*****************************************************************************80
%
%% CPV estimates the Cauchy Principal Value of an integral.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/cauchy_principal_value/cpv.m
%
%  Discussion:
%
%    This function can be used to estimate the Cauchy Principal Value of
%    a singular integral of the form 
%      Integral f(t)/(t-x) dt 
%    over an interval which includes the singularity point t=x.
%
%    Isolate the singularity at x in a symmetric interval of finite size delta:
%
%        CPV ( Integral ( a         <= t <= b         ) p(t) / ( t - x ) dt )
%      =       Integral ( a         <= t <= x - delta ) p(t) / ( t - x ) dt
%      + CPV ( Integral ( x - delta <= t <= x + delta ) p(t) / ( t - x ) dt )
%      +       Integral ( x + delta <= t <= b         ) p(t) / ( t - x ) dt.
%
%    We assume the first and third integrals can be handled in the usual way.
%    The second integral can be rewritten as
%      Integral ( -1 <= s <= +1 ) ( p(s*delta+x) - p(x) ) / s ds
%    and approximated by
%      Sum ( 1 <= i <= N ) w(i) * ( p(xi*delta+x) - p(x) ) / xi(i)
%    = Sum ( 1 <= i <= N ) w(i) * ( p(xi*delta+x) ) / xi(i)
%    if we assume that N is even, so that coefficients of p(x) sum to zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Julian Noble,
%    Gauss-Legendre Principal Value Integration,
%    Computing in Science and Engineering,
%    Volume 2, Number 1, January-February 2000, pages 92-95.
%
%  Parameters:
%
%    Input, function handle F, a handle to the function that evaluates the
%    integrand.
%
%    Input, real A, B, the endpoints of the symmetric interval, which contains
%    a singularity of the form 1/(X-(A+B)/2).
%
%    Input, integer N, the number of Gauss points to use.
%    N must be even.
%
%    Output, real VALUE, the estimated Cauchy Principal Value.
%

%
%  N must be even.
%
  if ( mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CPV - Fatal error!\n' );
    fprintf ( 1, '  N must be even.\n' );
    error ( 'CPV - Fatal error!' ); 
  end
%
%  Get the Gauss-Legendre rule.
%
  [ x, w ] = legendre_set ( n );
%
%  Estimate the integral.
%
  value = 0.0;
  for i = 1 : n
    x2 = ( ( 1.0 - x(i) ) * a   ...
         + ( 1.0 + x(i) ) * b ) ...
         /   2.0;
    value = value + w(i) * ( f ( x2 ) ) / x(i);
  end

  return
end
