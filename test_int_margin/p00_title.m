function title = p00_title ( problem )

%*****************************************************************************80
%
%% P00_TITLE returns a title for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the number of the problem.
%
%    Output, string TITLE, a title for the problem.
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
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_TITLE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROBLEM = %d', problem );
    error ( 'P00_TITLE - Fatal error!' );
  end

  return
end
