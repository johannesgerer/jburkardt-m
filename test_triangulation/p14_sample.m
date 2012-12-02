function [ point, seed ] = p14_sample ( m, n, seed )

%*****************************************************************************80
%
%% P14_SAMPLE samples points from the region in problem 14.
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
  box = [ ...
    100.0,  145.0; ...
   +634.0, +799.0 ]';

  reject = 0;

  for j = 1 : n

    while ( 1 )

      [ x, seed  ] = r8mat_uniform_01 ( m, 1, seed );
      x(1:m,1) = ( 1.0 - x(1:m,1) ) .* box(1:m,1) + x(1:m,1) .* box(1:m,2);

      inside = p14_inside ( m, 1, x );

      if ( inside )
        break
      end

      reject = reject + 1;

      if ( 30 * n + 10 <= reject )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'P14_SAMPLE - Fatal error!\n' );
        fprintf ( 1, '  Trying to generate point J = %d\n', j );
        fprintf ( 1, '  Number of rejections = %d\n', reject );
        fprintf ( 1, '  Rejection percentage = %f\n', ...
          ( 100 * reject ) / ( reject + j - 1 ) );
        r8vec_print ( m, x, '  Most recent rejected point: ' );
        error ( 'P14_SAMPLE - Fatal error!' );
      end

    end

    point(1:m,j) = x(1:m,1);

  end

  return
end
