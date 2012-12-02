function c = lm_polynomial_coefficients ( n, m )

%*****************************************************************************80
%
%% LM_POLYNOMIAL_COEFFICIENTS: coefficients of Laguerre polynomial Lm(n,m,x).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
%
%  Parameters:
%
%    Input, integer N, the highest order polynomial to compute.
%    Note that polynomials 0 through N will be computed.
%
%    Input, integer M, the parameter.
%
%    Output, real C(1:N+1,1:N+1), the coefficients of the
%    Laguerre polynomials of degree 0 through N.
%
  if ( n < 0 )
    c = [];
    return
  end

  c(1:n+1,1:n+1) = 0.0;

  c(1,1) = 1.0;

  if ( n == 0 )
    return
  end

  c(2,1) = m + 1;
  c(2,2) = -1.0;
 
  for i = 2 : n

    c(i+1,1:i+1) = ( (   m + 2 * i - 1 ) * c(i,1:i+1)     ...
               +     ( - m     - i + 1 ) * c(i-1,1:i+1) ) ...
               /                 i;

    c(i+1,2:i+1) = c(i+1,2:i+1) - c(i,1:i) / i;

  end

  return
end
