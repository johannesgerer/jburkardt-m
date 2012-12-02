function result = p00_monte_carlo ( problem, order )

%*****************************************************************************80
%
%% P00_MONTE_CARLO applies a Monte Carlo procedure to Hermite integrals.
%
%  Discussion:
%
%    We wish to estimate the integral:
%
%      I(f) = integral ( -oo < x < +oo ) f(x) exp ( - x * x ) dx
%
%    We do this by a Monte Carlo sampling procedure, in which
%    we select N points X(1:N) from a standard normal distribution,
%    and estimate
%
%      Q(f) = sum ( 1 <= I <= N ) f(x(i)) / sqrt ( pi )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the index of the problem.
%
%    Input, integer ORDER, the order of the Gauss-Laguerre rule
%    to apply.
%
%    Output, real RESULT, the approximate integral.
%
  seed = 123456789;
  [ x_vec, seed ] = r8vec_normal_01 ( order, seed );

  option = 2;
  f_vec = p00_fun ( problem, option, order, x_vec );

  weight = order / sqrt ( 2.0 * pi );

  result = sum ( f_vec(1:order) ) / weight;

  return
end
