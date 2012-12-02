function p00_jac_test ( problem_num )

%*****************************************************************************80
%
%% P00_JAC_TEST compares the jacobian to a finite difference estimate.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM_NUM, the number of problems.
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'P00_JAC_TEST\n' );
  fprintf ( 1, '  Find the maximum relative difference between the\n' );
  fprintf ( 1, '  jacobian and a finite difference estimate.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Problem    Option      Diff               I         J\n' );

  for problem = 1 : problem_num

    option_num = p00_option_num ( problem );

    fprintf ( 1, '\n' );

    for option = 1 : option_num

      nvar = p00_nvar ( problem, option );

      x0 = p00_start ( problem, option, nvar );

      for i = 1 : nvar
        [ dx, seed ] = r8_uniform_01 ( seed );
        x0(i) = x0(i) + 0.01 * dx;
      end

      [ max_adif, max_adif_i, max_adif_j, max_rdif, max_rdif_i, max_rdif_j ] = ...
        p00_jac_check ( problem, option, nvar, x0 );

      fprintf ( 1, '  %8d  %8d  %14e  %8d  %8d\n', ...
        problem, option, max_rdif, max_rdif_i, max_rdif_j );

    end
  end

  return
end
