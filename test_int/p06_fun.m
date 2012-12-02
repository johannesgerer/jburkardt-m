function fx = p06_fun ( n, x )

%*****************************************************************************80
%
%% P06_FUN evaluates the integrand for problem 6.
%
%  Interval:
%
%    -1 <= x <= 1
%
%  Integrand:
%
%    sqrt ( abs ( x + 0.5 ) )
%
%  Exact Integral:
%
%    ( sqrt ( 2 ) + 3 * sqrt ( 6 ) ) / 6 = 1.460447131787105
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
%    Charles Clenshaw, Alan Curtis,
%    A Method for Numerical Integration on an Automatic Computer,
%    Numerische Mathematik,
%    Volume 2, Number 1, December 1960, pages 197-205.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx = sqrt ( abs ( x + 0.5 ) );

  return
end
