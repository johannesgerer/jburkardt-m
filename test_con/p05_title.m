function title = p05_title ( option )

%*****************************************************************************80
%
%% P05_TITLE sets the title for problem 5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
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
    title = 'Wacker function, A = 0.1.';
  elseif ( option == 2 )
    title = 'Wacker function, A = 0.5.';
  elseif ( option == 3 )
    title = 'Wacker function, A = 1.0.';
  end

  return
end
