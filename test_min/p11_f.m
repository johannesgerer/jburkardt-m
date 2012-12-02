function f = p11_f ( x )

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
%    03 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  f = 1.0 + abs ( 3.0 * x - 1.0 );

  return
end
