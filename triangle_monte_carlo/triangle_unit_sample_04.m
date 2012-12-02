function [ p, seed ] = triangle_unit_sample_04 ( p_num, seed )

%*****************************************************************************80
%
%% TRIANGLE_UNIT_SAMPLE_04 selects points from the unit triangle.
%
%  Discussion:
%
%    The unit triangle has vertices (1,0), (0,1), (0,0).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 August 2009
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
%    Input, integer P_NUM, the number of points.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real P(2,P_NUM), the points.
%

%
%  The construction begins by sampling DIM_NUM+1 points from the
%  exponential distribution with parameter 1.
%
  for j = 1 : p_num

    [ e, seed ] = r8vec_uniform_01 ( 3, seed );

    e(1:3) = - log ( e(1:3) );

    p(1:2,j) = e(1:2) / sum ( e(1:3) );

  end

  return
end
