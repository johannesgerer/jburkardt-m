function yval = r8poly_der_val ( n, poly_cof, xval )

%*****************************************************************************80
%
%% R8POLY_DER_VAL evaluates the derivative of a polynomial in standard form.
%
%  Discussion:
%
%    A polynomial in standard form, with coefficients POLY_COF(*),
%    may be written:
%
%      P(X) = POLY_COF(1)
%           + POLY_COF(2) * X
%           ...
%           + POLY_COF(N) * X**(N-1)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the polynomial.
%
%    Input, real POLY_COF(1:N), the polynomial coefficients.
%    POLY_COF(1) is the constant term, and POLY_COF(N) is the coefficient of
%    X**(N-1).
%
%    Input, real XVAL, a value where the derivative of the
%    polynomial is to be evaluated.
%
%    Output, real YVAL, the value of the derivative of the
%    polynomial at XVAL.
%
  yval = ( n - 1 ) * poly_cof(n);

  for i = n-1 : -1 : 2
    yval = yval * xval + ( i - 1 ) * poly_cof(i);
  end

  return
end
