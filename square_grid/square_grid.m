function x = square_grid ( n, ns, a, b, c )

%*****************************************************************************80
%
%% SQUARE_GRID: grid points over the interior of a square in 2D.
%
%  Discussion:
%
%    In 2D, a logically rectangular grid is to be created.
%    In the I-th dimension, the grid will use S(I) points.
%    The total number of grid points is 
%      N = product ( 1 <= I <= 2 ) S(I)
%
%    Over the interval [A(i),B(i)], we have 5 choices for grid centering:
%      1: 0,   1/3, 2/3, 1
%      2: 1/5, 2/5, 3/5, 4/5
%      3: 0,   1/4, 2/4, 3/4
%      4: 1/4, 2/4, 3/4, 1
%      5: 1/8, 3/8, 5/8, 7/8
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%    N = product ( 1 <= I <= 2 ) NS(I).
%
%    Input, integer NS(2), the number of points along 
%    each dimension.
%
%    Input, real A(2), B(2), the endpoints for each dimension.
%
%    Input, integer C(2), the grid centering for each dimension.
%    1 <= C(*) <= 5.
%
%    Output, real X(2,N) = X(2*S(1)*S(2)), the points.
%
  m = 2;
%
%  Create the 1D grids in each dimension.
%
  x = zeros ( m, n );

  for i = 1 : m

    s = ns(i);

    xs = zeros ( s, 1 );

    for j = 1 : s

      if ( c(i) == 1 )

        if ( s == 1 )
          xs(j) = 0.5 * ( a(i) + b(i) );
        else
          xs(j) = (   ( s - j     ) * a(i)   ...
                    + (     j - 1 ) * b(i) ) ... 
                    / ( s     - 1 );
        end
      elseif ( c(i) == 2 )
        xs(j) = (   ( s - j + 1 ) * a(i)   ...
                  + (     j     ) * b(i) ) ... 
                  / ( s     + 1 );
      elseif ( c(i) == 3 )
        xs(j) = (   ( s - j + 1 ) * a(i)   ...
                  + (     j - 1 ) * b(i) ) ... 
                  / ( s         );
      elseif ( c(i) == 4 )
        xs(j) = (   ( s - j ) * a(i)   ...
                  + (     j ) * b(i) ) ...
                  / ( s     );
      elseif ( c(i) == 5 )
        xs(j) = (   ( 2 * s - 2 * j + 1 ) * a(i)   ...
                  + (         2 * j - 1 ) * b(i) ) ...
                  / ( 2 * s             );
      end

    end

    x = r8vec_direct_product ( i, s, xs, m, n, x );

  end

  return
end
