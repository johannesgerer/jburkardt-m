function triangulation_order3_plot ( file_name, node_num, node_xy, ...
  triangle_num, triangle_node, node_show, triangle_show )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_PLOT plots a 3-node triangulation of a pointset.
%
%  Discussion:
%
%    The triangulation is most usually a Delaunay triangulation,
%    but this is not necessary.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the name of the output file.
%
%    Input, integer NODE_NUM, the number of points.
%
%    Input, real NODE_XY(2,NODE_NUM), the nodes.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(3,TRIANGLE_NUM), lists, for each triangle,
%    the indices of the points that form the vertices of the triangle.
%
%    Input, logical NODE_SHOW:
%    0, do not show the nodes.
%    1, show the nodes.
%    2, show the nodes, and label them.
%
%    Input, logical TRIANGLE_SHOW, 
%    0, do not show the trangles.
%    1, show the triangles.
%    2, show the triangles, and label them.
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
  x_max = max ( node_xy(1,1:node_num) );
  x_min = min ( node_xy(1,1:node_num) );
  x_scale = x_max - x_min;
  
  x_max = x_max + 0.05 * x_scale;
  x_min = x_min - 0.05 * x_scale;
  x_scale = x_max - x_min;

  y_max = max ( node_xy(2,1:node_num) );
  y_min = min ( node_xy(2,1:node_num) );
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
    fprintf ( 1, 'TRIANGULATION_ORDER3_PLOT - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'TRIANGULATION_ORDER3_PLOT - Fatal error!' );
  end

  fprintf ( file_unit, '%%!PS-Adobe-3.0 EPSF-3.0\n' );
  fprintf ( file_unit, '%%%%Creator: triangulation_order3_plot.m\n' );
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
%
%  Draw the nodes.
%
  if ( node_num <= 200 )
    circle_size = 5;
  elseif ( node_num <= 500 )
    circle_size = 4;
  elseif ( node_num <= 1000 )
    circle_size = 3;
  elseif ( node_num <= 5000 )
    circle_size = 2;
  else
    circle_size = 1;
  end

  if ( 1 <= node_show )

    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Draw filled dots at the nodes.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Set the RGB color to blue.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '0.000  0.150  0.750 setrgbcolor\n' );
    fprintf ( file_unit, '%%\n' );

    for node = 1 : node_num

      x_ps = floor ( ...
        ( ( x_max - node_xy(1,node)         ) * x_ps_min ...
        + (         node_xy(1,node) - x_min ) * x_ps_max ) ...
        / ( x_max                   - x_min ) );

      y_ps = floor ( ...
        ( ( y_max - node_xy(2,node)         ) * y_ps_min   ...
        + (         node_xy(2,node) - y_min ) * y_ps_max ) ...
        / ( y_max                   - y_min ) );

      fprintf ( file_unit, ...
        '  newpath  %d  %d  %d 0 360 arc closepath fill\n', ...
        x_ps, y_ps, circle_size );

    end

  end
%
%  Label the nodes.
%
  if ( 2 <= node_show )
      
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Label the nodes.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Set the RGB color to darker blue.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '0.000  0.250  0.850 setrgbcolor\n' );
    fprintf ( file_unit, '/Times-Roman findfont\n' );
    fprintf ( file_unit, '0.20 inch scalefont\n' );
    fprintf ( file_unit, 'setfont\n' );
    fprintf ( file_unit, '%%\n' );

    for node = 1 : node_num

      x_ps = floor ( ...
        ( ( x_max - node_xy(1,node)         ) * x_ps_min ...
        + (         node_xy(1,node) - x_min ) * x_ps_max ) ...
        / ( x_max                   - x_min ) );

      y_ps = floor ( ...
        ( ( y_max - node_xy(2,node)         ) * y_ps_min   ...
        + (         node_xy(2,node) - y_min ) * y_ps_max ) ...
        / ( y_max                   - y_min ) );

      fprintf ( file_unit, '  %d  %d  moveto (%d) show\n', ...
        x_ps, y_ps+5, node );

    end

  end
%
%  Draw the triangles.
%
  if ( 1 <= triangle_show )

    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Set the RGB color to red.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '0.900  0.200  0.100 setrgbcolor\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Draw the triangles.\n' );
    fprintf ( file_unit, '%%\n' );

    for triangle = 1 : triangle_num

      fprintf ( file_unit, 'newpath\n' );

      for i = 1 : 4

        e = i;
        if ( e == 4 )
          e = 1;
        end

        node = triangle_node(e,triangle);

        x_ps = floor ( ...
          ( ( x_max - node_xy(1,node)         ) * x_ps_min ...
          + (         node_xy(1,node) - x_min ) * x_ps_max ) ...
          / ( x_max                   - x_min ) );

        y_ps = floor ( ...
          ( ( y_max - node_xy(2,node)         ) * y_ps_min ...
          + (         node_xy(2,node) - y_min ) * y_ps_max ) ...
          / ( y_max                   - y_min ) );

        if ( i == 1 )
          fprintf ( file_unit, '  %d  %d  moveto\n', x_ps, y_ps );
        else
          fprintf ( file_unit, '  %d  %d  lineto\n', x_ps, y_ps );
        end

      end

      fprintf ( file_unit, 'stroke\n' );

    end

  end
%
%  Label the triangles.
%
  if ( 2 <= triangle_show )
      
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Label the triangles.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Set the RGB color to darker red.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '0.950  0.250  0.150 setrgbcolor\n' );
    fprintf ( file_unit, '/Times-Roman findfont\n' );
    fprintf ( file_unit, '0.20 inch scalefont\n' );
    fprintf ( file_unit, 'setfont\n' );
    fprintf ( file_unit, '%%\n' );

    for triangle = 1 : triangle_num

      ave_x = 0.0;
      ave_y = 0.0;

      for i = 1 : 3
          
        node = triangle_node(i,triangle);
        ave_x = ave_x + node_xy(1,node);
        ave_y = ave_y + node_xy(2,node);
      end
      
      ave_x = ave_x / 3.0;
      ave_y = ave_y / 3.0;

      x_ps = floor ( ...
        ( ( x_max - ave_x         ) * x_ps_min ...
        + (         ave_x - x_min ) * x_ps_max ) ...
        / ( x_max         - x_min ) );

      y_ps = floor ( ...
        ( ( y_max - ave_y         ) * y_ps_min ...
        + (         ave_y - y_min ) * y_ps_max ) ...
        / ( y_max         - y_min ) );

      fprintf ( file_unit, '  %d  %d  moveto (%d) show\n', ...
        x_ps, y_ps, triangle );

    end
  end

  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, 'restore  showpage\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  End of page.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%%%Trailer\n' );
  fprintf ( file_unit, '%%%%EOF\n' );

  fclose ( file_unit );

  return
end
