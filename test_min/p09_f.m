function f = p09_f ( x )

%*****************************************************************************80
%
%% P09_F evaluates the objective function for problem 9.
%
%  Discussion:
%
%    This function is oscillatory, with many local minima.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2009
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
  f = x .* x - 10.0 * sin ( x .* x - 3.0 * x + 2.0 );

  return
end
