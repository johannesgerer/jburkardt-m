function x = p00_start ( prob, i )

%*****************************************************************************80
%
%% P00_START returns a starting point for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the number of the problem.
%
%    Input, integer I, the index of the starting point.
%
%    Output, real X, the starting point.
%
  if ( prob == 1 )
    x = p01_start ( i );
  elseif ( prob == 2 )
    x = p02_start ( i );
  elseif ( prob == 3 )
    x = p03_start ( i );
  elseif ( prob == 4 )
    x = p04_start ( i );
  elseif ( prob == 5 )
    x = p05_start ( i );
  elseif ( prob == 6 )
    x = p06_start ( i );
  elseif ( prob == 7 )
    x = p07_start ( i );
  elseif ( prob == 8 )
    x = p08_start ( i );
  elseif ( prob == 9 )
    x = p09_start ( i );
  elseif ( prob == 10 )
    x = p10_start ( i );
  elseif ( prob == 11 )
    x = p11_start ( i );
  elseif ( prob == 12 )
    x = p12_start ( i );
  elseif ( prob == 13 )
    x = p13_start ( i );
  elseif ( prob == 14 )
    x = p14_start ( i );
  elseif ( prob == 15 )
    x = p15_start ( i );
  elseif ( prob == 16 )
    x = p16_start ( i );
  elseif ( prob == 17 )
    x = p17_start ( i );
  elseif ( prob == 18 )
    x = p18_start ( i );
  elseif ( prob == 19 )
    x = p19_start ( i );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_START - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', prob );
    error ( 'P00_START - Fatal error!' );
  end

  return
end
