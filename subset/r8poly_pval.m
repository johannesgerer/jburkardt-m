function value = r8poly_pval ( n, a, x )

%*****************************************************************************80
%
%% R8POLY_PVAL evaluates a real polynomial in power sum form.
%
%  Discussion:
%
%    The power sum form is:
%
%      p(x) = a(0) + a(1) * x + ... + a(n-1) * x**(n-1) + a(n) * x**(n)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of A.
%
%    Input, real A(1:N+1), the coefficients of the polynomial.
%    A(1) is the constant term.
%
%    Input, real X, the point at which the polynomial is to be evaluated.
%
%    Output, real VALUE, the value of the polynomial at X.
%
  value = 0.0;
  for i = n : -1 : 0
    value = value * x + a(i+1);
  end

  return
end
