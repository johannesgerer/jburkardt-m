function padua_plot ( l, filename )

%*****************************************************************************80
%
%% PADUA_PLOT plots the Padua points of given level.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer L, the level of the set.
%    0 <= L
%
%    Input, string FILENAME, the name for the PNG file to be created.
%
  n = padua_order ( l );

  xy = padua_points ( l );

  plot ( xy(1,1:n), xy(2,1:n), 'b.', 'MarkerSize', 30 );
  axis ( [ -1.0, +1.0, -1.0, +1.0 ] );
  grid on
  xlabel ( '<--- X --->', 'Fontsize', 16 );
  ylabel ( '<--- Y --->', 'Fontsize', 16 );
  title ( sprintf ( 'Padua Points, Level %d', l ), 'Fontsize', 24 );
  axis equal
  axis tight

  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file stored as "%s"\n', filename );

  return
end
