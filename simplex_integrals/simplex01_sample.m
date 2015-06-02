function [ x, seed ] = tetrahedron01_sample ( m, n, seed )

%*****************************************************************************80
%
%% SIMPLEX01_SAMPLE samples the unit simplex in M dimensions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2014
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
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real X(M,N), the points.
%
  for j = 1 : n

    [ e, seed ] = r8vec_uniform_01 ( m + 1, seed );

    e(1:m+1) = - log ( e(1:m+1) );

    x(1:m,j) = e(1:m) / sum ( e(1:m+1) );

  end

  return
end
