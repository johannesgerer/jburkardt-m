function f = p07_f ( m, n, x )

%*****************************************************************************80
%
%% P07_F returns the objective function value for problem 5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Langerman10 reference?
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of arguments.
%
%    Input, real X(M,N), the arguments.
%
%    Output, real F(N), the function values.
%
  f = zeros ( n, 1 );

  a = [ ...
    3.0, 5.0; ...
    5.0, 2.0; ...
    2.0, 1.0; ...
    1.0, 4.0; ...
    7.0, 9.0 ]';

  c = [ 1.0, 2.0, 5.0, 2.0, 3.0 ]';

  for j = 1 : n
    for k = 1 : 5
      arg = norm ( x(1:m,j) - a(1:m,k) );
      f(j) = f(j) - c(k) * exp ( - arg^2 / pi ) * cos ( pi * arg );
    end
  end

  return
end
