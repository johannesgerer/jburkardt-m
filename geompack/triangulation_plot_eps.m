function triangulation_plot_eps ( file_name, g_num, g_xy, tri_num, nod_tri )

%*****************************************************************************80
%
%% TRIANGULATION_PLOT_EPS plots a triangulation of a pointset.
%
%  Discussion:
%
%    The triangulation is most usually a Delaunay triangulation,
%    but this is not necessary.
%
%  Modified:
%
%    28 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character(*) FILE_NAME, the name of the output file.
%
%    Input, integer G_NUM, the number of points.
%
%    Input, real G_XY(2,G_NUM), the coordinates of the points.
%
%    Input, integer TRI_NUM, the number of triangles.
%
%    Input, integer NOD_TRI(3,TRI_NUM), lists, for each triangle,
%    the indices of the points that form the vertices of the triangle.
%
  x_ps_max = 576;
  x_ps_max_clip = 594;
  x_ps_min = 36;
  x_ps_min_clip = 18;
  y_ps_max = 666;
  y_ps_max_clip = 684;
  y_ps_min = 126;
  y_ps_min_clip = 108;
%
%  We need to do some figuring here, so that we can determine
%  the range of the data, and hence the height and width
%  of the piece of paper.
%
  x_max = max ( g_xy(1,1:g_num) );
  x_min = min ( g_xy(1,1:g_num) );
  x_scale = x_max - x_min;
  
  x_max = x_max + 0.05 * x_scale;
  x_min = x_min - 0.05 * x_scale;
  x_scale = x_max - x_min;

  y_max = max ( g_xy(2,1:g_num) );
  y_min = min ( g_xy(2,1:g_num) );
  y_scale = y_max - y_min;

  y_max = y_max + 0.05 * y_scale;
  y_min = y_min - 0.05 * y_scale;
  y_scale = y_max - y_min;

  if ( x_scale < y_scale )

    delta = round ( ( x_ps_max - x_ps_min ) ...
      * ( y_scale - x_scale ) / ( 2.0 * y_scale ) );

    x_ps_max = x_ps_max - delta;
    x_ps_min = x_ps_min + delta;

    x_ps_max_clip = x_ps_max_clip - delta;
    x_ps_min_clip = x_ps_min_clip + delta;

    x_scale = y_scale;

  elseif ( y_scale < x_scale )

    delta = round ( ( y_ps_max - y_ps_min ) ...
      * ( x_scale - y_scale ) / ( 2.0 * x_scale ) );

    y_ps_max      = y_ps_max - delta;
    y_ps_min      = y_ps_min + delta;

    y_ps_max_clip = y_ps_max_clip - delta;
    y_ps_min_clip = y_ps_min_clip + delta;

    y_scale = x_scale;

  end
%
%  Plot the triangulation.
%
  file_unit = fopen ( file_name, 'wt' );

  if ( file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_PLOT_EPS - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'TRIANGULATION_PLOT_EPS - Fatal error!' );
  end

  fprintf ( file_unit, '%%!PS-Adobe-3.0 EPSF-3.0\n' );
  fprintf ( file_unit, '%%%%Creator: triangulation_plot_eps.m\n' );
  fprintf ( file_unit, '%%%%Title: %s\n', file_name );
  fprintf ( file_unit, '%%%%Pages: 1\n' );
  fprintf ( file_unit, '%%%%BoundingBox:  %d  %d  %d  %d\n', ...
    x_ps_min, y_ps_min, x_ps_max, y_ps_max );
  fprintf ( file_unit, '%%%%Document-Fonts: Times-Roman\n' );
  fprintf ( file_unit, '%%%%LanguageLevel: 1\n' );
  fprintf ( file_unit, '%%%%EndComments\n' );
  fprintf ( file_unit, '%%%%BeginProlog\n' );
  fprintf ( file_unit, '/inch {72 mul} def\n' );
  fprintf ( file_unit, '%%%%EndProlog\n' );
  fprintf ( file_unit, '%%%%Page: 1 1\n' );
  fprintf ( file_unit, 'save\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Set the RGB color to very light gray.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '0.900  0.900  0.900 setrgbcolor\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Draw a gray border around the page.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, 'newpath\n' );
  fprintf ( file_unit, '  %d  %d  moveto\n', x_ps_min, y_ps_min );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_max, y_ps_min );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_max, y_ps_max );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_min, y_ps_max );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_min, y_ps_min );
  fprintf ( file_unit, 'stroke\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Set the RGB color to black.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '0.000  0.000  0.000 setrgbcolor\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Set the font and its size.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '/Times-Roman findfont\n' );
  fprintf ( file_unit, '0.50 inch scalefont\n' );
  fprintf ( file_unit, 'setfont\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Print a title.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%210  702  moveto\n' );
  fprintf ( file_unit, '%%(Triangulation)  show\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Define a clipping polygon.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, 'newpath\n' );
  fprintf ( file_unit, '  %d  %d  moveto\n', x_ps_min_clip, y_ps_min_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_max_clip, y_ps_min_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_max_clip, y_ps_max_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_min_clip, y_ps_max_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_min_clip, y_ps_min_clip );
  fprintf ( file_unit, 'clip newpath\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Set the RGB color to green.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '0.000  0.750  0.150 setrgbcolor\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Draw the nodes.\n' );
  fprintf ( file_unit, '%%\n' );

  for g = 1 : g_num

    x_ps = floor ( ...
      ( ( x_max - g_xy(1,g)         ) * x_ps_min ...
      + (         g_xy(1,g) - x_min ) * x_ps_max ) ...
      / ( x_max             - x_min ) );

    y_ps = floor ( ...
      ( ( y_max - g_xy(2,g)         ) * y_ps_min   ...
      + (         g_xy(2,g) - y_min ) * y_ps_max ) ...
      / ( y_max             - y_min ) );

    fprintf ( file_unit, '  newpath  %d  %d  5 0 360 arc closepath fill\n', x_ps, y_ps );

  end

  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Set the RGB color to red.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '0.900  0.200  0.100 setrgbcolor\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Draw the triangles.\n' );
  fprintf ( file_unit, '%%\n' );

  for t = 1 : tri_num

    fprintf ( file_unit, 'newpath\n' );

    for j = 1 : 4

      e = j;
      if ( e == 4 )
        e = 1;
      end

      k = nod_tri(e,t);

      x_ps = floor ( ...
        ( ( x_max - g_xy(1,k)         ) * x_ps_min ...
        + (         g_xy(1,k) - x_min ) * x_ps_max ) ...
        / ( x_max             - x_min ) );

      y_ps = floor ( ...
        ( ( y_max - g_xy(2,k)         ) * y_ps_min ...
        + (         g_xy(2,k) - y_min ) * y_ps_max ) ...
        / ( y_max             - y_min ) );

      if ( j == 1 )
        fprintf ( file_unit, '  %d  %d  moveto\n', x_ps, y_ps );
      else
        fprintf ( file_unit, '  %d  %d  lineto\n', x_ps, y_ps );
      end

    end

    fprintf ( file_unit, 'stroke\n' );

  end

  fprintf ( file_unit, 'restore  showpage\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  End of page.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%%Trailer\n' );
  fprintf ( file_unit, '%%%%EOF\n' );

  fclose ( file_unit );

  return
end
