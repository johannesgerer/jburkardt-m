function p = r8poly_value_2d ( m, c, n, x, y )

%*****************************************************************************80
%
%% R8POLY_VALUE_2D evaluates a polynomial in 2 variables, X and Y.
%
%  Discussion:
%
%    We assume the polynomial is of total degree M, and has the form:
%
%      p(x,y) = c00 
%             + c10 * x                + c01 * y
%             + c20 * x^2   + c11 * xy + c02 * y^2
%             + ...
%             + cm0 * x^(m) + ...      + c0m * y^m.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the degree of the polynomial.
%
%    Input, real C(T(M+1),1), the polynomial coefficients.  C(1) is
%    the constant term.  T(M+1) is the M+1-th triangular number.
%    The coefficients are stored consistent with the following ordering
%    of monomials: 1, X, Y, X^2, XY, Y^2, X^3, X^2Y, XY^2, Y^3, X^4, ...
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N,1), Y(N,1), the evaluation points.
%
%    Output, real P(N,1), the value of the polynomial at the evaluation points.
%
  p = zeros ( n, 1 );

  j = 0;
  for s = 0 : m
    for ex = s : -1 : 0
      ey = s - ex;
      j = j + 1;
      p(1:n,1) = p(1:n,1) + c(j,1) * x(1:n,1) .^ ex .* y(1:n,1) .^ ey; 
    end
  end

  return
end
