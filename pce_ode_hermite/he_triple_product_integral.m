function value = he_triple_product_integral ( i, j, k )

%*****************************************************************************80
%
%% HE_TRIPLE_PRODUCT_INTEGRAL: integral of He(i,x)*He(j,x)*He(k,x)*e^(-x^2/2).
%
%  Discussion:
%
%    VALUE = integral ( -oo < x < +oo ) He(i,x)*He(j,x)*He(k,x) exp(-x^2/2) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dongbin Xiu,
%    Numerical Methods for Stochastic Computations: A Spectral Method Approach,
%    Princeton, 2010,
%    ISBN13: 978-0-691-14212-8,
%    LC: QA274.23.X58.
%
%  Parameters:
%
%    Input, integer I, J, K, the polynomial indices.
%
%    Output, real VALUE, the value of the integral.
%
  s = floor ( ( i + j + k ) / 2 );

  if ( s < i || s < j || s < k )
    value = 0.0;
  elseif ( mod ( i + j + k, 2 ) ~= 0 )
    value = 0.0;
  else
    value = r8_factorial ( i ) / r8_factorial ( s - i ) ...
          * r8_factorial ( j ) / r8_factorial ( s - j ) ...
          * r8_factorial ( k ) / r8_factorial ( s - k );
  end

  return
end
