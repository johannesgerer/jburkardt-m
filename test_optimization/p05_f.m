function f = p05_f ( m, n, x )

%*****************************************************************************80
%
%% P05_F evaluates the objective function for problem 05.
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

  for j = 1 : n

    f(j) = 10 * m;

    for i = 1 : m
      f(j) = f(j) + x(i,j)^2 - 10.0 * cos ( 2.0 * pi * x(i,j) );
    end

  end

  return
end
