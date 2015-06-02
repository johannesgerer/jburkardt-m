function x = hypercube_grid ( m, n, ns, a, b, c )

%*****************************************************************************80
%
%% HYPERCUBE_GRID: grid points over the interior of a hypercube in M dimensions.
%
%  Discussion:
%
%    In M dimensional space, a logically rectangular grid is to be created.
%    In the I-th dimension, the grid will use S(I) points.
%    The total number of grid points is 
%      N = product ( 1 <= I <= M ) S(I)
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
%    29 August 2014
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
%    N = product ( 1 <= I <= M ) NS(I).
%
%    Input, integer NS(M), the number of points along 
%    each dimension.
%
%    Input, real A(M), B(M), the endpoints for each dimension.
%
%    Input, integer ( kind = 4 ) C(M), the grid centering for each dimension.
%    1 <= C(*) <= 5.
%
%    Output, real X(M,N) = X(M*S(1),S(2),...,S(M)), the points.
%

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
