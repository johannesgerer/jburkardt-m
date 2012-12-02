function root_num = p00_root_num ( prob )

%*****************************************************************************80
%
%% P00_ROOT_NUM returns the number of known roots for a problem.
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
%    Output, integer ROOT_NUM, the number of known roots.
%    This value may be zero.
%
  if ( prob == 1 )
    root_num = p01_root_num ( );
  elseif ( prob == 2 )
    root_num = p02_root_num ( );
  elseif ( prob == 3 )
    root_num = p03_root_num ( );
  elseif ( prob == 4 )
    root_num = p04_root_num ( );
  elseif ( prob == 5 )
    root_num = p05_root_num ( );
  elseif ( prob == 6 )
    root_num = p06_root_num ( );
  elseif ( prob == 7 )
    root_num = p07_root_num ( );
  elseif ( prob == 8 )
    root_num = p08_root_num ( );
  elseif ( prob == 9 )
    root_num = p09_root_num ( );
  elseif ( prob == 10 )
    root_num = p10_root_num ( );
  elseif ( prob == 11 )
    root_num = p11_root_num ( );
  elseif ( prob == 12 )
    root_num = p12_root_num ( );
  elseif ( prob == 13 )
    root_num = p13_root_num ( );
  elseif ( prob == 14 )
    root_num = p14_root_num ( );
  elseif ( prob == 15 )
    root_num = p15_root_num ( );
  elseif ( prob == 16 )
    root_num = p16_root_num ( );
  elseif ( prob == 17 )
    root_num = p17_root_num ( );
  elseif ( prob == 18 )
    root_num = p18_root_num ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_ROOT_NUM - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', prob );
    error ( 'P00_ROOT_NUM - Fatal error!' );
  end

  return
end
