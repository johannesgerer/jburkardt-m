function title = p01_title ( option )

%*****************************************************************************80
%
%% P01_TITLE sets the title for problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Output, string TITLE, the title of the problem.
%
  if ( option == 1 )
    title = 'Freudenstein-Roth function, (15,-2,0).';
  elseif ( option == 2 )
    title = 'Freudenstein-Roth function, (15,-2,0), x1 limits.';
  elseif ( option == 3 )
    title = 'Freudenstein-Roth function, (15,-2,0), x3 limits.';
  elseif ( option == 4 )
    title = 'Freudenstein-Roth function, (4,3,0).';
  elseif ( option == 5 )
    title = 'Freudenstein-Roth function, (4,3,0), x1 limits.';
  elseif ( option == 6 )
    title = 'Freudenstein-Roth function, (4,3,0), x3 limits.';
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P01_TITLE - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized option number.\n' );
    error ( 'P01_TITLE - Fatal error!' );
  end

  return
end
