function voronoi_plot ( xy, m, n, p )

%*****************************************************************************80
%
%% VORONOI_PLOT computes a pixel plot of a Voronoi diagram.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real XY(2,NC), a set of XY coordinates of center points.
%    You can alway try XY = rand ( 2, NC ) as random centers.
%
%    Input, integer M, N, the number of rows and columns of pixels
%    to use in the plot.  M = N = 100 might be reasonable for a start.
%    Increasing these values makes a geometrically more accurate diagram.
%
%    Input, integer P, the norm to be used.
%    P = 2, the default Euclidean or L2 norm.
%    P = Inf, the max or L-Infinity norm.
%    P = 1, the L1 norm.
%    Otherwise Norm(X,Y) = ( |X|^P + |Y|^P ) ^ (1/P)
%
  if ( nargin < 4 )
    p = 2;
  end

  if ( nargin < 3 )
    if ( nargin < 2 )
      n = 200;
    else
      n = m;
    end
  end

  if ( nargin < 2 )
    m = 200;
  end

  if ( nargin < 1 )
    xy = rand ( 2, 25 );
  end
%
%  How many points did we get?
%
  [ dummy, nc ] = size ( xy );
%
%  Compute the range of the points, and then increase it by a bit.
%
  xmin = min ( xy(1,:) );
  xmax = max ( xy(1,:) );
  ymin = min ( xy(2,:) );
  ymax = max ( xy(2,:) );

  margin = 0.05 * max ( xmax - xmin, ymax - ymin );
  xmin = xmin - margin;
  xmax = xmax + margin;
  ymin = ymin - margin;
  ymax = ymax + margin;
%
%  Randomly choose NC + 1 sets of RGB values.
%  Our extra color is black, just in case something goes wrong.
%
  rgb = uint8 ( floor ( 256 * rand ( nc + 1, 3 ) ) );

  rgb(nc+1,1:3) = 0;
%
%  For each pixel in A, we calculate its correspoinding XY position,
%  find the nearest center, and color the pixel with the corresponding
%  RGB color.  A vectorized calculation would be much faster.
%
%  The L2 norm is used here.
%
  a = uint8 ( zeros ( m, n, 3 ) );

  for i = 1 : m

    y = ( ( m - i     ) * ymax ...
        + (     i - 1 ) * ymin ) ...
        / ( m     - 1 );

    for j = 1 : n

      x = ( ( n - j     ) * xmax ...
          + (     j - 1 ) * xmin ) ...
          / ( n     - 1 );

      nearest = nc + 1;
      distsq_min = Inf;

      for k = 1 : nc

        if ( p == Inf )
          distsq = max ( abs ( x - xy(1,k) ), abs ( y - xy(2,k) ) );
        elseif ( p == 2 )
          distsq = ( x - xy(1,k) )^2 + ( y - xy(2,k) )^2;
        elseif ( p == 1 )
          distsq = abs ( x - xy(1,k) ) + abs ( y - xy(2,k) );
        else
          dx = abs ( x - xy(1,k) );
          dy = abs ( y - xy(2,k) );
          distsq = ( dx^p + dy^p )^(1.0/p);
        end

        if ( distsq < distsq_min )
          distsq_min = distsq;
          nearest = k;
        end
      end

      a(i,j,1:3) = rgb(nearest,1:3);

    end

  end
%
%  Display the image.
%
  imagesc ( a )
  axis equal
  axis tight
  title ( sprintf ( 'Distance computed with %f norm', p ) );

  return
end
