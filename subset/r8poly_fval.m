function value = r8poly_fval ( n, a, x )

%*****************************************************************************80
%
%% R8POLY_FVAL evaluates a real polynomial in factorial form.
%
%  Discussion:
%
%    The (falling) factorial form of a polynomial is:
%
%      p(x) = a(1)
%           + a(2)  *x
%           + a(3)  *x*(x-1)
%           +...
%           + a(n-1)*x*(x-1)*(x-2)...*(x-(n-3))
%           + a(n)  *x*(x-1)*(x-2)...*(x-(n-3))*(x-(n-2))
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
%    Input, real X, the point at which the polynomial is to be evaluated.
%
%    Output, real VALUE, the value of the polynomial at X.
%
  value = 0.0;
  for i = 1 : n
    value = a(n+1-i) + ( x - n + i ) * value;
  end

  return
end
