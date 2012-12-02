function p00_story ( prob )

%*****************************************************************************80
%
%% P00_STORY prints the "story" for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    None
%
  if ( prob == 1 )
    p01_story ( );
  elseif ( prob == 2 )
    p02_story ( );
  elseif ( prob == 3 )
    p03_story ( );
  elseif ( prob == 4 )
    p04_story ( );
  elseif ( prob == 5 )
    p05_story ( );
  elseif ( prob == 6 )
    p06_story ( );
  elseif ( prob == 7 )
    p07_story ( );
  elseif ( prob == 8 )
    p08_story ( );
  elseif ( prob == 9 )
    p09_story ( );
  elseif ( prob == 10 )
    p10_story ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_STORY - Fatal error!\n' );
    fprintf ( 1, '  Unexpected input value of PROB.\n' );
    error ( 'P00_STORY - Fatal error!' );
  end

  return
end
