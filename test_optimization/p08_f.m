function f = p08_f ( m, n, x )

%*****************************************************************************80
%
%% P08_F evaluates the objective function for problem 08.
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

  y = r8vec_indicator ( m );
  y(1:m,1) = y(1:m,1) + 1.0;

  for j = 1 : n
    f(j) = sum ( abs ( x(1:m,j) ).^y(1:m) );
  end

  return
end
