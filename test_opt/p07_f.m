function f = p07_f ( n, x )

%*****************************************************************************80
%
%% P07_F evaluates the objective function for problem 7.
%
%  Discussion:
%
%    For N = 9, the problem of minimizing the Watson function is
%    very ill conditioned.
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
  f = 0.0;
  for i = 1 : 29

    s1 = 0.0;
    d = 1.0;
    for j = 2 : n
      s1 = s1 + ( j - 1 ) * d * x(j);
      d = d * i / 29.0;
    end

    s2 = 0.0;
    d = 1.0;
    for j = 1 : n
      s2 = s2 + d * x(j);
      d = d * i / 29.0;
    end

    f = f + ( s1 - s2 * s2 - 1.0 )^2;

  end

  f = f + x(1) * x(1) + ( x(2) - x(1) * x(1) - 1.0 )^2;

  return
end
