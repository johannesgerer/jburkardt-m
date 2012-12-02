function [ gx, gy ] = g00_xy ( gi, gn )

%*****************************************************************************80
%
%% G00_XY returns the grid points for any grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer GI, the index of the grid.
%
%    Input, integer GN, the grid size.
%
%    Output, real GX(GN,1), GY(GN,1), the grid coordinates.
%
  if ( gi == 1 )
    [ gx, gy ] = g01_xy ( gn );
  elseif ( gi == 2 )
    [ gx, gy ] = g02_xy ( gn );
  elseif ( gi == 3 )
    [ gx, gy ] = g03_xy ( gn );
  elseif ( gi == 4 )
    [ gx, gy ] = g04_xy ( gn );
  elseif ( gi == 5 )
    [ gx, gy ] = g05_xy ( gn );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'G00_XY - Fatal error!\n' );
    fprintf ( 1, '  Illegal grid index GI = %d\n', gi );
    error ( 'G00_XY - Fatal error!' );
  end

  return
end
