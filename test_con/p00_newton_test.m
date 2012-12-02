function p00_newton_test ( problem_num )

%*****************************************************************************80
%
%% P00_NEWTON_TEST applies Newton's method to the perturbed starting point.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM_NUM, the number of problems.
%
  for problem = 1 : problem_num

    option_num = p00_option_num ( problem );

    fprintf ( 1, '\n' );

    for option = 1 : option_num

      seed = 123456789;

      fprintf ( 1, '\n' );
      fprintf ( 1, 'P00_NEWTON_TEST\n' );
      fprintf ( 1, '  Problem number = %d\n', problem );
      fprintf ( 1, '  Using option OPTION = %d\n', option );
%
%  Get the title.
%
      title = p00_title ( problem, option );

      fprintf ( 1, '  %s\n', title );
%
%  Get the number of variables.
%
      nvar = p00_nvar ( problem, option );

      fprintf ( 1, '  Number of variables is %d\n', nvar );
%
%  Get the starting point.
%
      x0 = p00_start ( problem, option, nvar );
%
%  Perturb the starting point.
%
      for i = 1 : nvar
        [ r, seed ] = r8_uniform_01 ( seed );
        dx = 0.10 * r * ( x0(i) + r8_sign ( x0(i) ) );
        x1(i) = x0(i) + dx;
      end
%
%  Choose a continuation parameter index.
%
      par_index = p00_par_index ( problem, option, nvar, x1 );

      fprintf ( 1, '  Fixing variable X(%d) = %f\n', par_index, x1(par_index) );
%
%  Apply Newton's method.
%
      [ x2, status ] = p00_newton ( problem, option, nvar, x1, par_index );

      if ( status == -3 )
        fprintf ( 1, '  The convergence test was not satisfied.\n' );
      elseif ( status == -2 )
        fprintf ( 1, '  The iteration seemed to be diverging, and was halted.\n' );
      elseif ( status == -1 )
        fprintf ( 1, '  The jacobian was singular, and the iteration was halted.\n' );
      else
        fprintf ( 1, '  Convergence was achieved in %d steps.\n', status );
      end

      if ( nvar <= 10 )

        fprintf ( 1, '\n' );
        fprintf ( 1, '        X0               X1=X0+dX          X2\n' );
        fprintf ( 1, '\n' );
        for i = 1 : nvar
          fprintf ( 1, '  %14f  %14f  %14f\n', x0(i), x1(i), x2(i) );
        end

      else

        fprintf ( 1, '\n' );
        fprintf ( 1, '      ||X0||           ||X1=X0+dX||        ||X2||\n' );
        fprintf ( 1, '\n' );
        fprintf ( 1, '  %14f  %14f  %14f\n', norm ( x0, 2 ), norm ( x1, 2 ), norm ( x2, 2 ) );

      end
%
%  Compute the initial function value.
%
      fx0 = p00_fun ( problem, option, nvar, x0 );
      fx1 = p00_fun ( problem, option, nvar, x1 );
      fx2 = p00_fun ( problem, option, nvar, x2 );

      if ( nvar <= 10 )

        fprintf ( 1, '\n' );
        fprintf ( 1, '       F(X0)           F(X1=X0+dX)        F(X2)\n' );
        fprintf ( 1, '\n' );
        for i = 1 : nvar - 1
          fprintf ( 1, '  %14f  %14f  %14f\n', fx0(i), fx1(i), fx2(i) );
        end

      else

        fprintf ( 1, '\n' );
        fprintf ( 1, '     ||F(X0)||       ||F(X1=X0+dX)||        ||F(X2)||\n' );
        fprintf ( 1, '\n' );
        fprintf ( 1, '  %14f  %14f  %14f\n', norm ( fx0, 2 ), norm ( fx1, 2 ), norm ( fx2, 2 ) );

      end

    end

  end

  return
end
