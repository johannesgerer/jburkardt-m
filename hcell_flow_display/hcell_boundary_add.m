function hcell_boundary_add ( color )

%*****************************************************************************80
%
%% HCELL_BOUNDARY_ADD adds the boundary of the H-Cell to a plot
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
%    18 May 2004
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
  fprintf ( 1, 'HCELL_BOUNDARY_ADD:\n' );
  fprintf ( 1, '  Add the boundary of the HCELL to a plot.\n' );
%
%  Set the coordinates of the boundary.
%
% bx1 = [ 35.00,   45.00,   45.00,  35.00,  35.00 ];
  bx1 = [ 35.00,   50.00,   50.00,  35.00,  35.00 ];
  by1 = [ 11.00,   11.00,   11.25,  11.25,  11.00 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 23.00,   34.00,   34.00,  23.00,  23.00 ];
  by1 = [ 11.00,   11.00,   11.25,  11.25,  11.00 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 11.00,   22.00,   22.00,  11.00,  11.00 ];
  by1 = [ 11.00,   11.00,   11.25,  11.25,  11.00 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ -0.25,    0.00,    0.00,  10.00,  10.00, -0.25, -0.25 ];
  by1 = [  9.00,    9.00,   11.00,  11.00,  11.25, 11.25,  9.00 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ -0.25,   10.00,   10.00,   0.00,   0.00, -0.25, -0.25 ];
  by1 = [  5.75,    5.75,    6.00,   6.00,   8.00,  8.00,  5.75 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 11.00,   22.00,   22.00,  11.00,  11.00 ];
  by1 = [  5.75,    5.75,    6.00,   6.00,   5.75 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 23.00,   34.00,   34.00,  23.00,  23.00 ];
  by1 = [  5.75,    5.75,    6.00,   6.00,   5.75 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 35.00,   44.75,   44.75,  35.00,  35.00, 45.00, 45.00, 35.00, 35.00 ];
  by1 = [  5.75,    5.75,    5.25,   5.25,   5.00,  5.00,  6.00,  6.00,  5.75 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 23.00,   34.00,   34.00,  23.00,  23.00 ];
  by1 = [  5.00,    5.00,    5.25,   5.25,   5.00 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 11.00,   22.00,   22.00,  11.00,  11.00 ];
  by1 = [  5.00,    5.00,    5.25,   5.25,   5.00 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ -0.25,    0.00,    0.00,  10.00,  10.00, -0.25, -0.25 ];
  by1 = [  3.00,    3.00,    5.00,   5.00,   5.25,  5.25,  3.00 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 105.25, 105.25, 105.00, 105.00,  0.00,  0.00, -0.25, -0.25, 105.25 ];
  by1 = [  -0.25,   2.00,   2.00,   0.00,  0.00,  2.00,  2.00, -0.25,  -0.25 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 105.00, 105.25, 105.25,  95.00,  95.00, 105.00, 105.00 ];
  by1 = [   3.00,   3.00,   5.25,   5.25,    5.00,  5.00,   3.00 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 83.00,  94.00, 94.00, 83.00, 83.00 ];
  by1 = [  5.00,   5.00,  5.25,  5.25,  5.00 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 71.00,  82.00, 82.00, 71.00, 71.00 ];
  by1 = [  5.00,   5.00,  5.25,  5.25,  5.00 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 60.00,  70.00, 70.00, 60.25, 60.25, 70.00, 70.00, 60.00, 60.00 ];
  by1 = [  5.00,   5.00,  5.25,  5.25,  5.75,  5.75,  6.00,  6.00,  5.00 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 71.00,  82.00, 82.00, 71.00, 71.00 ];
  by1 = [  5.75,   5.75,  6.00,  6.00,  5.75 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 83.00,  94.00, 94.00, 83.00, 83.00 ];
  by1 = [  5.75,   5.75,  6.00,  6.00,  5.75 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 95.00, 105.25, 105.25, 105.00, 105.00, 95.00, 95.00 ];
  by1 = [  5.75,   5.75,   8.00,   8.00,   6.00,  6.00,  5.75 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 105.00, 105.25, 105.25,  95.00,  95.00, 105.00, 105.00 ];
  by1 = [   9.00,   9.00,  11.25,  11.25,  11.00,  11.00 ,  9.00 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 83.00,  94.00, 94.00, 83.00, 83.00 ];
  by1 = [ 11.00,  11.00, 11.25, 11.25, 11.00 ];
  line ( bx1, by1, 'color', color )

  bx1 = [ 71.00,  82.00, 82.00, 71.00, 71.00 ];
  by1 = [ 11.00,  11.00, 11.25, 11.25, 11.00 ];
  line ( bx1, by1, 'color', color )

% bx1 = [ 60.00,  70.00, 70.00, 60.00, 60.00 ];
  bx1 = [ 55.00,  70.00, 70.00, 55.00, 55.00 ];
  by1 = [ 11.00,  11.00, 11.25, 11.25, 11.00 ];
  line ( bx1, by1, 'color', color )


  fprintf ( 1, '\n' );
  fprintf ( 1, 'HCELL_BOUNDARY_ADD:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
