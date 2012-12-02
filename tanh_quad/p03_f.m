function fx = p03_f ( n, x )

%*****************************************************************************80
%
%% P03_F evaluates the integrand for problem 03.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2009
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
  fx(1:n) = 3.0 * x(1:n).^2;

  return
end
