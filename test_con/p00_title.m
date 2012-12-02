function title = p00_title ( problem, option )

%*****************************************************************************80
%
%% P00_TITLE sets the title for any problem.
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
%    Input, integer OPTION, the option index.
%
%    Output, string TITLE, the title of the problem.
%    TITLE will never be longer than 80 characters.
%
  if (  problem == 1 )
    title = p01_title ( option );
  elseif ( problem == 2 )
    title = p02_title ( option );
  elseif ( problem == 3 )
    title = p03_title ( option );
  elseif ( problem == 4 )
    title = p04_title ( option );
  elseif ( problem == 5 )
    title = p05_title ( option );
  elseif ( problem == 6 )
    title = p06_title ( option );
  elseif ( problem == 7 )
    title = p07_title ( option );
  elseif ( problem == 8 )
    title = p08_title ( option );
  elseif ( problem == 9 )
    title = p09_title ( option );
  elseif ( problem == 10 )
    title = p10_title ( option );
  elseif ( problem == 11 )
    title = p11_title ( option );
  elseif ( problem == 12 )
    title = p12_title ( option );
  elseif ( problem == 13 )
    title = p13_title ( option );
  elseif ( problem == 14 )
    title = p14_title ( option );
  elseif ( problem == 15 )
    title = p15_title ( option );
  elseif ( problem == 16 )
    title = p16_title ( option );
  elseif ( problem == 17 )
    title = p17_title ( option );
  elseif ( problem == 18 )
    title = p18_title ( option );
  elseif ( problem == 19 )
    title = p19_title ( option );
  elseif ( problem == 20 )
    title = p20_title ( option );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_TITLE - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized problem number = %d\n', problem );
    error ( 'P00_TITLE - Fatal error!' );
  end

  return
end
