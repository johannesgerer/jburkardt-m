function [ point, seed ] = p05_sample ( m, n, seed )

%*****************************************************************************80
%
%% P05_SAMPLE samples points from the region in problem 05.
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
%    Output, real POINT(M,N), the coordinates
%    of the points.
%
%    Output, integer SEED, a seed for the random number generator.
%
  center1 = [  0.0, 0.0 ];
  center2 = [ -0.4, 0.0 ];
  r1 =   1.00;
  r2 =   0.55;

  x1 = center1(1) - r1;
  x2 = center1(1) + r1;

  y1 = center1(2);
  y2 = center1(2) + r1;

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
%  Accept those points which are in the big circle and not in the
%  small circle.
%
    for j = 1 : sample_num
     
      if (                                                          ...     
                   ( sample(1,j) - center1(1) ).^2                  ...
                 + ( sample(2,j) - center1(2) ).^2 <= r1 * r1 &     ...
        r2 * r2 <= ( sample(1,j) - center2(1) ).^2                  ...
                 + ( sample(2,j) - center2(2) ).^2 ) 

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
