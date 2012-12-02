function [ point, seed ] = p03_sample ( m, n, seed )

%*****************************************************************************80
%
%% P03_SAMPLE samples points from the region in problem 03.
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
%    Output, integer SEED, a seed for the random number generator.
%
%    Output, real POINT(M,N), the coordinates 
%    of the points.
%
%    Input, integer SEED, a seed for the random number generator.
%
  center = [ 0.0, 0.0 ];
  r2 = 0.4;
  x1 = -1.0;
  x2 = +1.0;
  y1 = -1.0;
  y2 = +1.0;

  have = 0;
%
%  We are going to generate batches of sample points.
%
  sample_num = min ( 1000, n );

  while ( 1 )
%
%  Generate a batch of points in [0,1]x[0,1].
%
    [ sample, seed ] = r8mat_uniform_01 ( m, sample_num, seed );
%
%  Remap the points to the box [X1,X2] x [Y1,Y2].
%
    sample(1,1:sample_num) = x1 + sample(1,1:sample_num) * ( x2 - x1 );
    sample(2,1:sample_num) = y1 + sample(2,1:sample_num) * ( y2 - y1 );
%
%  Accept those points which are NOT in the hole.
%
    for j = 1 : sample_num
     
      if ( r2 * r2 < ( sample(1,j) - center(1) ).^2 ...
                   + ( sample(2,j) - center(2) ).^2 )

        have = have + 1;
        point(1:m,have) = sample(1:m,j);

        if ( have == n )
          return
        end

      end

    end

  end

  return
end
