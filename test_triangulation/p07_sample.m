function [ point, seed ] = p07_sample ( m, n, seed )

%*****************************************************************************80
%
%% P07_SAMPLE samples points from the region in problem 07.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real POINT(M,N), the coordinates of the points.
%
%    Output, integer SEED, a seed for the random number generator.
%
  [ lo, hi ] = p07_box ( m );

  have = 0;

  while ( 1 )

    [ u, seed ] = r8vec_uniform_01 ( 2, seed );

    p(1:2) = ( 1.0 - u(1:2) ) .* lo(1:2) + u(1:2) .* hi(1:2);

    if ( cos ( p(1) ) < p(2) )
      continue
    end

    if ( p(2) < -5.0 + 5.0 * p(1)^4 / ( 2.5 * pi )^4 )
      continue
    end

    have = have + 1;
    point(1:2,have) = p(1:2)';

    if ( n <= have )
      return
    end

  end

  return
end
