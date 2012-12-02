function p00_start_test ( problem_num )

%*****************************************************************************80
%
%% P00_START_TEST prints the norm of the starting point and its function value.
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
  fprintf ( 1, 'P00_START_TEST\n' );
  fprintf ( 1, '  Get norms of starting point X0 and F(X0)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Problem    Option        ||X0||          ||F(X0)||\n' );
  fprintf ( 1, '\n' );

  for problem = 1 : problem_num

    option_num = p00_option_num ( problem );

    fprintf ( 1, '\n' );

    for option = 1 : option_num

      nvar = p00_nvar ( problem, option );

      x0 = p00_start ( problem, option, nvar );

      x0_norm = norm ( x0(1:nvar) );

      fx0 = p00_fun ( problem, option, nvar, x0 );

      fx0_norm = norm ( fx0(1:nvar-1) );

      fprintf ( 1, '  %8d  %8d  %14f  %14f\n', ...
        problem, option, x0_norm, fx0_norm )

    end
  end

  return
end
