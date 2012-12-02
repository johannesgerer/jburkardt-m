function elements_eps ( file_name, node_num, node_x, node_y, code, ...
  element_order, element_num, element_mask, element_node, title )

%*****************************************************************************80
%
%% ELEMENTS_EPS creates an EPS file image of the elements of a grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the name of the file to create.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_X(NODE_NUM), NODE_Y(NODE_NUM), the
%    coordinates of the nodes.
%
%    Input, string CODE, the code for the element.
%
%    Input, integer ELEMENT_ORDER, the element order.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, logical ELEMENT_MASK(ELEMENT_NUM), a mask for the elements.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), the
%    element->node data.
%
%    Input, string TITLE, a title for the plot.
%
  circle_size = 3;
  x_ps_max = 576;
  x_ps_max_clip = 594;
  x_ps_min = 36;
  x_ps_min_clip = 18;
  y_ps_max = 666;
  y_ps_max_clip = 684;
  y_ps_min = 126;
  y_ps_min_clip = 108;
%
%  Determine the range of the unmasked elements.
%
  x_min =  Inf;
  x_max = -Inf;
  y_min =  Inf;
  y_max = -Inf;

  node_mask(1:node_num) = 0;

  for element = 1 : element_num
    if ( element_mask(element) )
      for j = 1 : element_order
        node = element_node(j,element);
        node_mask(node) = 1;
        x_min = min ( x_min, node_x(node) );
        x_max = max ( x_max, node_x(node) );
        y_min = min ( y_min, node_y(node) );
        y_max = max ( y_max, node_y(node) );
      end
    end
  end

  x_scale = x_max - x_min;
  x_max = x_max + 0.05 * x_scale;
  x_min = x_min - 0.05 * x_scale;
  x_scale = x_max - x_min;

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
    fprintf ( 1, 'ELEMENTS_EPS - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'ELEMENTS_EPS - Fatal error!' );
  end

  fprintf ( file_unit, '%!PS-Adobe-3.0 EPSF-3.0\n' );
  fprintf ( file_unit, '%%Creator: elements_eps.m\n' );
  fprintf ( file_unit, '%%Title: %s\n', file_name );
  fprintf ( file_unit, '%%Pages: 1\n' );
  fprintf ( file_unit, '%%%%BoundingBox:  %d  %d  %d  %d\n', ...
    x_ps_min, y_ps_min, x_ps_max, y_ps_max );
  fprintf ( file_unit, '%%Document-Fonts: Times-Roman\n' );
  fprintf ( file_unit, '%%LanguageLevel: 1\n' );
  fprintf ( file_unit, '%%EndComments\n' );
  fprintf ( file_unit, '%%BeginProlog\n' );
  fprintf ( file_unit, '/inch {72 mul} def\n' );
  fprintf ( file_unit, '%%EndProlog\n' );
  fprintf ( file_unit, '%%Page:      1     1\n' );
  fprintf ( file_unit, 'save\n' );
  fprintf ( file_unit, '%\n' );
  fprintf ( file_unit, '% Set RGB line color.\n' );
  fprintf ( file_unit, '%\n' );
  fprintf ( file_unit, ' 0.9000 0.9000 0.9000 setrgbcolor\n' );
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
  fprintf ( file_unit, '%\n' );
  fprintf ( file_unit, '% Set RGB line color.\n' );
  fprintf ( file_unit, '%\n' );
  fprintf ( file_unit, ' 0.0000 0.0000 0.0000 setrgbcolor\n' );

  fprintf ( file_unit, '%\n' );
  fprintf ( file_unit, '%  Label the plot:\n' );
  fprintf ( file_unit, '%\n' );
  fprintf ( file_unit, ' 0.0000 0.0000 0.0000 setrgbcolor\n' );
  fprintf ( file_unit, '/Times-Roman findfont 0.50 inch scalefont setfont\n' );
  fprintf ( file_unit, '    36   666 moveto\n' );
  fprintf ( file_unit, '(%s) show\n', title );

  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, '%%  Define a clipping polygon.\n' );
  fprintf ( file_unit, '%%\n' );
  fprintf ( file_unit, 'newpath\n' );
  fprintf ( file_unit, '  %d  %d  moveto\n', x_ps_min_clip, y_ps_min_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_max_clip, y_ps_min_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_max_clip, y_ps_max_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_min_clip, y_ps_max_clip );
  fprintf ( file_unit, '  %d  %d  lineto\n', x_ps_min_clip, y_ps_min_clip );
  fprintf ( file_unit, 'clip newpath\n' );;

  fprintf ( file_unit, '%\n' );
  fprintf ( file_unit, '%  Draw filled dots at each node:\n' );
  fprintf ( file_unit, '%\n' );
  fprintf ( file_unit, ' 0.0000 0.0000 0.9000 setrgbcolor\n' );

  for node = 1 : node_num

    if ( node_mask(node) )

      eps_x = floor ( ...
        ( ( x_max - node_x(node)         ) * x_ps_min   ...
        + (       + node_x(node) - x_min ) * x_ps_max ) ...
        / ( x_max               - x_min ) );

      eps_y = floor ( ...
        ( ( y_max - node_y(node)         ) * y_ps_min   ...
        + (         node_y(node) - y_min ) * y_ps_max ) ...
        / ( y_max                   - y_min ) );

      fprintf ( file_unit, ...
        'newpath  %d  %d  %d  0 360 arc closepath fill\n', ...
        eps_x, eps_y, circle_size );

    end

  end

  fprintf ( file_unit, '%\n' );
  fprintf ( file_unit, '%  Label the nodes:\n' );
  fprintf ( file_unit, '%\n' );
  fprintf ( file_unit, ' 0.0000 0.0000 1.0000 setrgbcolor\n' );
  fprintf ( file_unit, '/Times-Roman findfont 0.20 inch scalefont setfont\n' );

  for node = 1 : node_num

    if ( node_mask(node) )

      eps_x = floor ( ...
        ( ( x_max - node_x(node)         ) * x_ps_min   ...
        + (       + node_x(node) - x_min ) * x_ps_max ) ...
        / ( x_max               - x_min ) );

      eps_y = floor ( ...
        ( ( y_max - node_y(node)         ) * y_ps_min   ...
        + (         node_y(node) - y_min ) * y_ps_max ) ...
        / ( y_max                - y_min ) );

      fprintf ( file_unit, '  %d  %d  moveto (%d) show\n', ...
        eps_x, eps_y+5, node );

    end

  end

  fprintf ( file_unit, '%\n' );
  fprintf ( file_unit, '%  Draw the element sides:\n' );
  fprintf ( file_unit, '%\n' );
  fprintf ( file_unit, ' 0.9000 0.0000 0.0000 setrgbcolor\n' );

  for element = 1 : element_num

    if ( ~element_mask(element) )
      continue
    end

    local = 1;
    node = element_node(local,element);

    eps_x = floor ( ...
      ( ( x_max - node_x(node)         ) * x_ps_min   ...
      + (       + node_x(node) - x_min ) * x_ps_max ) ...
      / ( x_max                - x_min ) );

    eps_y = floor ( ...
      ( ( y_max - node_y(node)         ) * y_ps_min   ...
      + (         node_y(node) - y_min ) * y_ps_max ) ...
      / ( y_max                - y_min ) );

    fprintf ( file_unit, 'newpath %d  %d  moveto\n', eps_x, eps_y );

    while ( 1 )

      local = next_boundary_node ( local, code );
      node = element_node(local,element);

      eps_x = floor ( ...
        ( ( x_max - node_x(node)         ) * x_ps_min   ...
        + (       + node_x(node) - x_min ) * x_ps_max ) ...
        / ( x_max                - x_min ) );

      eps_y = floor ( ...
        ( ( y_max - node_y(node)         ) * y_ps_min   ...
        + (         node_y(node) - y_min ) * y_ps_max ) ...
        / ( y_max                - y_min ) );

      fprintf ( file_unit, '%4d  %4d  lineto\n', eps_x, eps_y );

      if ( local == 1 )
        break
      end

    end

    fprintf ( file_unit, 'stroke\n' );

  end

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

  for element = 1 : element_num

    if ( ~element_mask(element) )
      continue
    end

    ave_x = 0.0;
    ave_y = 0.0;

    for i = 1 : element_order

      node = element_node(i,element);

      ave_x = ave_x + node_x(node);
      ave_y = ave_y + node_y(node);

    end

    ave_x = ave_x / element_order;
    ave_y = ave_y / element_order;

    eps_x = floor ( ...
      ( ( x_max - ave_x         ) * x_ps_min   ...
      + (       + ave_x - x_min ) * x_ps_max ) ...
      / ( x_max - x_min ) );

    eps_y = floor ( ...
      ( ( y_max - ave_y         ) * y_ps_min   ...
      + (         ave_y - y_min ) * y_ps_max ) ...
      / ( y_max - y_min ) );

    fprintf ( file_unit, '  %4d  %4d  moveto (%d) show\n', ...
      eps_x, eps_y, element );

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
