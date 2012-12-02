function gt = g00_title ( gi )

%*****************************************************************************80
%
%% G00_TITLE returns the title for any grid.
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
%    Output, string GT, the grid title.
%
  if ( gi == 1 )
    gt = g01_title ( );
  elseif ( gi == 2 )
    gt = g02_title ( );
  elseif ( gi == 3 )
    gt = g03_title ( );
  elseif ( gi == 4 )
    gt = g04_title ( );
  elseif ( gi == 5 )
    gt = g05_title ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'G00_TITLE - Fatal error!\n' );
    fprintf ( 1, '  Illegal grid index GI = %d\n', gi );
    error ( 'G00_TITLE - Fatal error!' );
  end

  return
end
