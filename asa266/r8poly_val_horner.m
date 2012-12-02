function yval = r8poly_val_horner ( n, poly_cof, xval )

%*****************************************************************************80
%
%% R8POLY_VAL_HORNER evaluates a polynomial in standard form.
%
%  Discussion:
%
%    A polynomial in standard form, with coefficients POLY_COF(*),
%    may be written:
%
%      P(X) = C(1)
%           + C(2) * X
%           ...
%           + C(N) * X**(N-1)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
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
%    Input, real XVAL, a value where the polynomial is to
%    be evaluated.
%
%    Output, real YVAL, the value of the polynomial at XVAL.
%
  yval = 0.0;
  for i = n : -1 : 1
    yval = yval * xval + poly_cof(i);
  end

  return
end
