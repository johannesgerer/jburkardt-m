function start_num = p00_start_num ( prob )

%*****************************************************************************80
%
%% P00_START_NUM returns the number of starting points for a problem.
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
%    Output, integer START_NUM, the number of starting points.
%
  if ( prob == 1 )
    start_num = p01_start_num ( );
  elseif ( prob == 2 )
    start_num = p02_start_num ( );
  elseif ( prob == 3 )
    start_num = p03_start_num ( );
  elseif ( prob == 4 )
    start_num = p04_start_num ( );
  elseif ( prob == 5 )
    start_num = p05_start_num ( );
  elseif ( prob == 6 )
    start_num = p06_start_num ( );
  elseif ( prob == 7 )
    start_num = p07_start_num ( );
  elseif ( prob == 8 )
    start_num = p08_start_num ( );
  elseif ( prob == 9 )
    start_num = p09_start_num ( );
  elseif ( prob == 10 )
    start_num = p10_start_num ( );
  elseif ( prob == 11 )
    start_num = p11_start_num ( );
  elseif ( prob == 12 )
    start_num = p12_start_num ( );
  elseif ( prob == 13 )
    start_num = p13_start_num ( );
  elseif ( prob == 14 )
    start_num = p14_start_num ( );
  elseif ( prob == 15 )
    start_num = p15_start_num ( );
  elseif ( prob == 16 )
    start_num = p16_start_num ( );
  elseif ( prob == 17 )
    start_num = p17_start_num ( );
  elseif ( prob == 18 )
    start_num = p18_start_num ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_START_NUM - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', prob );
    error ( 'P00_START_NUM - Fatal error!' );
  end

  return
end
