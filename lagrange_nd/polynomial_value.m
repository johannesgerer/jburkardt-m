function p = polynomial_value ( d, o, c, e, nx, x )

%*****************************************************************************80
%
%% POLYNOMIAL_VALUE evaluates a polynomial.
%
%  Discussion:
%
%    The polynomial is evaluated term by term, and no attempt is made to
%    use an approach such as Horner's method to speed up the process.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 December 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer D, the spatial dimension.
%
%    Input, integer O, the "order" of the polynomial.
%
%    Input, real C(O), the coefficients of the polynomial.
%
%    Input, integer E(O), the indices of the exponents of the polynomial.
%
%    Input, integer NX, the number of evaluation points.
%
%    Input, real X(D,NX), the coordinates of the evaluation points.
%
%    Output, real P(NX), the value of the polynomial at X.
%  
  p = zeros ( nx, 1 );

  for j = 1 : o
    f = mono_unrank_grlex ( d, e(j) );
    v = mono_value ( d, nx, f, x );
    p(1:nx) = p(1:nx) + c(j) * v(1:nx);
  end

  return
end

