function f = p06_f ( x )

%*****************************************************************************80
%
%% P06_F evaluates the objective function for problem 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2002
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
  f = 2.0 - x;

  return
end
