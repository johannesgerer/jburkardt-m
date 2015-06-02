function fx = p13_fun ( n, x )

%*****************************************************************************80
%
%% P13_FUN evaluates the integrand for problem 13.
%
%  Discussion:
%
%    S&S gives exact value as pi/2 = 1.5707963267948966192...
%    S&S gives Laguerre(16) as       1.4399523793...
%    S&S gives EXP_TRANSFORM(16) as  1.3045186595...
%
%  Integral:
%
%    Integral ( 0 <= x < +oo ) sin ( x ) dx / x
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud, Don Secrest,
%    Gaussian Quadrature Formulas,
%    Prentice Hall, 1966,
%    LC: QA299.4G3S7.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the function values.
%
  for i = 1 : n
    if ( x(i) == 0.0 )
      fx(i) = 1.0;
    else
      fx(i) = sin ( x(i) ) / x(i);
    end
  end

  return
end
