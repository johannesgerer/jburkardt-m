function p00_option_num_test ( problem_num )

%*****************************************************************************80
%
%% P00_OPTION_NUM_TEST lists the number of options.
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
  fprintf ( 1, 'P00_OPTION_NUM_TEST\n' );
  fprintf ( 1, '  List the number of options for each problem.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Problem   Options\n' );
  fprintf ( 1, '\n' );

  for problem = 1 : problem_num
    option_num = p00_option_num ( problem );
    fprintf ( 1, '  %8d  %8d\n', problem, option_num );
  end

  return
end
