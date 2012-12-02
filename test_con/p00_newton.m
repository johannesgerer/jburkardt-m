function [ x, status ] = p00_newton ( problem, option, nvar, x, par_index )

%*****************************************************************************80
%
%% P00_NEWTON applies Newton's method to an approximate root.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the starting point of Newton's method.
%
%    Input, integer PAR_INDEX, the index of the parameter to be held fixed.
%    This variable should be between 1 and NVAR.  However, the user can
%    set it to 0, indicating that the program should make an intelligent
%    choice for the index.
%
%    Output, real X(NVAR), an improved estimate of the root of F(X)=0.
%
%    Output, integer STATUS, the status of the iteration.
%    -3, the full number of steps was taken without convergence.
%        (however, the output X might be CLOSE to a good solution).
%    -2, the iteration seemed to be diverging, and was halted.
%    -1, the jacobian was singular, and the iteration was halted.
%     nonnegative, the convergence test was satisfied, and this is the
%        number of steps taken (possibly 0).
%
  COND_MAX = 1.0E+10;
  FX_ABS_TOL = 0.000001;
  IT_MAX = 20;
  VERBOSE = 0;

  x = x(:);

  if ( par_index < 1 | nvar < par_index )
    par_index = p00_par_index ( problem, option, nvar, x );
    if ( VERBOSE )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Iteration will hold index %d fixed.\n', par_index );
    end
  end
  par_value = x(par_index);

  if ( VERBOSE )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_NEWTON\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '      Step    ||F(X)||\n' );
    fprintf ( 1, '\n' );
  end

  for it = 0 : IT_MAX
%
%  Compute the function value.
%
    fx = p00_fun ( problem, option, nvar, x );
    fx(nvar) = x(par_index) - par_value;
%
%  Compute the norm of the function value.
%
    fx_max = max ( abs ( fx(1:nvar) ) );

    if ( VERBOSE )
      fprintf ( 1, '  %8d  %14e\n', it, fx_max );
    end

    if ( it == 0 )
      fx_max_init = fx_max;
    end
%
%  If the function norm is small enough, return.
%
    if ( abs ( fx_max ) < FX_ABS_TOL )
      status = it;
      break
    end
%
%  If the function norm seems to be exploding, halt.
%
    if ( 1000.0 * fx_max_init < abs ( fx_max ) )
      status = -2;
      break
    end

    if ( it == IT_MAX )
      status = -3;
      break
    end
%
%  Compute the jacobian.
%
    jac = p00_jac ( problem, option, nvar, x );

    jac(nvar,1:nvar) = 0.0;
    jac(nvar,par_index) = 1.0;
%
%  Solve the system JAC * DX = - FX
%
    if ( cond ( jac ) < COND_MAX )
      dx = - jac \ fx;
    else
      if ( VERBOSE )
        fprintf ( 1, '  (Using pseudoinverse.)\n' );
      end
      dx = - pinv ( jac ) * fx;
    end
%
%  Update X = X - DX.
%
    x(1:nvar) = x(1:nvar) + dx(1:nvar);

  end

  return
end
