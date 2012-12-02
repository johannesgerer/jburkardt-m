function f = p03_f ( n, x )

%*****************************************************************************80
%
%% P03_F evaluates the objective function for problem 3.
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
  y = p03_yvec ( );

  f = 0.0;

  for i = 1 : 15

    t = x(1) * exp ( - 0.5 * x(2) * ...
      ( 3.5 - 0.5 * ( i - 1 ) - x(3) )^2 ) - y(i);

    f = f + t * t;

  end

  return
end
