function p00_nvar_test ( problem_num )

%*****************************************************************************80
%
%% P00_NVAR_TEST prints the problem size.
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
  fprintf ( 1, 'P00_NVAR_TEST\n' );
  fprintf ( 1, '  List the problem size.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Problem    Option      Size\n' );
  fprintf ( 1, '\n' );

  for problem = 1 : problem_num
    option_num = p00_option_num ( problem );
    fprintf ( 1, '\n' );
    for option = 1 : option_num
      nvar = p00_nvar ( problem, option );
      fprintf ( 1, '  %8d  %8d  %8d\n', problem, option, nvar );
    end
  end

  return
end
