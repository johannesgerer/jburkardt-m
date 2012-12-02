function f = p05_f ( n, x )

%*****************************************************************************80
%
%% P05_F returns the integrand for problem 5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the arguments.
%
%    Output, real F(N), the values of the integrand.
%
  x = x(:);
  
  base = 2;
  
  f = 0.2 * ones ( n, 1 );
  x(1:n) = 8.0 * x(1:n);

  for i = 1 : 3
    f(1:n) = f(1:n) + mod ( x(1:n), base ) / base;
    x(1:n) = floor ( x(1:n) ./ base );
  end

  return
end
