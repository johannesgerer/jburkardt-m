function [ x, seed ] = sample_hypercube_uniform ( dim_num, n, seed )

%*****************************************************************************80
%
%% SAMPLE_HYPERCUBE_UNIFORM returns sample points in the unit hypercube.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, int DIM_NUM, the spatial dimension.
%
%    Input, int N, the number of points to compute.
%
%    Input/output, int SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), the sample points.
%
  [ x, seed ] = r8mat_uniform_01 ( dim_num, n, seed );

  return
end
