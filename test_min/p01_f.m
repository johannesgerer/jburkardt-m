function f = p01_f ( x )

%*****************************************************************************80
%
%% P01_F evaluates the objective function for problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2002
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
  f = ( x - 2.0 ) * ( x - 2.0 ) + 1.0;

  return
end
