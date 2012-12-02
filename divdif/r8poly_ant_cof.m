function poly_cof2 = r8poly_ant_cof ( n, poly_cof )

%*****************************************************************************80
%
%% R8POLY_ANT_COF integrates a polynomial in standard form.
%
%  Discussion:
%
%    The antiderivative of a polynomial P(X) is any polynomial Q(X)
%    with the property that d/dX Q(X) = P(X).
%
%    This routine chooses the antiderivative whose constant term is zero.
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
%    POLY_COF(1) is the constant term, and POLY_COF(N) is the
%    coefficient of X**(N-1).
%
%    Output, real POLY_COF2(1:N+1), the coefficients of
%    the antiderivative polynomial, in standard form.  The constant
%    term is set to zero.
%

%
%  Set the constant term.
%
  poly_cof2(1) = 0.0;
%
%  Integrate the polynomial.
%
  for i = 2 : n + 1
    poly_cof2(i) = poly_cof(i-1) / ( i - 1 );
  end

  return
end
