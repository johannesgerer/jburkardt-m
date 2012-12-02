function [ point, seed ] = p09_sample ( m, n, seed )

%*****************************************************************************80
%
%% P09_SAMPLE samples points from the region in problem 09.
%
%  Discussion:
%
%    A rejection method is used.
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
  center1 = [ 0.50, 0.50 ];
  center2 = [ 0.25, 0.75 ];
  center3 = [ 0.60, 0.40 ];
  r1 = 0.5;
  r2 = 0.1;
  r3 = 0.1;

  v1(1:2,1:4) = [ ...
    center1(1) - r1, center1(2) - r1; ...
    center1(1) + r1, center1(2) - r1; ...
    center1(1) + r1, center1(2) + r1; ...
    center1(1) - r1, center1(2) + r1 ]';
%
%  MATLAB has a tendency to make inane comments about
%  COS having the wrong number of arguments sometimes.
%  So, since I can't determine the root of this lunacy,
%  I have to break up the vector assignment into two
%  scalar statements.
%
  for j = 1 : 6
    angle = ( ( j - 1 ) * 2 ) * pi / 6.0;
    v2(1,j) = center2(1) + r2 * cos ( angle );
    v2(2,j) = center2(2) + r2 * sin ( angle );
  end

  for j = 1 : 6
    angle = ( ( j - 1 ) * 2 ) * pi / 6.0;
    v3(1,j) = center3(1) + r3 * cos ( angle );
    v3(2,j) = center3(2) + r3 * sin ( angle );
  end

  reject = 0;

  for j = 1 : n

    while ( 1 )

      [ y(1:2), seed ] = r8vec_uniform_01 ( 2, seed );

      if ( ( ~hexagon_contains_point_2d ( v2, y ) ) & ...
           ( ~hexagon_contains_point_2d ( v3, y ) ) )
        break;
      end

      reject = reject + 1;

      if ( 2 * n + 10 <= reject )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'P09_SAMPLE - Fatal error!\n' );
        fprintf ( 1, '  (The double hexagonal hole region)\n' );
        fprintf ( 1, '  Trying to generate point J = %d\n', j );
        fprintf ( 1, '  Number of rejections = %d\n', reject );
        fprintf ( 1, '  Rejection percentage = %d\n', ...
          ( 100 * reject ) / ( reject + j - 1 ) );
        fprintf ( 1, '  Y = (%f,%f)\n', y(1:2) );
        error ( 'P09_SAMPLE - Fatal error!' );
      end

    end

    point(1:2,j) = y(1:2)';

  end

  return
end
