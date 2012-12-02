function [ point, seed ] = p08_sample ( m, n, seed )

%*****************************************************************************80
%
%% P08_SAMPLE samples points from the region in problem 08.
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
%    08 January 2005
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
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real POINT(M,N), the coordinates
%    of the points.
%
  batch = 1000;

  [ lo, hi ] = p08_box ( m );

  have = 0;
%
%  We are going to generate batches of sample points.
%
  sample_num = min ( batch, n );

  reject = 0;

  while ( 1 )
%
%  Generate a batch of points in the bounding box.
%
    sample(1:m,1:sample_num) = rand ( m, sample_num );
%
%  Remap the points to the box.
%
    sample(1,1:sample_num) = lo(1) + sample(1,1:sample_num) * ( hi(1) - lo(1) );
    sample(2,1:sample_num) = lo(2) + sample(2,1:sample_num) * ( hi(2) - lo(2) );

    inside(1:sample_num) = p08_inside ( m, sample_num, sample );
%
%  Accept those points which are inside the region.
%
    for j = 1 : sample_num

      if ( inside(j) )

        have = have + 1;
        point(1:m,have) = sample(1:m,j);

        if ( have == n )
          return
        end

      else

        reject = reject + 1;

      end

    end

    if ( 10 * n < reject )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P08_SAMPLE - Fatal error!\n' );
      fprintf ( 1, '  Too many points rejected!\n' );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Total number of accepted points = %d\n', have );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Number generated on this sweep =  %d\n', sample_num );
      fprintf ( 1, '  Number accepted =                 %d\n', ...
        sample_num - reject );
      fprintf ( 1, '  Number rejected =                 %d\n', reject );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Something appears to be wrong!\n' );
      error ( 'P08_SAMPLE - Fatal error!' );
    end

  end

  return
end
