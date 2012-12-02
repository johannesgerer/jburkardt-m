function fx = p55_fun ( n, x )

%*****************************************************************************80
%
%% P55_FUN evaluates the integrand for problem 55.
%
%  Interval:
%
%    a = 0 <= x <= 1 = b
%
%  Integrand:
%
%    exp ( - c^2 * ( x - x0 )^2 )
%
%  Exact Integral:
%
%    sqrt ( pi )
%    * ( erf ( c * ( b - x0 ) ) - erf ( c * ( a - x0 ) ) )
%    / ( 2 * c )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  c = p55_param ( 'get', 'c', [] );
  x0 = p55_param ( 'get', 'x0', [] );
  x0 = x0 * ones ( size ( x ) );

  fx(1:n) = exp ( - c * c * ( x(1:n) - x0 ).^2 );

  return
end
