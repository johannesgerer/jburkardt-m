function cx = r8poly_val_horner ( n, c, x )

%*****************************************************************************80
%
%% R8POLY_VAL_HORNER evaluates a polynomial using Horner's method.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the degree of the polynomial.
%
%    Input, real C(1:N+1), the polynomial coefficients.
%    C(I+1) is the coefficient of X**I.
%
%    Input, real X, the point at which the polynomial is to be evaluated.
%
%    Output, real CX, the value of the polynomial at X.
%
  cx = c(n+1);
  for i = n - 1 : -1 : 0
    cx = cx * x + c(i+1);
  end

  return
end
