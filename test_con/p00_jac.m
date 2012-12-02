function jac = p00_jac ( problem, option, nvar, x )

%*****************************************************************************80
%
%% P00_JAC evaluates the jacobian for any problem.
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
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the argument of the jacobian.
%
%    Output, real JAC(NVAR-1,NVAR), the jacobian matrix evaluated
%    at X.  The NVAR-th row is not set by this routine.
%
  if ( problem == 1 )
    jac = p01_jac ( option, nvar, x );
  elseif ( problem == 2 )
    jac = p02_jac ( option, nvar, x );
  elseif ( problem == 3 )
    jac = p03_jac ( option, nvar, x );
  elseif ( problem == 4 )
    jac = p04_jac ( option, nvar, x );
  elseif ( problem == 5 )
    jac = p05_jac ( option, nvar, x );
  elseif ( problem == 6 )
    jac = p06_jac ( option, nvar, x );
  elseif ( problem == 7 )
    jac = p07_jac ( option, nvar, x );
  elseif ( problem == 8 )
    jac = p08_jac ( option, nvar, x );
  elseif ( problem == 9 )
    jac = p09_jac ( option, nvar, x );
  elseif ( problem == 10 )
    jac = p10_jac ( option, nvar, x );
  elseif ( problem == 11 )
    jac = p11_jac ( option, nvar, x );
  elseif ( problem == 12 )
    jac = p12_jac ( option, nvar, x );
  elseif ( problem == 13 )
    jac = p13_jac ( option, nvar, x );
  elseif ( problem == 14 )
    jac = p14_jac ( option, nvar, x );
  elseif ( problem == 15 )
    jac = p15_jac ( option, nvar, x );
  elseif ( problem == 16 )
    jac = p16_jac ( option, nvar, x );
  elseif ( problem == 17 )
    jac = p17_jac ( option, nvar, x );
  elseif ( problem == 18 )
    jac = p18_jac ( option, nvar, x );
  elseif ( problem == 19 )
    jac = p19_jac ( option, nvar, x );
  elseif ( problem == 20 )
    jac = p20_jac ( option, nvar, x );
  else
    jac = [];
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_JAC - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized problem number = %d\n', problem );
    error ( 'P00_JAC - Fatal error!' );
  end

  return
end
