function f = p11_f ( n, x )

%*****************************************************************************80
%
%% P11_F evaluates the objective function for problem 11.
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

  for i = 1 : 20

    c = i / 5.0;
    f1 = x(1) + c * x(2) - exp ( c );
    f2 = x(3) + sin ( c ) * x(4) - cos ( c );

    f = f + f1^4 + 2.0 * f1 * f1 * f2 * f2 + f2^4;

  end

  return
end
