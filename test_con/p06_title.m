function title = p06_title ( option )

%*****************************************************************************80
%
%% P06_TITLE sets the title for problem 6.
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
    title = 'Aircraft function, x(6) = - 0.050.';
  elseif ( option == 2 )
    title = 'Aircraft function, x(6) = - 0.008.';
  elseif ( option == 3 )
    title = 'Aircraft function, x(6) =   0.000.';
  elseif ( option == 4 )
    title = 'Aircraft function, x(6) = + 0.050.';
  elseif ( option == 5 )
    title = 'Aircraft function, x(6) = + 0.100.';
  end

  return
end
