function value = he_double_product_integral ( i, j )

%*****************************************************************************80
%
%% HE_DOUBLE_PRODUCT_INTEGRAL: integral of He(i,x)*He(j,x)*e^(-x^2/2).
%
%  Discussion:
%
%    He(i,x) represents the probabilist's Hermite polynomial.
%
%    VALUE = integral ( -oo < x < +oo ) H(i,x)*H(j,x) exp(-x^2/2) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, the polynomial indices.
%
%    Output, real VALUE, the value of the integral.
%
  if ( i ~= j )
    value = 0.0;
  else
    value = r8_factorial ( i );
  end

  return
end
