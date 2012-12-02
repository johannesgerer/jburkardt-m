function [ result, seed ] = p00_monte_carlo ( problem, n, seed )

%*****************************************************************************80
%
%% P00_MONTE_CARLO applies the Monte Carlo rule to integrate a function.
%
%  Discussion:
%
%    The function f(x,y) is to be integrated over a triangle T.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer N, the number of sample points.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real RESULT, the approximate integral.
%
%    Output, integer SEED, a seed for the random number generator.
%
  t = p00_vertices ( problem );

  [ p, seed ] = triangle_sample ( t, n, seed );

  f = p00_fun ( problem, n, p );

  area = triangle_area ( t );

  result = area * sum ( f(1:n) ) / n;

  return
end
