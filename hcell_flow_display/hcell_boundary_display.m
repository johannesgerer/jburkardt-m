function hcell_boundary_display ( color )

%*****************************************************************************80
%
%% HCELL_BOUNDARY_DISPLAY displays the boundary of the H-Cell.
%
%  Discussion:
%
%    This routine can only ADD graphics to an already existing plot.
%    So call PLOT first and then this routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character COLOR, indicates the color to be used
%    in drawing the boundary.  'r' will draw red, 'w' will
%    be white (invisible) and so on.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HCELL_BOUNDARY_DISPLAY:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Display the boundary in the HCELL problem.\n' );
%
%  If no color, use red.
%
  if ( nargin < 1 )
    color = 'r';
  end
%
%  Issue a plot command.
%
  plot ( [0, 105]', [0, 11]', 'w' )
%
%  Add the boundary to the plot.
%
  hcell_boundary_add ( color )
%
%  Add the invisible bounding box.
%
  hcell_box_add ( 'w' )

  axis equal
  
  title ( 'H-Cell Flow Region' )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HCELL_BOUNDARY_DISPLAY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function hcell_box_add ( box_color )

%*****************************************************************************80
%
%% HCELL_BOX_ADD adds a box around the HCELL region.
%
%  Discussion:
%
%    This routine can only ADD graphics to an already existing plot.
%    So call PLOT first and then this routine.
%
%    The box is normally drawn with the color white ('w').
%    In this case, it doesn't actually appear on the screen.
%    However, it does force MATLAB to make the picture bigger,
%    giving us space to write some titles.
%
%  Usage:
%
%    hcell_box_add ( box_color )
%
%    A typical invocation might be
%
%      hcell_box_add ( 'w' )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character BOX_COLOR, the color to be used to draw the box.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HCELL_BOX_ADD:\n' );
  fprintf ( 1, '  Add a bounding box to a plot of the HCELL problem.\n' );
%
%  Do we have a color?
%
  if ( nargin < 1 )
    box_color = 'w'
  end
%
%  Set the coordinates of the invisible bounding box that
%  allows us to display the file name within the plot area.
%
  box_x = [ -5.00,  110.00, 110.00, -5.00, -5.00 ];
  box_y = [ -5.00,   -5.00, 21.00,  21.00, -5.00 ];

  line ( box_x, box_y, 'color', box_color )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HCELL_BOX_ADD:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
