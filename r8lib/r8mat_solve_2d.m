function [ det, x ] = r8mat_solve_2d ( a, b )

%*****************************************************************************80
%
%% R8MAT_SOLVE_2D solves a 2 by 2 linear system using Cramer's rule.
%
%  Discussion:
%
%    If DET is zero, then A is singular, and does not have an
%    inverse.  In that case, X is simply set to zero.
%
%    If DET is nonzero, then its value is roughly an estimate
%    of how nonsingular the matrix A is.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(2,2), the matrix.
%
%    Input, real B(2), the right hand side.
%
%    Output, real DET, the determinant of the matrix A.
%
%    Output, real X(2), the solution of the system,
%    if DET is nonzero.
%

%
%  Compute the determinant.
%
  det = a(1,1) * a(2,2) - a(1,2) * a(2,1);
%
%  If the determinant is zero, bail out.
%
  if ( det == 0.0 )
    x(1:2) = 0.0;
    return
  end
%
%  Compute the solution.
%
  x(1) = (  a(2,2) * b(1) - a(1,2) * b(2) ) / det;
  x(2) = ( -a(2,1) * b(1) + a(1,1) * b(2) ) / det;

  return
end
