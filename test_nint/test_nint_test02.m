function test_nint_test02 ( )

%*****************************************************************************80
%
%% TEST02 retrieves and prints the problem names.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2007
%
%  Author:
%
%    John Burkardt
%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  GET_PROBLEM_NUM returns the number of problems.\n' );
  fprintf ( 1, '  P00_TITLE(#) prints the title for problem #.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use these two routines to print a directory\n' );
  fprintf ( 1, '  of all the problems.\n' );

  problem_num = get_problem_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of problems available is %d\n', problem_num );
  fprintf ( 1, '\n' );

  for problem = 1 : problem_num

    p00_title ( problem );

  end

  return
end
