function f = p06_f ( n, x )

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
  f1 = 0.0;
  for i = 1 : n
    f1 = f1 + i * ( x(i) - 1.0 );
  end

  f2 = 0.0;
  for i = 1 : n
    f2 = f2 + ( x(i) - 1.0 )^2;
  end

  f = f1 * f1 * ( 1.0 + f1 * f1 ) + f2;

  return
end
