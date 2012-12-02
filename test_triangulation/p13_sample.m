function [ point, seed ] = p13_sample ( m, n, seed )

%*****************************************************************************80
%
%% P13_SAMPLE samples points from the region in problem 13.
%
%  Discussion:
%
%    The region is contained in the box [0,100] x [0,100].
%
%    The region looks roughly like an inverted tuning fork.
%    It is the union of a rectangular strip and a partial
%    circular annulus.
%
%    If three dimensions are used, then the 2D region is simply
%    projected through the range 0 <= Z <= 20.0.
%
%    The information about this region was supplied by David
%    Crawford of Sandia National Laboratory.
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
  width = [ 100.0, 100.0, 20.0 ];

  reject = 0;

  for j = 1 : n

    while ( 1 )

      [ x, seed ] = r8vec_uniform_01 ( m, seed );

      x(1:m) = width(1:m) .* x(1:m);
%
%  The rectangular strip.
%
      if ( 45.0 <= x(1) & x(1) <= 55.0 & 30.0 <= x(2) & x(2) <= 90.0 )

        break
%
%  The annulus.
%
      elseif ( 0.0 <= x(2) )

        c = sqrt ( ( x(1) - 50.0 ) * ( x(1) - 50.0 ) + x(2) * x(2) );

        if ( 30.0 <= c & c <= 40.0 )
          break
        end

      end

      reject = reject + 1;

      if ( 30 * n + 10 <= reject )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'P13_SAMPLE - Fatal error!\n' );
        fprintf ( 1, '  Trying to generate point J = %d\n', j );
        fprintf ( 1, '  Number of rejections = %d\n', reject );
        fprintf ( 1, '  Rejection percentage = %f\n', ... 
          ( 100 * reject ) / ( reject + j - 1 ) );
        r8vec_print ( m, x, '  Most recent rejected point: ' );
        error ( 'P13_SAMPLE - Fatal error!' );
      end

    end

    point(1:m,j) = x(1:m)';

  end

  return
end
