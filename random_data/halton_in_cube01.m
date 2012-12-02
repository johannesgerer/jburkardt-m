function [ x, seed ] = halton_in_cube01 ( dim_num, n, seed )

%*****************************************************************************80
%
%% HALTON_IN_CUBE01 generates Halton points in the unit hypercube.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), a Halton sequence of length N.
%
  step = seed;
  seed_vec(1:dim_num) = 0;
  leap(1:dim_num) = 1;
  for i = 1 : dim_num
    base(i) = prime(i);
  end

  x = i4_to_halton_sequence ( dim_num, n, step, seed_vec, leap, base );

  seed = seed + n;

  return
end
