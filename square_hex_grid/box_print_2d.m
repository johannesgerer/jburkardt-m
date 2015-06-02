function box_print_2d ( box )

%*****************************************************************************80
%
%% BOX_PRINT_2D prints information about a coordinate box in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real BOX(2,2), the coordinates of the lower left
%    and upper right corners of the box.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Coordinate box:\n' );
  fprintf ( 1, '  %8f <= X <= %8f\n', box(1,1:2) );
  fprintf ( 1, '  %8f <= Y <= %8f\n', box(2,1:2) );

  return
end
