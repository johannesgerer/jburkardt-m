function f = p01_f ( n, x )

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
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Richard Brent,
%    Algorithms for Minimization with Derivatives,
%    Dover, 2002,
%    ISBN: 0-486-41998-3,
%    LC: QA402.5.B74.
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  th = p01_th ( x );

  f = 100.0 * ( x(3) - 10.0 * th )^2 ...
    + 100.0 * ( sqrt ( x(1) * x(1) + x(2) * x(2) ) - 1.0 )^2 ...
    + x(3) * x(3);

  return
end
