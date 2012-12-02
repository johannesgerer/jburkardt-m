function title = p12_title ( option )

%*****************************************************************************80
%
%% P12_TITLE sets the title for problem 12.
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
    title = 'Materially nonlinear problem, NPOLYS = 2, NDERIV = 1.';
  elseif ( option == 2 )
    title = 'Materially nonlinear problem, NPOLYS = 4, NDERIV = 1.';
  elseif ( option == 3 ) 
    title = 'Materially nonlinear problem, NPOLYS = 4, NDERIV = 2.';
  elseif ( option == 4 )
    title = 'Materially nonlinear problem, NPOLYS = 6, NDERIV = 1.';
  elseif ( option == 5 )
    title = 'Materially nonlinear problem, NPOLYS = 6, NDERIV = 2.';
  elseif ( option == 6 )
    title = 'Materially nonlinear problem, NPOLYS = 6, NDERIV = 3.';
  end

  return
end
