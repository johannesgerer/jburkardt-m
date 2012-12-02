function yval = r8poly_ant_val ( n, poly_cof, xval )

%*****************************************************************************80
%
%% R8POLY_ANT_VAL evaluates the antiderivative of a polynomial in standard form.
%
%  Discussion:
%
%    The constant term of the antiderivative is taken to be zero.
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
%    Input, real XVAL, the point where the antiderivative is to be
%    evaluated.
%
%    Output, real YVAL, the value of the antiderivative of
%    the polynomial at XVAL.
%
  yval = 0.0;

  for i = n : -1 : 1
    yval = ( yval + poly_cof(i) / i ) * xval;
  end

  return
end
