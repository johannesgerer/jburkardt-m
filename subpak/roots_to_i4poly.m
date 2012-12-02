function c = roots_to_i4poly ( n, x )

%*****************************************************************************80
%
%% ROOTS_TO_I4POLY converts polynomial roots to polynomial coefficients.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of roots specified.
%
%    Input, integer X(N), the roots.
%
%    Output, integer C(1:N+1), the coefficients of the polynomial.
%

%
%  Initialize C to (0, 0, ..., 0, 1).
%  Essentially, we are setting up a divided difference table.
%
  c(1:n) = 0;
  c(n+1) = 1;
%
%  Convert to standard polynomial form by shifting the abscissas
%  of the divided difference table to 0.
%
  for j = 1 : n
    for i = 1 : n+1-j
      c(n-i) = c(n-i) - x(n+1-i-j+1) * c(n-i+1);
    end
  end

  return
end
