function x = line_grid ( n, a, b, c )

%*****************************************************************************80
%
%% LINE_GRID: grid points over the interior of a line segment in 1D.
%
%  Discussion:
%
%    In 1D, a grid is created using N points.
%
%    Over the interval [A,B], we have 5 choices for grid centering:
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
%
%    Input, real A, B, the endpoints for each dimension.
%
%    Input, integer C, the grid centering for each dimension.
%    1 <= C <= 5.
%
%    Output, real X(N), the points.
%

%
%  Create the 1D grids in each dimension.
%
  x = zeros ( n, 1 );

  for j = 1 : n

    if ( c == 1 )

      if ( n == 1 )
        x(j) = 0.5 * ( a + b );
      else
        x(j) = (   ( n - j     ) * a   ...
                 + (     j - 1 ) * b ) ... 
                 / ( n     - 1 );
      end
    elseif ( c == 2 )
      x(j) = (   ( n - j + 1 ) * a   ...
               + (     j     ) * b ) ... 
               / ( n     + 1 );
    elseif ( c == 3 )
      x(j) = (   ( n - j + 1 ) * a   ...
               + (     j - 1 ) * b ) ... 
               / ( n         );
    elseif ( c == 4 )
      x(j) = (   ( n - j ) * a   ...
               + (     j ) * b ) ...
               / ( n     );
    elseif ( c == 5 )
      x(j) = (   ( 2 * n - 2 * j + 1 ) * a   ...
               + (         2 * j - 1 ) * b ) ...
               / ( 2 * n             );
    end

  end

  return
end
