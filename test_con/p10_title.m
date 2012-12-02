function title = p10_title ( option )

%*****************************************************************************80
%
%% P10_TITLE sets the title for problem 10.
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
    title = 'Torsion of a square rod, finite difference, PHI(S)=EXP(5*S).';
  elseif ( option == 2 )
    title = 'Torsion of a square rod, finite difference, PHI(S)=two levels.';
  end

  return
end
