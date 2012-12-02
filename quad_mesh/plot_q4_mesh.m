function plot_q4_mesh ( node_num, element_num, node_xy, element_node, ...
  node_show, element_show, output_filename )

%*****************************************************************************80
%
%% TPLOT_Q4_MESH plots a Q4 mesh.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(4,ELEMENT_NUM), the nodes 
%    that form the elements.
%
%    Input, logical NODE_SHOW:
%    0, do not show the nodes.
%    1, show the nodes.
%    2, show the nodes, and label them.
%
%    Input, logical ELEMENT_SHOW, 
%    0, do not show the elements.
%    1, show the elements.
%    2, show the elements, and label them.
%
%    Input, string OUTPUT_FILENAME, the name of the output file.
%
  element_order = 4;

  x_ps_max = 576;
  x_ps_max_clip = 594;
  x_ps_min = 36;
  x_ps_min_clip = 18;
  y_ps_max = 666;
  y_ps_max_clip = 684;
  y_ps_min = 126;
  y_ps_min_clip = 108;

  date_time = timestring ( );
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
%  Plot the mesh.
%
  file_unit = fopen ( output_filename, 'wt' );

  if ( file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLOT_Q4_MESH - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'PLOT_Q4_MESH - Fatal error!' );
  end

  fprintf ( file_unit, '%%!PS-Adobe-3.0 EPSF-3.0\n' );
  fprintf ( file_unit, '%%%%Creator: plot_q4_mesh.m\n' );
  fprintf ( file_unit, '%%%%Title: %s\n', output_filename );
  fprintf ( file_unit, '%%%%CreationDate: %s\n', date_time );
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
%  Draw the elements.
%
  if ( 1 <= element_show )

    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Set the RGB color to red.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '0.900  0.200  0.100 setrgbcolor\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Draw the elements.\n' );
    fprintf ( file_unit, '%%\n' );

    for element = 1 : element_num

      fprintf ( file_unit, 'newpath\n' );

      for i = 1 : element_order + 1

        e = i4_wrap ( i, 1, element_order )

        node = element_node(e,element);

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
%  Label the elements.
%
  if ( 2 <= element_show )
      
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Label the elements.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '%%  Set the RGB color to darker red.\n' );
    fprintf ( file_unit, '%%\n' );
    fprintf ( file_unit, '0.950  0.250  0.150 setrgbcolor\n' );
    fprintf ( file_unit, '/Times-Roman findfont\n' );
    fprintf ( file_unit, '0.20 inch scalefont\n' );
    fprintf ( file_unit, 'setfont\n' );
    fprintf ( file_unit, '%%\n' );

    for element = 1 : element_num

      ave_x = 0.0;
      ave_y = 0.0;

      for i = 1 : element_order
          
        node = element_node(i,element);
        ave_x = ave_x + node_xy(1,node);
        ave_y = ave_y + node_xy(2,node);
      end
      
      ave_x = ave_x / element_order;
      ave_y = ave_y / element_order;

      x_ps = floor ( ...
        ( ( x_max - ave_x         ) * x_ps_min ...
        + (         ave_x - x_min ) * x_ps_max ) ...
        / ( x_max         - x_min ) );

      y_ps = floor ( ...
        ( ( y_max - ave_y         ) * y_ps_min ...
        + (         ave_y - y_min ) * y_ps_max ) ...
        / ( y_max         - y_min ) );

      fprintf ( file_unit, '  %d  %d  moveto (%d) show\n', ...
        x_ps, y_ps, element );

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
