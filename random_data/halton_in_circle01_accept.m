function [ x, seed ] = halton_in_circle01_accept ( dim_num, n, seed )

%*****************************************************************************80
%
%% HALTON_IN_CIRCLE01_ACCEPT accepts Halton points in the unit circle.
%
%  Discussion:
%
%    The acceptance/rejection method is used.
%
%    The unit circle has center at the origin, and radius 1.
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
%    Input, integer DIM_NUM, the dimension of the space (which is 2).
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), the points.
%
  have = 0;

  seed_vec(1:dim_num) = 0;
  leap(1:dim_num) = 1;
  for i = 1 : dim_num
    base(i) = prime ( i );
  end

  while ( have < n )

    step = seed;

    u = i4_to_halton ( dim_num, step, seed_vec, leap, base );

    seed = seed + 1;

    u(1:dim_num) = 2.0 * u(1:dim_num) - 1.0;

    if ( sum ( u(1:dim_num).^2 ) <= 1.0 )
      have = have + 1;
      x(1:dim_num,have) = u(1:dim_num)';
    end

  end

  return
end
