function p00_stepsize_test ( problem_num )

%*****************************************************************************80
%
%% P00_STEPSIZE_TEST prints the stepsizes for each problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2008
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
  fprintf ( 1, 'P00_STEPSIZE_TEST\n' );
  fprintf ( 1, '  Print the stepsizes for each problem.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Problem    Option      H               HMIN             HMAX\n' );
  fprintf ( 1, '\n' );

  for problem = 1 : problem_num

    option_num = p00_option_num ( problem );
    fprintf ( 1, '\n' );

    for option = 1 : option_num

      [ h, hmin, hmax ] = p00_stepsize ( problem, option );

      fprintf ( 1, '  %8d  %8d  %14f  %14f  %14f\n', ...
        problem, option, h, hmin, hmax );

    end
  end

  return
end
