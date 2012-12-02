function f = p07_f ( x )

%*****************************************************************************80
%
%% P07_F evaluates the objective function for problem 7.
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
%  Reference:
%
%    Richard Brent,
%    Algorithms for Minimization Without Derivatives,
%    Prentice Hall 1973,
%    Reprinted Dover, 2002
%
%  Parameters:
%
%    Input, real X, the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  f = ( x + sin ( x ) ) .* exp ( - x .* x );

  return
end
