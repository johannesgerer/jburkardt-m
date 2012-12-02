function inout_flow_display ( file )

%*****************************************************************************80
%
%% INOUT_FLOW_DISPLAY plots one snapshot of the In/Out flow.
%
%  Discussion:
%
%    This MATLAB function file can plot the region, elements, velocity
%    directions or velocity vectors for the INOUT flow.
%
%    In order to use it properly, make sure you have set the internal
%    value of PLOT, and passed the appropriate value of FILE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, filename FILE, the name of the element file or velocity file 
%    to plot.  If only the region is to be displayed, then FILE can be a 
%    dummy value.
%
%  Local Parameters:
%
%    Local integer PLOT, determines the plot to make:
%    0, draw the region only.
%    1, draw the region and the elements.
%    2, draw the region and the normalized velocity direction field.
%    3, draw the region and the scaled velocity vectors.
%
%    Local, real SCALE, a multiplier that can be used to lengthen
%    or shorten all the velocity vectors.
%
%    Local, integer THIN_FACTOR, is used to reduce the number of vectors
%    that are plotted.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'INOUT_FLOW_DISPLAY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plotting routine for the INOUT problem.\n' );

  FALSE = 0;
  TRUE = 1;
  scale = 1.0;

  REGION = 0;
  ELEMENTS = 1;
  NORMALIZED = 2;
  VECTORS = 3;

  plot = ELEMENTS;

  if ( plot == REGION )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Requested plot is REGION.\n' );
    fprintf ( 1, '  Only the XY file is needed.\n' );
  elseif ( plot == ELEMENTS )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Requested plot is ELEMENTS\n' );
    fprintf ( 1, '  The XY file is needed.\n' );
    fprintf ( 1, '  The ELEMENTS file must be passed in.\n' );
  elseif ( plot == NORMALIZED )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Requested plot is NORMALIZED\n' );
    fprintf ( 1, '  The XY file is needed.\n' );
    fprintf ( 1, '  The velocity file must be passed in.\n' );
  elseif ( plot == VECTORS )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Requested plot is VECTORS.\n' );
    fprintf ( 1, '  The XY file is needed.\n' );
    fprintf ( 1, '  The velocity file must be passed in.\n' );
  end

  fprintf ( 1, '  Velocity scaling factor is %f\n' );
%
%  Get the node coordinates.
%
  load xy.txt;

  x = xy(:,1);
  y = xy(:,2);
%
%  Thin the data.
%
  if ( plot == NORMALIZED | plot == VECTORS )

    thin_factor = 2;
    fprintf ( 1, '  Thinning factor is %d\n', thin_factor );
    thin_dex = thin_index ( x, y, thin_factor );
    x = x(thin_dex);
    y = y(thin_dex);

  end
%
%  Set the coordinates of the boundary and the invisible bounding box that
%  allows us to display the file name within the plot area.
%
  bx1 = [-0.01, 1.01, 1.01, 1.00, 1.00,-0.01,-0.01 ];
  by1 = [-0.01,-0.01, 0.80, 0.80, 0.00, 0.00,-0.01 ];

  bx2 = [-0.01,-0.01, 1.01, 1.01, 0.00, 0.00,-0.01 ];
  by2 = [ 0.20, 1.01, 1.01, 1.00, 1.00, 0.20, 0.20 ];

  bx3 = [ -0.10,  1.10, 1.10, -0.10, -0.10 ];
  by3 = [ -0.10, -0.10, 1.10,  1.10, -0.10 ];
%
%  Display the elements.
%
  if ( plot == ELEMENTS )
    element_node = load ( file );
    [ element_num, element_order ] = size ( element_node );
    for element = 1 : element_num
      bx = x(element_node(element,[1,4,2,5,3,6,1]));
      by = y(element_node(element,[1,4,2,5,3,6,1]));
      line ( bx, by, 'color', 'g' );
    end
  end
%
%  Read the velocity data, thin it, and if requested, normalize it.
%
  if ( plot == NORMALIZED | plot == VECTORS )

    uv = load ( file );
    u = uv(thin_dex,1);
    v = uv(thin_dex,2);

    if ( plot == NORMALIZED )
      norm = sqrt ( u.^2 + v.^2 );
      nonzero = find ( norm ~= 0.0 );
      u(nonzero) = u(nonzero) ./ norm(nonzero);
      v(nonzero) = v(nonzero) ./ norm(nonzero);
    end
%
%  Display the vector field.
%
    quiver ( x,  y, u, v, scale )

  end 
%
%  Draw the boundary, and the invisible bounding box.
%
  line ( bx1, by1, 'color', 'r' )
  line ( bx2, by2, 'color', 'r' )
  line ( bx3, by3, 'color', 'w' )
  axis equal
  
  if ( plot == REGION )
    title ( 'In/Out Flow Region' )
  elseif ( plot == ELEMENTS )
    title ( 'In/Out Elements' )
  elseif ( plot == NORMALIZED )
    title ( 'In/Out Direction Field' )
  else
    title ( 'In/Out Flow Field' )
  end

  text ( 0.420, 1.03, file )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'INOUT_FLOW_DISPLAY\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function thin_dex = thin_index ( x, y, thin_factor )

%*****************************************************************************80
%
%%  THIN_INDEX determines thinning indices for a X, Y data.
%
%  Discussion:
%
%    A set of X, Y data is given, that is presumably, not too far off
%    from being on a rectangular grid.
%
%    The input value of THIN_FACTOR indicates by how much the data should
%    be thinned.
%
%    The X and Y ranges are computed, and only those data points are
%    retained for which both X and Y lie in an appropriate subrange.
%
%    For instance, a THIN_FACTOR of 2 would essentially save data
%    that lay in the black squares of a checkerboard.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 June
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(NODE_NUM), Y(NODE_NUM), the X and Y coordinates
%    of the nodes.
%
%    Input, integer THIN_FACTOR, the thinning factor.
%
%    Output, integer THIN_DEX(NODE_NUM), contains in (1:THIN_NUM) the
%    indices into X and Y of the vectors to be retained after thinning.
%
  TRUE = 1;
  FALSE = 0;

  node_num = length ( x );

  x_unique_num = 0;

  for ( i = 1 : node_num )

    unique = TRUE;

    for ( j = 1 : x_unique_num )
      if ( x(i) == x_unique(j) )
        unique = FALSE;
        break;
      end
    end

    if ( unique )
      x_unique_num = x_unique_num + 1;
      x_unique(x_unique_num) = x(i);
    end

  end

  sort ( x_unique );

  y_unique_num = 0;

  for ( i = 1 : node_num )

    unique = TRUE;

    for ( j = 1 : y_unique_num )
      if ( y(i) == y_unique(j) )
        unique = FALSE;
        break;
      end
    end

    if ( unique )
      y_unique_num = y_unique_num + 1;
      y_unique(y_unique_num) = y(i);
    end

  end

  sort ( y_unique );

  thin_num = 0;

  for ( i = 1 : node_num )

    for ( j = 1 : x_unique_num-1 )
      if ( x_unique(j) <= x(i) & x(i) <= x_unique(j+1) )
        x_bin = j;
        break;
      end
    end

    for ( j = 1 : y_unique_num-1 )
      if ( y_unique(j) <= y(i) & y(i) <= y_unique(j+1) )
        y_bin = j;
        break;
      end
    end

    if ( mod ( y_bin, thin_factor ) == thin_factor / 2 & ...
         mod ( x_bin, thin_factor ) == thin_factor / 2 )

      thin_num = thin_num + 1;
      thin_dex(thin_num) = i;

    end

  end

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
