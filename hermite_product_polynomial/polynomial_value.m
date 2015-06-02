function p = polynomial_value ( m, o, c, e, n, x )

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
%    Input, integer M, the spatial dimension.
%
%    Input, integer O, the "order" of the polynomial.
%
%    Input, real C(O), the coefficients of the polynomial.
%
%    Input, integer E(O), the indices of the exponents of the polynomial.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(M,N), the coordinates of the evaluation points.
%
%    Output, real P(N), the value of the polynomial at X.
%  
  p = zeros ( n, 1 );

  for j = 1 : o
    f = mono_unrank_grlex ( m, e(j) );
    v = mono_value ( m, n, f, x );
    p(1:n) = p(1:n) + c(j) * v(1:n);
  end

  return
end

