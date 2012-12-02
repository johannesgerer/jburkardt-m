function f = p13_f ( n, x )

%*****************************************************************************80
%
%% P13_F evaluates the objective function for problem 13.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  s1 = sum ( cos ( x(1:n) ) );

  f = 0.0;
  for j = 1 : n
    t =  ( n + j ) - sin ( x(j) ) - s1 - j * cos ( x(j) );
    f = f + t * t;
  end

  return
end
