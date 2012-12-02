function cp = r8poly_deriv ( n, c, p )

%*****************************************************************************80
%
%% R8POLY_DERIV returns the derivative of a polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 May 2005
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
%    Input, integer P, the order of the derivative.
%    0 means no derivative is taken.
%    1 means first derivative,
%    2 means second derivative and so on.
%    Values of P less than 0 are meaningless.  Values of P greater
%    than N are meaningful, but the code will behave as though the
%    value of P was N.
%
%    Output, real CP(1:N+1-P), the polynomial coefficients of
%    the derivative.
%
  if ( n <= p )
    cp(1) = 0.0;
    return
  end

  cp_temp(1:n+1) = c(1:n+1);

  for d = 1 : p
    for i = 0 : n-d
      cp_temp(i+1) = ( i + 1 ) * cp_temp(i+2);
    end
    cp_temp(n-d+2) = 0.0;
  end

  cp(1:n+1-p) = cp_temp(1:n+1-p);

  return
end
