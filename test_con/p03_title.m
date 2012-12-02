function title = p03_title ( option )

%*****************************************************************************80
%
%% P03_TITLE sets the title for problem 3.
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
    title = 'Powell function, (3,6,0).';
  elseif ( option == 2 )
    title = 'Powell function, (4,5,0).';
  elseif ( option == 3 )
    title = 'Powell function, (6,3,0).';
  elseif ( option == 4 )
    title = 'Powell function, (1,1,0).';
  end

  return
end
