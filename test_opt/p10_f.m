function f = p10_f ( n, x )

%*****************************************************************************80
%
%% P10_F evaluates the objective function for problem 10.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
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
  f = ( x(1) - 1000000.0 )^2 ...
    + ( x(2) - 0.000002 )^2 ...
    + ( x(1) * x(2) - 2.0 )^2;

  return
end
