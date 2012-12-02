function p00_tan_test ( problem_num )

%*****************************************************************************80
%
%% P00_TAN_TEST computes and tests the tangent vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2008
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
  fprintf ( 1, 'P00_TAN_TEST\n' );
  fprintf ( 1, '  Compute the tangent vector TAN(X) at the starting point.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Verify that JAC(X) * TAN(X) = 0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Verify that det ( JAC ) > 0\n' );
  fprintf ( 1, '                  ( TAN )    \n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Problem    Option    ||Jac*Tan||     det(Jac|Tan)\n' );

  for problem = 1 : problem_num

    option_num = p00_option_num ( problem );

    fprintf ( 1, '\n' );

    for option = 1 : option_num

      nvar = p00_nvar ( problem, option );

      x0 = p00_start ( problem, option, nvar );

      jac = p00_jac ( problem, option, nvar, x0 );

      tan = p00_tan ( problem, option, nvar, x0 );

      jt = jac * tan;
      jtn = norm ( jt );
    
      jac(nvar,1:nvar) = tan(1:nvar);
      jtd = det ( jac );

      fprintf ( 1, '  %8d  %8d  %14e  %14e\n', problem, option, jtn, jtd );

    end
  end

  return
end
