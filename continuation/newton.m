function [ status, x ] = newton ( n, x0, p, f, fp, tol )

%*****************************************************************************80
%
%% NEWTON carries out the Newton iteration for the continuation system.
%
%  Discussion:
%
%    We assume that X0 is a point on the curve of solutions.
%
%    Given a starting point X, this function applies Newton's method 
%    to the system of N equations:
%
%      G(X) = ( F(X)         )    <-- N-1 equations in N unknowns
%             ( X(P) - X0(P) )    <-- Hold component P fixed.
%
%    whose NxN Jacobian matrix is
%
%      GP(X) = ( FP(X)      )     <-- N-1 by N matrix.
%              ( Delta(P,J) )     <--   1 by N matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2014
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
%    Input, real X0(n), a starting point.
%
%    Input, integer P, the index of the current continuation parameter.
%
%    Input, function fx = F ( n, x ), a pointer to the
%    function that evaluates the N-1 nonlinear equations.
%
%    Input, function fpx = FP ( n, x ), a pointer to the
%    function that evaluates the N-1 by N Jacobian matrix
%    associated with the nonlinear equations.
%
%    Input, real TOL, an error tolerance.
%
%    Output, integer STATUS, the return flag.
%    0, no errors, the iteration converged.
%    1, the iteration did not converge in IT_MAX steps.
%
%    Output, real X(n), the estimated solution.
%
  verbose = 0;

  alpha = x0(p);
  x = x0;

  it = 0;
  it_max = 10;

  while ( 1 )

    if ( it_max < it )
      status = 1;
      return;
    end

    fx = f ( n, x );
    fx(n,1) = x(p) - alpha;

    fx_norm = max ( abs ( fx ) );

    if ( verbose )
      fprintf ( 1, '  %d  %g\n', it, fx_norm );
    end

    if ( fx_norm <= tol )
      status = 0;
      return;
    end

    it = it + 1;

    fpx = fp ( n, x );
    fpx(n,1:n) = 0.0;
    fpx(n,p) = 1.0;

    dx = - fpx \ fx;
    x0 = x;
    x = x0 + dx;

  end

  return
end
