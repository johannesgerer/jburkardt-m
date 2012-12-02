function f = p26_f ( n, x )

%*****************************************************************************80
%
%% P26_F evaluates the objective function for problem 26.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Zbigniew Michalewicz,
%    Genetic Algorithms + Data Structures = Evolution Programs,
%    Third Edition,
%    Springer Verlag, 1996,
%    ISBN: 3-540-60676-9,
%    LC: QA76.618.M53.
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  jroot = 5;
  k = 500.0;

  fi = k;

  for j = 1 : jroot * jroot

    j1 = mod ( j - 1, jroot ) + 1;
    a1 = -32 + j1 * 16;

    j2 = ( j - 1 ) / jroot;
    a2 = -32 + j2 * 16;

    fj = j + ( x(1) - a1 )^6 + ( x(2) - a2 )^6;

    fi = fi + 1.0 / fj;

  end

  f = 1.0 / fi;

  return
end
