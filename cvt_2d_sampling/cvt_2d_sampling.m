function cvt_2d_sampling ( g_num, it_num, s_num )

%*****************************************************************************80
%
%% CVT_2D_SAMPLING carries out the Lloyd algorithm in a 2D unit box.
%
%  Discussion:
%
%    This program is a variation of the CVT_2D_LLOYD method.
%
%    Instead of using an exact technique to determine the Voronoi
%    regions, it uses sampling.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer G_NUM, the number of generators.
%    A value of 50 is reasonable.
%
%    Input, integer IT_NUM, the number of CVT iterations.
%    A value of 20 or 50 might be reasonable.
%
%    Input, integer S_NUM, the number of sample points to use
%    when estimating the Voronoi regions.
%    A value of 1,000 is too low.  A value of 1,000,000 is somewhat high.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_2D_SAMPLING\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Use sampling to approximate Lloyd''s algorithm\n' );
  fprintf ( 1, '  in the 2D unit square.\n' );

  if ( nargin < 1 )
    g_num = input ( '  Enter number of generators: ' );
  end

  if ( nargin < 2 ) 
    it_num = input ( '  Enter number of iterations: ' );
  end

  if ( nargin < 3 ) 
    s_num = input ( '  Enter number of sample points: ' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of generators is %d\n', g_num );
  fprintf ( 1, '  Number of iterations is %d\n', it_num );
  fprintf ( 1, '  Number of samples is %d\n', s_num );
%
%  Initialize the generators.
%
  g = rand ( 2, g_num );
%
%  Carry out the iteration.
%
  step = 1 : it_num;
  e = nan ( it_num, 1 );
  gm = nan ( it_num, 1 );

  for it = 1 : it_num
%
%  Compute the Delaunay triangle information T for the current nodes.
%
    t = delaunay ( g(1,:), g(2,:) );
%
%  Display the Voronoi cells.
%
    subplot ( 2, 2, 1 );    
    voronoi ( g(1,:), g(2,:), t );
    title_string = sprintf ( 'Voronoi, step %d', it );
    title ( title_string );
    axis equal
    axis ( [  0.0, 1.0, 0.0, 1.0 ] )
    axis square
    drawnow
%
%  Display the Delaunay triangulation.
%
    subplot ( 2, 2, 2 );
    trimesh ( t, g(1,:), g(2,:), zeros(g_num,1), 'EdgeColor', 'r' )
    hold on
    scatter ( g(1,:), g(2,:), 'k.' )
    title_string = sprintf ( 'Delaunay, step %d', it );
    title ( title_string );
    axis ( [  0.0, 1.0, 0.0, 1.0 ] )
    axis square
    view ( 2 )
    hold off
%
%  Generate sample points.
%  New option for fixed grid sampling.
%
    if ( 0 )
      s = rand ( 2, s_num );
    else
      s2 = floor ( sqrt ( s_num ) );
      s2 = max ( s2, 2 );
      s_num = s2 * s2;
      [ sx, sy ] = meshgrid ( linspace ( 0.0, 1.0, s2 ) );
      sx = reshape ( sx, 1, s2 * s2 );
      sy = reshape ( sy, 1, s2 * s2 );
      s = [ sx; sy ];
    end
%
%  For each sample point, find K, the index of the nearest generator.
%  We do this efficiently by using the Delaunay information with
%  Matlab's DSEARCH command, rather than a brute force nearest neighbor
%  computation.
%  
    k(1:s_num,1) = dsearch ( g(1,:), g(2,:), t, s(1,:), s(2,:) );

    m(1,:) = accumarray ( k, ones(s_num,1) );

    g_new(1,:) = accumarray ( k, s(1,:) ) ./ m(1,:)';
    g_new(2,:) = accumarray ( k, s(2,:) ) ./ m(1,:)';
%
%  Compute the energy.
%
    e(it,1) = sum ( ( s(1,:) - g(1,k(:,1)) ).^2 ...
                  + ( s(2,:) - g(2,k(:,1)) ).^2 ) / s_num;
%
%  Display the energy.
%
    subplot ( 2, 2, 3 )
    plot ( step, log ( e ), 'm-*' )
    title ( 'Log (Energy)' )
    xlabel ( 'Step' )
    ylabel ( 'Energy' )
    grid
%
%  Compute the generator motion.
%
    gm(it,1) = sum ( ( g_new(1,:) - g(1,:) ).^2 ...
                   + ( g_new(2,:) - g(2,:) ).^2 ) / g_num;
%
%  Display the generator motion.
%
    subplot ( 2, 2, 4 )
    plot ( step, log ( gm ), 'm-*' )
    title ( 'Log (Average generator motion)' )
    xlabel ( 'Step' )
    ylabel ( 'Energy' )
    grid
%
%  Continue?
%
    s = input ( 'RETURN, or Q to quit: ', 's' );

    if ( s == 'q' | s == 'Q' )
      break
    end
%
%  Update the generators.
%
    g = g_new;

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_2D_SAMPLING\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
