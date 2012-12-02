function points_eps ( file_name, ndim, node_num, node_xy, title )

%*****************************************************************************80
%
%% POINTS_EPS creates an EPS file image of a set of points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the name of the file to create.
%
%    Input, integer NDIM, the spatial dimension.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates
%    of the nodes.
%
%    Input, string TITLE, a title for the plot.
%
  circle_size = 3;
  DEBUG = 0;
%
%  Determine the range of the points.
%
  node_x_min =  r8_huge ( );
  node_x_max = -r8_huge ( );
  node_y_min =  r8_huge ( );
  node_y_max = -r8_huge ( );

  for node = 1 : node_num
    node_x_min = min ( node_x_min, node_xy(1,node) );
    node_x_max = max ( node_x_max, node_xy(1,node) );
    node_y_min = min ( node_y_min, node_xy(2,node) );
    node_y_max = max ( node_y_max, node_xy(2,node) );
  end

  if ( node_y_max - node_y_min < node_x_max - node_x_min )
    sscale = node_x_max - node_x_min;
    dif = ( node_x_max - node_x_min ) - ( node_y_max - node_y_min );
    node_y_max = node_y_max + 0.5 * dif;
    node_y_min = node_y_min - 0.5 * dif;
  else
    sscale = node_y_max - node_y_min;
    dif = ( node_y_max - node_y_min ) - ( node_x_max - node_x_min );
    node_x_max = node_x_max + 0.5 * dif;
    node_x_min = node_x_min - 0.5 * dif;
  end

  if ( file_exist ( file_name ) )
    file_delete ( file_name );
  end
  
  eps_unit = fopen ( file_name, 'w' );

  if ( eps_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POINTS_EPS - Fatal error!\n' );
    fprintf ( 1, '  Could not open output file "%s".\n', file_name );
    error ( 'POINTS_EPS - Fatal error!' );
  end

  fprintf ( eps_unit, '%!PS-Adobe-3.0 EPSF-3.0\n' );
  fprintf ( eps_unit, '%%Creator: points_eps(ccvt_box.f90)\n' );
  fprintf ( eps_unit, '%%Title: %s\n', file_name );
  fprintf ( eps_unit, '%%Pages: 1\n' );
  fprintf ( eps_unit, '%%BoundingBox:    36    36   576   756\n' );
  fprintf ( eps_unit, '%%Document-Fonts: Times-Roman\n' );
  fprintf ( eps_unit, '%%LanguageLevel: 1\n' );
  fprintf ( eps_unit, '%%EndComments\n' );
  fprintf ( eps_unit, '%%BeginProlog\n' );
  fprintf ( eps_unit, '/inch {72 mul} def\n' );
  fprintf ( eps_unit, '%%EndProlog\n' );
  fprintf ( eps_unit, '%%Page:      1     1\n' );
  fprintf ( eps_unit, 'save\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '% Set RGB line color.\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, ' 0.9000 0.9000 0.9000 setrgbcolor\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '% Draw a gray border around the page.\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, 'newpath\n' );
  fprintf ( eps_unit, '    36   126 moveto\n' );
  fprintf ( eps_unit, '   576   126 lineto\n' );
  fprintf ( eps_unit, '   576   666 lineto\n' );
  fprintf ( eps_unit, '    36   666 lineto\n' );
  fprintf ( eps_unit, '    36   126 lineto\n' );
  fprintf ( eps_unit, 'stroke\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '% Set RGB line color.\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, ' 0.0000 0.0000 0.0000 setrgbcolor\n' );

  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '%  Label the plot:\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, ' 0.0000 0.0000 0.0000 setrgbcolor\n' );
  fprintf ( eps_unit, '/Times-Roman findfont 0.50 inch scalefont setfont\n' );
  fprintf ( eps_unit, '    36   666 moveto\n' );
  fprintf ( eps_unit, '(%s) show\n', title );

  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '% Define a clipping polygon\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '    36   126 moveto\n' );
  fprintf ( eps_unit, '   576   126 lineto\n' );
  fprintf ( eps_unit, '   576   666 lineto\n' );
  fprintf ( eps_unit, '    36   666 lineto\n' );
  fprintf ( eps_unit, '    36   126 lineto\n' );
  fprintf ( eps_unit, 'clip newpath\n' );

  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '%  Draw the boundary in red:\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, ' 0.9000 0.0000 0.0000 setrgbcolor\n' );
  fprintf ( eps_unit, 'newpath\n' );
  fprintf ( eps_unit, '    61   151 moveto\n' );
  fprintf ( eps_unit, '   551   151 lineto\n' );
  fprintf ( eps_unit, '   551   641 lineto\n' );
  fprintf ( eps_unit, '    61   641 lineto\n' );
  fprintf ( eps_unit, '    61   151 lineto\n' );
  fprintf ( eps_unit, 'stroke\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '%  Draw filled dots at each node:\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, ' 0.0000 0.0000 0.9000 setrgbcolor\n' );

  for node = 1 : node_num

    eps_x = ( ( node_x_max - node_xy(1,node)              ) *  61.0 ...
            + (            + node_xy(1,node) - node_x_min ) * 551.0 ) ...
      / sscale;

    eps_y = ( ( node_y_max - node_xy(2,node)              ) * 151.0 ...
            + (              node_xy(2,node) - node_y_min ) * 641.0 ) ...
      / sscale;

    fprintf ( eps_unit, 'newpath  %d  %d  %d  0 360 arc closepath fill\n', ...
      eps_x, eps_y, circle_size );

  end

  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, 'restore showpage\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '% End of page\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '%%Trailer\n' );
  fprintf ( eps_unit, '%%EOF\n' );

  fclose ( eps_unit );

  if ( DEBUG )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POINTS_EPS:\n' );
    fprintf ( 1, '  An encapsulated PostScript file was created\n' );
    fprintf ( 1, '  containing an image of the points.\n' );
    fprintf ( 1, '  The file is named "%s".\n', file_name );
  end

  return
end
