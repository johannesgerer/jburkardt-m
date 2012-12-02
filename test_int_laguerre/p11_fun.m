function fx = p11_fun ( n, x )

%*****************************************************************************80
%
%% P11_FUN evaluates the integrand for problem 11.
%
%  Discussion:
%
%    S&S gives exact value as pi =  3.1415926535897932385...
%    S&S gives Laguerre(16) as      2.6652685196...
%    S&S gives EXP_TRANSFORM(16) as 2.3629036166... 
%
%  Integral:
%
%    Integral ( 0 <= x < +oo ) 1/((1+x)*sqrt(x)) dx
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
      fx(i) = 0.0;
    else
      fx(i) = 1.0 / ( ( 1.0 + x(i) ) * sqrt ( x(i) ) );
    end
  end

  return
end
