function x = p00_root ( prob, i )

%*****************************************************************************80
%
%% P00_ROOT returns a known root for any problem.
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
%    Input, integer I, the index of the root to return.
%
%    Output, real X, the I-th root.
%
  if ( prob == 1 )
    x = p01_root ( i );
  elseif ( prob == 2 )
    x = p02_root ( i );
  elseif ( prob == 3 )
    x = p03_root ( i );
  elseif ( prob == 4 )
    x = p04_root ( i );
  elseif ( prob == 5 )
    x = p05_root ( i );
  elseif ( prob == 6 )
    x = p06_root ( i );
  elseif ( prob == 7 )
    x = p07_root ( i );
  elseif ( prob == 8 )
    x = p08_root ( i );
  elseif ( prob == 9 )
    x = p09_root ( i );
  elseif ( prob == 10 )
    x = p10_root ( i );
  elseif ( prob == 11 )
    x = p11_root ( i );
  elseif ( prob == 12 )
    x = p12_root ( i );
  elseif ( prob == 13 )
    x = p13_root ( i );
  elseif ( prob == 14 )
    x = p14_root ( i );
  elseif ( prob == 15 )
    x = p15_root ( i );
  elseif ( prob == 16 )
    x = p16_root ( i );
  elseif ( prob == 17 )
    x = p17_root ( i );
  elseif ( prob == 18 )
    x = p18_root ( i );
  elseif ( prob == 19 )
    x = p19_root ( i );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_ROOT - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', prob );
    error ( 'P00_ROOT - Fatal error!' );
  end

  return
end
