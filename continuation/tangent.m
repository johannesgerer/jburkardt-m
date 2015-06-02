function [ t2, p2 ] = tangent ( n, x, t1, p, fp )

%*****************************************************************************80
%
%% TANGENT computes the tangent vector for the continuation system.
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
%    Input, real X(n), a starting point.
%
%    Input, real T1(n), the previous tangent.  If not available,
%    a zero vector will do.
%
%    Input, integer P, the index of the current continuation parameter.
%
%    Input, function fpx = FP ( n, x ), a pointer to the
%    function that evaluates the N-1 by N Jacobian matrix
%    associated with the nonlinear equations.
%
%    Output, real T2(n), the tangent vector.
%
%    Output, integer P2, index of the next continuation parameter.
%
  fpx = fp ( n, x );
  fpx(n,1:n) = 0.0;
  fpx(n,p) = 1.0;

  b = zeros ( n, 1 );
  b(n) = 1.0;
  t2 = fpx \ b;

  t2_norm = norm ( t2 );
  t2 = t2 / t2_norm;
  [ ~, p2 ] = max ( abs ( t2 ) );
%
%  Especially when switching parameters, we need to make sure
%  the sign of the tangent is chosen correctly.  In general,
%  it should have a POSITIVE projection on the previous tangent.
%
  if ( t2' * t1 < 0.0 )
    t2 = - t2;
  end 

  return
end

