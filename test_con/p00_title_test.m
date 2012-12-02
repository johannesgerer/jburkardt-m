function p00_title_test ( problem_num )

%*****************************************************************************80
%
%% P00_TITLE_TEST prints the problem titles.
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
%    Input, integer PROBLEM_NUM, the number of problems.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'P00_TITLE_TEST\n' );
  fprintf ( 1, '  List the problem titles\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Problem   Options  Title\n' );
  fprintf ( 1, '\n' );

  for problem = 1 : problem_num
    option_num = p00_option_num ( problem );
    fprintf ( 1, '\n' );
    for option = 1 : option_num
      title = p00_title ( problem, option );
      fprintf ( 1, '  %8d  %8d  %s\n', problem, option, title );
    end
  end

  return
end
