function f = p05_f ( n, x )

%*****************************************************************************80
%
%% P05_F evaluates the objective function for problem 5.
%
%  Discussion:
%
%    The function is formed by the sum of squares of 10 separate terms.
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
  f = 0.0;

  for i = 1 : 10

    c = - i / 10.0;

    fi = exp ( c * x(1) ) - exp ( c * x(2) ) - x(3) * ...
      ( exp ( c ) - exp ( 10.0 * c ) );

    f = f + fi * fi;

  end

  return
end
