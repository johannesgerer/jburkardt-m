function gn = g00_size ( gi )

%*****************************************************************************80
%
%% G00_SIZE returns the size for any grid.
%
%  Discussion:
%
%    The "grid size" is simply the number of points in the grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer GI, the index of the grid.
%
%    Output, integer GN, the grid size.
%
  if ( gi == 1 )
    gn = g01_size ( );
  elseif ( gi == 2 )
    gn = g02_size ( );
  elseif ( gi == 3 )
    gn = g03_size ( );
  elseif ( gi == 4 )
    gn = g04_size ( );
  elseif ( gi == 5 )
    gn = g05_size ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'G00_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Illegal grid index GI = %d\n', gi );
    error ( 'G00_SIZE - Fatal error!' );
  end

  return
end
