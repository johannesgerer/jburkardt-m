function poly_cof2 = r8poly_der_cof ( n, poly_cof )

%*****************************************************************************80
%
%% R8POLY_DER_COF computes the coefficients of the derivative of a polynomial.
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
%    Input, real POLY_COF(1:N), the coefficients of the
%    polynomial to be differentiated.  POLY_COF(1) is the constant term, and
%    POLY_COF(N) is the coefficient of X**(N-1).
%
%    Output, real POLY_COF2(1:N-1), the coefficients of the
%    derivative of the polynomial.
%
  for i = 1 : n-1
    poly_cof2(i) = i * poly_cof(i+1);
  end

  return
end
