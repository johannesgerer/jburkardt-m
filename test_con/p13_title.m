function title = p13_title ( option )

%*****************************************************************************80
%
%% P13_TITLE sets the title for problem 13.
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
    title = 'Simpson''s BVP, F(U) = EXP(U), M = 8.';
  elseif ( option == 2 )
    title = 'Simpson''s BVP, F(U) = function 2, M = 8.';
  elseif ( option == 3 )
    title = 'Simpson''s BVP, F(U) = EXP(U), M = 12.';
  elseif ( option == 4 )
    title = 'Simpson''s BVP, F(U) = function 2, M = 12.';
  elseif ( option == 5 )
    title = 'Simpson''s BVP, F(U) = EXP(U), M = 16.';
  elseif ( option == 6 )
    title = 'Simpson''s BVP, F(U) = function 2, M = 16.';
  end

  return
end
