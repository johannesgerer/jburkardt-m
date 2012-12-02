function value = j_double_product_integral ( i, j, a, b )

%*****************************************************************************80
%
%% J_DOUBLE_PRODUCT_INTEGRAL: integral of J(i,x)*J(j,x)*(1-x)^a*(1+x)^b.
%
%  Discussion:
%
%    VALUE = integral ( -1 <= x <= +1 ) J(i,x)*J(j,x)*(1-x)^a*(1+x)^b dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, the polynomial indices.
%
%    Input, real A, B, the parameters.
%    -1 < A, B.
%
%    Output, real VALUE, the value of the integral.
%
  if ( i ~= j )
    value = 0.0;
  else
    value = 2^( a + b + 1.0 ) / ( 2 * i + a + b + 1 ) ...
      * gamma ( i + a + 1 ) * gamma ( i + b + 1 ) ...
      / r8_factorial ( i ) / gamma ( i + a + b + 1 );
  end

  return
end
