function display_grid_types ( )

%*****************************************************************************80
%
%% DISPLAY_GRID_TYPES prints and plots samples of the SPINTERP grids.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2014
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../spinterp' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DISPLAY_GRID_TYPES\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  For dimension 2, display the level 0/1/2 grids\n' );
  fprintf ( 1, '  available in SPINTERP.\n' );
%
%  Print default gridpoints.
%
  gridtype = 'default';
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using SPINTERP default gridtype (which is Clenshaw-Curtis)\n' );
  d = 2;
  l = 0;
  x0 = spgrid ( l, d )
  l = 1;
  x1 = spgrid ( l, d )
  l = 2;
  x2 = spgrid ( l, d )

  clf 
  hold on
  plot ( x0(:,1), x0(:,2), 'r.', 'MarkerSize', 35 )
  plot ( x1(:,1), x1(:,2), 'b.', 'MarkerSize', 30 )
  plot ( x2(:,1), x2(:,2), 'k.', 'MarkerSize', 20 )
  axis square
  axis ( [ 0.0 1.0 0.0 1.0 ] )
  grid on
  label = sprintf ( 'Levels 0/1/2 for %s grid', gridtype );
  title ( label, 'FontSize', 16 );
  hold off
  filename = sprintf ( '%s_grid.png', gridtype );
  print ( '-dpng', filename );
%
%  Print "Chebyshev" gridpoints.
%
  gridtype = 'chebyshev';
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using spinterp gridtype = "%s"\n', gridtype );
  options = spset ( 'GridType', gridtype );
  d = 2;
  l = 0;
  x0 = spgrid ( l, d, options )
  l = 1;
  x1 = spgrid ( l, d, options )
  l = 2;
  x2 = spgrid ( l, d, options )

  clf 
  hold on
  plot ( x0(:,1), x0(:,2), 'r.', 'MarkerSize', 35 )
  plot ( x1(:,1), x1(:,2), 'b.', 'MarkerSize', 30 )
  plot ( x2(:,1), x2(:,2), 'k.', 'MarkerSize', 20 )
  axis square
  axis ( [ 0.0 1.0 0.0 1.0 ] )
  grid on
  label = sprintf ( 'Levels 0/1/2 for %s grid', gridtype );
  title ( label, 'FontSize', 16 );
  hold off
  filename = sprintf ( '%s_grid.png', gridtype );
  print ( '-dpng', filename );
%
%  Print "Clenshaw-Curtis" gridpoints.
%
  gridtype = 'clenshaw-curtis';
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using spinterp gridtype = "%s"\n', gridtype );
  options = spset ( 'GridType', gridtype );
  d = 2;
  l = 0;
  x0 = spgrid ( l, d, options )
  l = 1;
  x1 = spgrid ( l, d, options )
  l = 2;
  x2 = spgrid ( l, d, options )

  clf 
  hold on
  plot ( x0(:,1), x0(:,2), 'r.', 'MarkerSize', 35 )
  plot ( x1(:,1), x1(:,2), 'b.', 'MarkerSize', 30 )
  plot ( x2(:,1), x2(:,2), 'k.', 'MarkerSize', 20 )
  axis square
  axis ( [ 0.0 1.0 0.0 1.0 ] )
  grid on
  label = sprintf ( 'Levels 0/1/2 for %s grid', gridtype );
  title ( label, 'FontSize', 16 );
  hold off
  filename = sprintf ( '%s_grid.png', gridtype );
  print ( '-dpng', filename );
%
%  Print "Gauss-Patterson" gridpoints.
%
  gridtype = 'gauss-patterson';
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using spinterp gridtype = "%s"\n', gridtype );
  options = spset ( 'GridType', gridtype );
  d = 2;
  l = 0;
  x0 = spgrid ( l, d, options )
  l = 1;
  x1 = spgrid ( l, d, options )
  l = 2;
  x2 = spgrid ( l, d, options )

  clf 
  hold on
  plot ( x0(:,1), x0(:,2), 'r.', 'MarkerSize', 35 )
  plot ( x1(:,1), x1(:,2), 'b.', 'MarkerSize', 30 )
  plot ( x2(:,1), x2(:,2), 'k.', 'MarkerSize', 20 )
  axis square
  axis ( [ 0.0 1.0 0.0 1.0 ] )
  grid on
  label = sprintf ( 'Levels 0/1/2 for %s grid', gridtype );
  title ( label, 'FontSize', 16 );
  hold off
  filename = sprintf ( '%s_grid.png', gridtype );
  print ( '-dpng', filename );
%
%  Print "Maximum" gridpoints.
%
  gridtype = 'maximum';
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using spinterp gridtype = "%s"\n', gridtype );
  options = spset ( 'GridType', gridtype );
  d = 2;
  l = 0;
  x0 = spgrid ( l, d, options )
  l = 1;
  x1 = spgrid ( l, d, options )
  l = 2;
  x2 = spgrid ( l, d, options )

  clf 
  hold on
  plot ( x0(:,1), x0(:,2), 'r.', 'MarkerSize', 35 )
  plot ( x1(:,1), x1(:,2), 'b.', 'MarkerSize', 30 )
  plot ( x2(:,1), x2(:,2), 'k.', 'MarkerSize', 20 )
  axis square
  axis ( [ 0.0 1.0 0.0 1.0 ] )
  grid on
  label = sprintf ( 'Levels 0/1/2 for %s grid', gridtype );
  title ( label, 'FontSize', 16 );
  hold off
  filename = sprintf ( '%s_grid.png', gridtype );
  print ( '-dpng', filename );
%
%  Print "NoBoundary" gridpoints.
%
  gridtype = 'noboundary';
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using spinterp gridtype = "%s"\n', gridtype );
  options = spset ( 'GridType', gridtype );
  d = 2;
  l = 0;
  x0 = spgrid ( l, d, options )
  l = 1;
  x1 = spgrid ( l, d, options )
  l = 2;
  x2 = spgrid ( l, d, options )

  clf 
  hold on
  plot ( x0(:,1), x0(:,2), 'r.', 'MarkerSize', 35 )
  plot ( x1(:,1), x1(:,2), 'b.', 'MarkerSize', 30 )
  plot ( x2(:,1), x2(:,2), 'k.', 'MarkerSize', 20 )
  axis square
  axis ( [ 0.0 1.0 0.0 1.0 ] )
  grid on
  label = sprintf ( 'Levels 0/1/2 for %s grid', gridtype );
  title ( label, 'FontSize', 16 );
  hold off
  filename = sprintf ( '%s_grid.png', gridtype );
  print ( '-dpng', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DISPLAY_GRID_TYPES:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../spinterp' )

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
