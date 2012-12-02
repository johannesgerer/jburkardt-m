function title = p17_title ( option )

%*****************************************************************************80
%
%% P17_TITLE sets the title for problem 17.
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
    title = 'Bremermann Propane Combustion System, fixed pressure.';
  else
    title = 'Bremermann Propane Combustion System, fixed concentration.';
  end

  return
end
