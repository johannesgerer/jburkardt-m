function [ x, seed ] = triangle01_sample ( n, seed )

%*****************************************************************************80
%
%% TRIANGLE01_SAMPLE samples the interior of the unit triangle in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Reuven Rubinstein,
%    Monte Carlo Optimization, Simulation, and Sensitivity
%    of Queueing Networks,
%    Krieger, 1992,
%    ISBN: 0894647644,
%    LC: QA298.R79.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real X(2,N), the points.
%
  m = 2;

  for j = 1 : n

    [ e, seed ] = r8vec_uniform_01 ( m + 1, seed );

    e(1:m+1) = - log ( e(1:m+1) );

    x(1:m,j) = e(1:m) / sum ( e(1:m+1) );

  end

  return
end
