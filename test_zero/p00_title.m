function title = p00_title ( prob )

%*****************************************************************************80
%
%% P00_TITLE returns the title for a given problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the number of the problem.
%
%    Output, string TITLE, the title of the given problem.
%
  if ( prob == 1 )
    title = p01_title ( );
  elseif ( prob == 2 )
    title = p02_title ( );
  elseif ( prob == 3 )
    title = p03_title ( );
  elseif ( prob == 4 )
    title = p04_title ( );
  elseif ( prob == 5 )
    title = p05_title ( );
  elseif ( prob == 6 )
    title = p06_title ( );
  elseif ( prob == 7 )
    title = p07_title ( );
  elseif ( prob == 8 )
    title = p08_title ( );
  elseif ( prob == 9 )
    title = p09_title ( );
  elseif ( prob == 10 )
    title = p10_title ( );
  elseif ( prob == 11 )
    title = p11_title ( );
  elseif ( prob == 12 )
    title = p12_title ( );
  elseif ( prob == 13 )
    title = p13_title ( );
  elseif ( prob == 14 )
    title = p14_title ( );
  elseif ( prob == 15 )
    title = p15_title ( );
  elseif ( prob == 16 )
    title = p16_title ( );
  elseif ( prob == 17 )
    title = p17_title ( );
  elseif ( prob == 18 )
    title = p18_title ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_TITLE - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', prob );
    error ( 'P00_TITLE - Fatal error!' );
  end

  return
end
