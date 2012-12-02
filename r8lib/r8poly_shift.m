function poly_cof = r8poly_shift ( scale, shift, n, poly_cof )

%*****************************************************************************80
%
%% R8POLY_SHIFT adjusts the coefficients of a polynomial for a new argument.
%
%  Discussion:
%
%    Assuming P(X) is a polynomial in the argument X, of the form:
%
%      P(X) =
%          C(N) * X**(N-1)
%        + ...
%        + C(2) * X
%        + C(1),
%
%    and that Z is related to X by the formula:
%
%      Z = SCALE * X + SHIFT
%
%    then this routine computes coefficients C for the polynomial Q(Z):
%
%      Q(Z) =
%          C(N) * Z**(N-1)
%        + ...
%        + C(2) * Z
%        + C(1)
%
%    so that:
%
%      Q(Z(X)) = P(X)
%
%  Example:
%
%    P(X) = 2 * X**2 - X + 6
%
%    Z = 2.0 * X + 3.0
%
%    Q(Z) = 0.5 *         Z**2 -  3.5 * Z + 12
%
%    Q(Z(X)) = 0.5 * ( 4.0 * X**2 + 12.0 * X +  9 )
%            - 3.5 * (               2.0 * X +  3 )
%                                            + 12
%
%            = 2.0         * X**2 -  1.0 * X +  6
%
%            = P(X)
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
%    Input, real SHIFT, SCALE, the shift and scale applied to X,
%    so that Z = SCALE * X + SHIFT.
%
%    Input, integer N, the order of the polynomial.
%
%    Input, real POLY_COF(N), the coefficient array in terms of the X variable.
%
%    Output, real POLY_COF(N), the coefficient array in terms of the Z variable.
%
  for i = 1 : n
    poly_cof(i+1:n) = poly_cof(i+1:n) / scale;
  end

  for i = 1 : n
    for j = n-1 : -1 : i
      poly_cof(j) = poly_cof(j) - shift * poly_cof(j+1);
    end
  end

  return
end
