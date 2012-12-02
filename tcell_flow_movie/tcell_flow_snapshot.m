function tcell_flow_snapshot ( upfile )

%*****************************************************************************80
%
%% TCELL_FLOW_SNAPSHOT displays the flow field for a T-Cell snapshot.
%
%  Discussion:
%
%    This MATLAB function file reads the T-Cell flow data for a single timestep:
%
%      geometry (XY values at nodes, assumed to be in 'xy.txt') 
%      flow (UV values at nodes, filename given in UPFILE)
%
%    and plots the velocity vectors (U,V)(X,Y).
%
%    The file plots either the velocity vector field, or the velocity
%    direction field, depending on the value of the internal logical
%    parameter "normalized".
%
%    The MATLAB routine quiver internally scales the vectors, but this
%    can be adjusted by using a value of SCALE that is not 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 July 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, filename UPFILE, the name of a file containing the velocity
%    components for a flow in the TCELL.
%
  FALSE = 0;
  TRUE = 1;
  scale = 1.0;
  normalized = TRUE;

  load xy.txt;

  x = xy(:,1);
  y = xy(:,2);
%
%  Compute the thinning index.
%
  thin_factor = 4;
  thin_dex = thin_index ( x, y, thin_factor );
  x = x(thin_dex);
  y = y(thin_dex);
%
%  Set the coordinates of the boundary and the invisible bounding box that
%  allows us to display the file name within the plot area.
%
  bx1 = [ 0.00, 1.00, 1.00, 0.00, 0.00, 0.00 ];
  by1 = [ 1.00, 1.00, 0.99, 0.99, 0.99, 1.00 ];

  bx2 = [ 0.00, 0.25, 0.25, 0.75, 0.75, 1.00, 1.00, 0.74, 0.74, 0.26, 0.26, 0.00, 0.00];
  by2 = [ 0.50, 0.50, 0.00, 0.00, 0.50, 0.50, 0.51, 0.51, 0.01, 0.01, 0.51, 0.51, 0.50];

  bx3 = [ -0.10,  1.10, 1.10, -0.10, -0.10 ];
  by3 = [ -0.10, -0.10, 1.10,  1.10, -0.10 ];
%
%  Read the velocity data, thin it, and if requested, normalize it.
%
  uv = load ( upfile );
  u = uv(thin_dex,1);
  v = uv(thin_dex,2);
  if ( normalized == TRUE )
    norm = sqrt ( u.^2 + v.^2 );
    nonzero = find ( norm ~= 0.0 );
    u(nonzero) = u(nonzero) ./ norm(nonzero);
    v(nonzero) = v(nonzero) ./ norm(nonzero);
  end
%
%  Display the vector field.
%
  quiver ( x, y, u, v, scale )
%
%  Draw the boundary, and the invisible bounding box.
%
  line ( bx1, by1, 'color', 'r' )
  line ( bx2, by2, 'color', 'r' )
  line ( bx3, by3, 'color', 'w' )
  axis equal
  
  if ( normalized == TRUE )
    title ( 'T-Cell Direction Field' )
  else
    title ( 'T-Cell Flow Field' )
  end

  text ( 0.420, 1.03, upfile )

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

  for i = 1 : node_num

    unique = TRUE;

    for j = 1 : x_unique_num
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

  for i = 1 : node_num

    unique = TRUE;

    for j = 1 : y_unique_num
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

  for i = 1 : node_num

    for j = 1 : x_unique_num-1
      if ( x_unique(j) <= x(i) & x(i) <= x_unique(j+1) )
        x_bin = j;
        break;
      end
    end

    for j = 1 : y_unique_num-1
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
