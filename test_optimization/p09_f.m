function f = p09_f ( m, n, x )

%*****************************************************************************80
%
%% P09_F evaluates the objective function for problem 09.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Marcin Molga, Czeslaw Smutnicki,
%    Test functions for optimization needs.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of arguments.
%
%    Input, real X(M,N), the arguments.
%
%    Output, real F(N), the function evaluated at the arguments.
%
  f = zeros ( n, 1 );

  a = 20.0;
  b = 0.2;
  c = 0.2;

  for j = 1 : n
    f(j) = - a * exp ( - b * sqrt ( sum ( x(1:m,j).^2 ) / m ) ) ...
      - exp ( sum ( cos ( c * pi * x(1:m,j) ) ) / m ) ...
      + a + exp ( 1.0 );
  end

  return
end
