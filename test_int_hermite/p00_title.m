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
%    31 July 2010
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
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_TITLE - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_TITLE - Fatal error!' );
  end

  return
end
