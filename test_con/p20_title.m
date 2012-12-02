function title = p20_title ( option )

%*****************************************************************************80
%
%% P20_TITLE sets the title for problem 20.
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
%    Input, integer OPTION, the option index.
%
%    Output, string TITLE, the title of the problem.
%    TITLE will never be longer than 80 characters.
%
  if ( option == 1 )
    title = 'The Buckling Spring, F(L,Theta,Lambda,Mu).';
  else
    title = '???';
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P20_TITLE - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized option number.\n' );
    error ( 'P20_TITLE - Fatal error!' );
  end

  return
end
