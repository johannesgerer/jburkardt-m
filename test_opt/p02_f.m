function f = p02_f ( n, x )

%*****************************************************************************80
%
%% P02_F evaluates the objective function for problem 2.
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

  for i = 1 : 13

    c = - i / 10.0;

    fi = x(3)     * exp ( c * x(1) )         - x(4) * exp ( c * x(2) ) ...
       + x(6)     * exp ( c * x(5) )         -        exp ( c ) ...
       + 5.0  * exp ( 10.0 * c ) - 3.0  * exp ( 4.0 * c );

    f = f + fi * fi;

  end

  return
end
