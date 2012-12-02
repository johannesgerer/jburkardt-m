function option_num = p00_option_num ( problem )

%*****************************************************************************80
%
%% P00_OPTION_NUM returns the number of options available for a problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Output, integer OPTION_NUM, the number of options available for
%    this problem.  OPTION_NUM is always at least 1.
%
  if (  problem == 1 )
    option_num = p01_option_num ( );
  elseif ( problem == 2 )
    option_num = p02_option_num ( );
  elseif ( problem == 3 )
    option_num = p03_option_num ( );
  elseif ( problem == 4 )
    option_num = p04_option_num ( );
  elseif ( problem == 5 )
    option_num = p05_option_num ( );
  elseif ( problem == 6 )
    option_num = p06_option_num ( );
  elseif ( problem == 7 )
    option_num = p07_option_num ( );
  elseif ( problem == 8 )
    option_num = p08_option_num ( );
  elseif ( problem == 9 )
    option_num = p09_option_num ( );
  elseif ( problem == 10 )
    option_num = p10_option_num ( );
  elseif ( problem == 11 )
    option_num = p11_option_num ( );
  elseif ( problem == 12 )
    option_num = p12_option_num ( );
  elseif ( problem == 13 )
    option_num = p13_option_num ( );
  elseif ( problem == 14 )
    option_num = p14_option_num ( );
  elseif ( problem == 15 )
    option_num = p15_option_num ( );
  elseif ( problem == 16 )
    option_num = p16_option_num ( );
  elseif ( problem == 17 )
    option_num = p17_option_num ( );
  elseif ( problem == 18 )
    option_num = p18_option_num ( );
  elseif ( problem == 19 )
    option_num = p19_option_num ( );
  elseif ( problem == 20 )
    option_num = p20_option_num ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_OPTION_NUM - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized problem index = %d\n', problem );
    error ( 'P00_OPTION_NUM - Fatal error!' );
  end

  return
end
