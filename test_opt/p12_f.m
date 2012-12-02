function f = p12_f ( n, x )

%*****************************************************************************80
%
%% P12_F evaluates the objective function for problem 12.
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
  f = 0.0;
  for i = 1 : 99
    arg = i / 100.0;
    r = abs ( ( - 50.0 * log ( arg ) )^( 2.0 / 3.0 ) + 25.0 - x(2) );

    t = exp ( - r^x(3) / x(1) ) - arg;

    f = f + t * t;

  end

  return
end
