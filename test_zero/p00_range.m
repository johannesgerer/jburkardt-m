function range = p00_range ( prob )

%*****************************************************************************80
%
%% P00_RANGE returns an interval bounding the root for any problem.
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
%    Output, real RANGE(2), the minimum and maximum values of
%    an interval containing the root.
%
  if ( prob == 1 )
    range = p01_range ( );
  elseif ( prob == 2 )
    range = p02_range ( );
  elseif ( prob == 3 )
    range = p03_range ( );
  elseif ( prob == 4 )
    range = p04_range ( );
  elseif ( prob == 5 )
    range = p05_range ( );
  elseif ( prob == 6 )
    range = p06_range ( );
  elseif ( prob == 7 )
    range = p07_range ( );
  elseif ( prob == 8 )
    range = p08_range ( );
  elseif ( prob == 9 )
    range = p09_range ( );
  elseif ( prob == 10 )
    range = p10_range ( );
  elseif ( prob == 11 )
    range = p11_range ( );
  elseif ( prob == 12 )
    range = p12_range ( );
  elseif ( prob == 13 )
    range = p13_range ( );
  elseif ( prob == 14 )
    range = p14_range ( );
  elseif ( prob == 15 )
    range = p15_range ( );
  elseif ( prob == 16 )
    range = p16_range ( );
  elseif ( prob == 17 )
    range = p17_range ( );
  elseif ( prob == 18 )
    range = p18_range ( );
  elseif ( prob == 19 )
    range = p19_range ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_RANGE - Fatal error%\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', prob );
    error ( 'P00_RANGE - Fatal error%' );
  end

  return
end
