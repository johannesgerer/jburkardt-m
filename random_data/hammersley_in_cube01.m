function [ x, seed ] = hammersley_in_cube01 ( dim_num, n, seed )

%*****************************************************************************80
%
%% HAMMERSLEY_IN_CUBE01 generates Hammersley points in the unit hypercube.
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
%    Input, integer DIM_NUM, the dimension of the element.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), the elements of the Hammersley
%    sequence.
%
  step = seed;
  seed_vec(1:dim_num) = 0;
  leap(1:dim_num) = 1;

  base(1) = -n;
  for i = 2 : dim_num
    base(i) = prime ( i-1 );
  end

  x = i4_to_hammersley_sequence ( dim_num, n, step, seed_vec, leap, base );

  seed = seed + n;

  return
end
