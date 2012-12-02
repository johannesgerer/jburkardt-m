function fern ( point_num )

%*****************************************************************************80
%
%% FERN displays the Barnsley fractal fern.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2011
%
%  Author:
%
%    This program was modified by John Burkardt from an original
%    program by Cleve Moler.
%
%  Reference:
%
%    Michael Barnsley,
%    Fractals Everywhere,
%    Academic Press, 1988,
%    ISBN: 0120790696,
%    LC: QA614.86.B37.
%
%    Cleve Moler,
%    Experiments with MATLAB,
%    ebook: http://www.mathworks.com/moler/exm/index.html
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points to display.
%    A value of 10,000 or so is enough to see the fern.
%    For values of 500 or less, larger dots are displayed to suggest
%    how the plot is drawn.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FERN:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  This MATLAB program displays the Barnsley fractal fern.\n' );

  if ( nargin < 1 )
    point_num = 10000;
  end

  clf
  prob = [ 0.85; 0.92; 0.99; 1.00 ];
%
%  Compute the points.
%
  p = zeros ( 2, point_num );

  p(1:2,1) = rand ( 2, 1 );

  for j = 2 : point_num

    r = rand ( 1, 1 );

    if ( r < prob(1) )
      p(1,j) =   0.85 * p(1,j-1) + 0.04 * p(2,j-1) + 0.0;
      p(2,j) = - 0.04 * p(1,j-1) + 0.85 * p(2,j-1) + 1.6;
    elseif ( r < prob(2) )
      p(1,j) =   0.20 * p(1,j-1) - 0.26 * p(2,j-1) + 0.0;
      p(2,j) =   0.23 * p(1,j-1) + 0.22 * p(2,j-1) + 1.6;
    elseif ( r < prob(3) )
      p(1,j) = - 0.15 * p(1,j-1) + 0.28 * p(2,j-1) + 0.0;
      p(2,j) =   0.26 * p(1,j-1) + 0.24 * p(2,j-1) + 0.44;
    else
      p(1,j) =   0.00 * p(1,j-1) + 0.00 * p(2,j-1) + 0.0;
      p(2,j) =   0.00 * p(1,j-1) + 0.16 * p(2,j-1) + 0.0;
    end

  end
%
%  Plot the points as small green dots.
%
  if ( point_num <= 500 )
    dot_size = 5;
  else
    dot_size = 1;
  end

  plot ( p(1,:), p(2,:), 'g.', 'MarkerSize', dot_size );
  axis equal
  axis ( [ -3.0, +3.0, -1.0, 11.0 ] );
  title ( sprintf ( 'Fractal Fern, N = %d', point_num ) )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FERN:\n' );
  fprintf ( 1, '  Normal end of execution\n' );

  return
end
