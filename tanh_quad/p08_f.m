function fx = p08_f ( n, x )

%*****************************************************************************80
%
%% P08_F evaluates the integrand for problem 08.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Bailey, Karthik Jeyabalan, Xiaoye Li,
%    A Comparison of Three High-Precision Quadrature Schemes,
%    Experimental Mathematics,
%    Volume 14, Number 3, pages 317-329.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx(1:n) = atan ( sqrt ( 2.0 + x(1:n).^2 ) ) ...
    ./ ( 1.0 + x(1:n).^2 ) ...
    ./ sqrt ( 2.0 + x(1:n).^2 );

  return
end
