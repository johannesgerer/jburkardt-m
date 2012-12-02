function title = p00_title ( problem )

%*****************************************************************************80
%
%% P00_TITLE returns the title for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the index of the problem.
%
%    Output, string TITLE, the title of the problem.
%
  if ( problem == 1 )
    title = p01_title ( );
  elseif ( problem == 2 )
    title = p02_title ( );
  elseif ( problem == 3 )
    title = p03_title ( );
  elseif ( problem == 4 )
    title = p04_title ( );
  elseif ( problem == 5 )
    title = p05_title ( );
  elseif ( problem == 6 )
    title = p06_title ( );
  elseif ( problem == 7 )
    title = p07_title ( );
  elseif ( problem == 8 )
    title = p08_title ( );
  elseif ( problem == 9 )
    title = p09_title ( );
  elseif ( problem == 10 )
    title = p10_title ( );
  elseif ( problem == 11 )
    title = p11_title ( );
  elseif ( problem == 12 )
    title = p12_title ( );
  elseif ( problem == 13 )
    title = p13_title ( );
  elseif ( problem == 14 )
    title = p14_title ( );
  elseif ( problem == 15 )
    title = p15_title ( );
  elseif ( problem == 16 )
    title = p16_title ( );
  elseif ( problem == 17 )
    title = p17_title ( );
  elseif ( problem == 18 )
    title = p18_title ( );
  elseif ( problem == 19 )
    title = p19_title ( );
  elseif ( problem == 20 )
    title = p20_title ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_TITLE - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_TITLE - Fatal error!' );
  end

  return
end
