function title = p02_title ( option )

%*****************************************************************************80
%
%% P02_TITLE sets the title for problem 2.
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
    title = 'Boggs function, (1,0,0).';
  elseif ( option == 2 ) 
    title = 'Boggs function, (1,-1,0).';
  elseif ( option == 3 )
    title = 'Boggs function, (10,10,0).';
  end

  return
end
