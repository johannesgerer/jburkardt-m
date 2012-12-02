function fx = p18_fun ( n, x )

%*****************************************************************************80
%
%% P18_FUN evaluates the integrand for problem 18.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    x / ( exp ( x ) + 1 )
%
%  Approximate Integral (20 digits):
%
%    0.17055734950243820437...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Hermann Engels,
%    Numerical Quadrature and Cubature,
%    Academic Press, 1980.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx = x ./ ( exp ( x ) + 1.0 );

  return
end
