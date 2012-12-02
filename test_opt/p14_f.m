function f = p14_f ( n, x )

%*****************************************************************************80
%
%% P14_F evaluates the objective function for problem 14.
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
  f = 0.0;
  for j = 1 : n
    if ( mod ( j, 2 ) == 1 )
      f = f + ( 1.0 - x(j) )^2;
    else
      f = f + 100.0 * ( x(j) - x(j-1) * x(j-1) )^2;
    end
  end

  return
end
