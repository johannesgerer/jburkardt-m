function value = r8poly_nval ( n, a, xarray, x )

%*****************************************************************************80
%
%% R8POLY_NVAL evaluates a real polynomial in Newton form.
%
%  Definition:
%
%    The Newton form of a polynomial is;
%
%      p(x) = a(1)
%           + a(2)  *(x-x1)
%           + a(3)  *(x-x1)*(x-x2)
%           +...
%           + a(n-1)*(x-x1)*(x-x2)*(x-x3)...*(x-x(n-2))
%           + a(n)  *(x-x1)*(x-x2)*(x-x3)...*(x-x(n-2))*(x-x(n-1))
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of A.
%
%    Input, real A(N), the coefficients of the polynomial.
%    A(1) is the constant term.
%
%    Input, real XARRAY(N-1), the N-1 points X which are part
%    of the definition of the polynomial.
%
%    Input, real X, the point at which the polynomial is to be evaluated.
%
%    Output, real VALUE, the value of the polynomial at X.
%
  value = a(n);
  for i = n-1 : -1 : 1
    value = a(i) + ( x - xarray(i) ) * value;
  end

  return
end
