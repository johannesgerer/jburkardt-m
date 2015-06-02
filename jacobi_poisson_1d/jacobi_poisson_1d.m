function jacobi_poisson_1d ( k )

%*****************************************************************************80
%
%% JACOBI_POISSON_1D uses Jacobi iteration for the 1D Poisson equation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Commandline input, integer K, the grid index.
%    K specifies the number of nodes, by the formula NK = 2^K + 1.
%    K must be at least 0.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_POISSON_1D:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Use Jacobi iteration for the 1D Poisson equation.\n' );

  if ( nargin < 1 )
    k = input ( '  Enter K >= 0, the grid index, so that NK = 2^K + 1:  ' );
  elseif ( ischar ( k ) )
    k = str2num ( k );
  end
%
%  Set boundaries.
%
  a = 0.0;
  b = 1.0;
%
%  Set boundary conditions.
%
  ua = 0.0;
  ub = 0.0;
%
%  Get NK.
%
  nk = 2^k + 1;
%
%  Set XK.
%
  xk = ( linspace ( a, b, nk ) )';
%
%  Get HK.
%
  hk = ( b - a ) / ( nk - 1 );
%
%  Set FK.
%
  fk = force ( xk );
  fk(1) = ua;
  fk(nk) = ub;
%
%  Set the -1/2/-1 entries of Ak.
%
%  In order that the operator Ak approximation the Poisson operator,
%  and in order that we can compare linear systems for successive grids,
%  we should NOT multiply through by hk^2.
%
  Uk = sparse ( 2:nk-1, 3:nk,   -1.0, nk, nk ) / hk^2;
  Dk = sparse ( 2:nk-1, 2:nk-1,  2.0, nk, nk ) / hk^2;
  Dk(1,1) = 1.0;
  Dk(nk,nk) = 1.0;
  Lk = sparse ( 2:nk-1, 1:nk-2, -1.0, nk, nk ) / hk^2;
  Ak = Uk + Dk + Lk;
%
%  Just because we can, ask MATLAB to get the exact solution of the linear system
%  directly.
%
  udk = Ak \ fk;
%
%  Sample the solution to the continuous problem.
%
  uek = exact ( xk );
%
%  Use Jacobi iteration to solve the linear system to the given tolerance.
%
  ujk = zeros ( nk, 1 );
  it_max = 10000000;
  res_max = 0.000001;

  [ ujk, it_num, res_norm ] = jacobi ( nk, Ak, fk, ujk, it_max, res_max );
%
%  Examine errors:
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using grid index K = %d\n', k );
  fprintf ( 1, '  System size NK was %d\n', nk );
  fprintf ( 1, '  Tolerance for linear residual %g\n', res_max );
  fprintf ( 1, '  RMS of linear residual %g\n', res_norm );
  fprintf ( 1, '  Number of Jacobi iterations taken was %d\n', it_num );
  fprintf ( 1, '  RMS Jacobi error in solution of linear system = %g\n', ...
    norm ( udk - ujk ) / sqrt ( nk ) );
  fprintf ( 1, '  RMS discretization error in Poisson solution = %g\n', ...
    norm ( uek - ujk ) / sqrt ( nk ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I        X        U_Exact    U_Direct    U_Jacobi\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nk
    fprintf ( 1, '  %4d  %10.4f  %10.4g  %10.4g  %10.4g\n', ...
      i, xk(i), uek(i), udk(i), ujk(i) );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_POISSON_1D:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function uex = exact ( x )

%*****************************************************************************80
%
%% UEX evaluates the solution of the continuous problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(*), the evaluation points.
%
%    Output, real UEX(*), the solution of the continuous problem 
%    at the evaluation points.
%
  uex = x .* ( x - 1 ) .* exp ( x );

  return
end
function f = force ( x )

%*****************************************************************************80
%
%% FORCE evaluates the forcing term.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(*), the evaluation points.
%
%    Output, real F(*), the forcing term at the evaluation points.
%
  f = - x .* ( x + 3 ) .* exp ( x );

  return
end
function [ u, it_num, res_norm ] = jacobi ( n, A, f, u, it_max, res_max )

%*****************************************************************************80
%
%% JACOBI carries out the Jacobi iteration.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(N,N), the matrix.
%
%    Input, real F(N), the right hand side.
%
%    Input, real U(N), the estimated solution.
%
%    Input, integer IT_MAX, the maximum number of iterations.
%
%    Input, real RES_MAX, a convergence tolerance on the residual.
%
%    Output, real U(N), the improved estimate of the solution.
%
%    Output, integer IT_NUM, the number of iterations taken.
%
%    Output, real RES_NORM, the RMS norm of the residual.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Step    Residual      Change\n' );
  fprintf ( 1, '\n' );

  it_num = it_max;

  for it = 1 : it_max

    u_old = u;
    u = ( f - A * u_old + ( diag ( A ) .* u_old ) ) ./ diag ( A );
    r = A * u - f;
    res_norm = norm ( r ) / sqrt ( n );

    fprintf ( 1, '  %6d  %10.4g  %10.4g\n', ...
      it, res_norm, norm ( u - u_old ) / sqrt ( n ) );

    if ( res_norm <= res_max )
      it_num = it;
      break;
    end

  end

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
