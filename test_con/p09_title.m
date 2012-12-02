function title = p09_title ( option )

%*****************************************************************************80
%
%% P09_TITLE sets the title for problem 9.
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
    title = 'Oden problem, VAL=0.00, Target X(1)=4.0, Limits in X(1).';
  elseif ( option == 2 )
    title = 'Oden problem, VAL=0.25, Target X(1)=4.0, Limits in X(1).';
  elseif ( option == 3 )
    title = 'Oden problem, VAL=0.50, Target X(1)=4.0, Limits in X(1).';
  elseif ( option == 4 )
    title = 'Oden problem, VAL=1.00, Target X(1)=4.0, Limits in X(1).';
  elseif ( option == 5 )
    title = 'Oden problem, VAL=0.00, Target X(1)=4.0, Limits in X(2).';
  elseif ( option == 6 )
    title = 'Oden problem, VAL=0.25, Target X(1)=4.0, Limits in X(2).';
  elseif ( option == 7 )
    title = 'Oden problem, VAL=0.50, Target X(1)=4.0, Limits in X(2).';
  elseif ( option == 8 )
    title = 'Oden problem, VAL=1.00, Target X(1)=4.0, Limits in X(2).';
  elseif ( option == 9 )
    title = 'Oden problem, VAL=0.00, Target X(1)=4.0, Limits in X(3).';
  elseif ( option == 10 )
    title = 'Oden problem, VAL=0.25, Target X(1)=4.0, Limits in X(3).';
  elseif ( option == 11 )
    title = 'Oden problem, VAL=0.50, Target X(1)=4.0, Limits in X(3).';
  elseif ( option == 12 )
    title = 'Oden problem, VAL=1.00, Target X(1)=4.0, Limits in X(3).';
  elseif ( option == 13 )
    title = 'Oden problem, VAL=0.00, no targets, no limits.';
  end

  return
end
