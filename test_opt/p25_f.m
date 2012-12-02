function f = p25_f ( n, x )

%*****************************************************************************80
%
%% P25_F evaluates the objective function for problem 25.
%
%  Discussion:
%
%    The function includes Gaussian noise, multiplied by a parameter P.
%
%    If P is zero, then the function is a proper function, and evaluating
%    it twice with the same argument will yield the same results.
%    Moreover, P25_G and P25_H are the correct gradient and hessian routines.
%
%    If P is nonzero, then evaluating the function at the same argument
%    twice will generally yield two distinct values; this means the function
%    is not even a well defined mathematical function, let alone continuous;
%    the gradient and hessian are not correct.  And yet, at least for small
%    values of P, it may be possible to approximate the minimizer of the
%    (underlying well-defined ) function.
%
%    The value of the parameter P is by default 1.  The user can manipulate
%    this value by calling P25_P_GET or P25_P_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 January 2001
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
  p = p25_p_get ( );

  gauss = randn ( );

  f = p * gauss;
  for i = 1 : n
    f = f + i * x(i)^4;
  end

  return
end
