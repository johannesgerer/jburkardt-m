function f = p30_fun ( n, x )

%*****************************************************************************80
%
%% P30_FUN evaluates the integrand for problem 30.
%
%  Interval:
%
%    2 <= x <= 7
%
%  Integrand:
%
%          cos (       x )
%    + 5 * cos ( 1.6 * x )
%    - 2 * cos ( 2.0 * x )
%    + 5 * cos ( 4.5 * x )
%    + 7 * cos ( 9.0 * x )
%
%  Antiderivative:
%
%          sin (       x )
%    + 5 * sin ( 1.6 * x ) / 1.6
%    - 2 * sin ( 2.0 * x ) / 2.0
%    + 5 * sin ( 4.5 * x ) / 4.5
%    + 7 * sin ( 9.0 * x ) / 9.0
%
%  Exact Integral:
%
%    -4.5275696251606720278
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dianne OLeary,
%    Scientific Computing with Case Studies,
%    SIAM, 2008,
%    ISBN13: 978-0-898716-66-5,
%     LC: QA401.O44.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  f =     cos (       x ) ...
    + 5 * cos ( 1.6 * x ) ...
    - 2 * cos ( 2.0 * x ) ...
    + 5 * cos ( 4.5 * x ) ...
    + 7 * cos ( 9.0 * x );

  return
end
