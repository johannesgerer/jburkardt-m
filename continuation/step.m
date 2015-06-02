function [ status, x2, t2, p2 ] = step ( n, x0, t0, p0, f, fp, h, tol )

%*****************************************************************************80
%
%% STEP attempts a continuation step.
%
%  Discussion:
%
%    Given a point X0 on the curve of solutions, a stepsize H, and a 
%    parameter index P0, this function generates the tangent vector T,
%    and then a starting point X for the Newton iteration:
%
%      X1 = X0 + H * T
%
%    applying Newton's method to the augmented system of N equations:
%
%      G(X) = ( F(X)         )    <-- N-1 equations in N unknowns
%             ( X(P) - X1(P0) )   <-- Hold component P0 fixed.
%
%    whose augmented NxN Jacobian matrix:
%
%      GP(X) = ( FP(X)      )     <-- N-1 by N matrix.
%              ( Delta(P0,J) )    <--   1 by N matrix.
%
%    returning the new solution point X2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of unknowns.
%    (This should always be 2 for this program!)
%
%    Input, real X0(N), the current point.
%    It is assumed that F(X0) is small.
%
%    Input, real T0(N), the previous tangent vector.
%    If not available, a zero vector will do.
%
%    Input, integer P0, the index of the current continuation parameter.
%
%    Input, function fx = F ( n, x ), a pointer to the
%    function that evaluates the N-1 nonlinear equations.
%
%    Input, function fpx = FP ( n, x ), a pointer to the
%    function that evaluates the N-1 by N Jacobian matrix
%    associated with the nonlinear equations.
%
%    Input, real H, the stepsize to try.
%
%    Input, real TOL, an error tolerance.
%
%    Output, integer STATUS, the return flag.
%    0, no errors, the iteration converged.
%    1, the iteration did not converge in IT_MAX steps.
%
%    Output, real X2(N), the solution.
%
%    Output, real T2(N), the current tangent vector.
%
%    Output, integer P2, suggested index of next continuation parameter.
%
  verbose = 0;

  [ t2, p2 ] = tangent ( n, x0, t0, p0, fp );
  
  x1 = x0 + h * t2;

  if ( verbose )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Will hold X(%d) fixed at %g\n', p0, x1(p0) );
    r8vec_print ( n, x1, '  STEP: Initial point X1:' );
  end

  [ status, x2 ] = newton ( n, x1, p0, f, fp, tol );

  return
end
