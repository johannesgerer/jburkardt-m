function [ x, det ] = r8mat_solve_3d ( a, b, det, x )

%*****************************************************************************80
%
%% R8MAT_SOLVE_3D solves a 3 by 3 linear system using Cramer's rule.
%
%  Discussion:
%
%    If the determinant DET is returned as zero, then the matrix A is
%    singular, and does not have an inverse.  In that case, X is
%    returned as the [] vector.
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
%    05 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(3,3), the matrix.
%
%    Input, real B(3), the right hand side.
%
%    Output, real DET, the determinant of the matrix A.
%
%    Output, real X(3), the solution of the system,
%    if DET is nonzero.
%

%
%  Compute the determinant.
%
  det =  a(1,1) * ( a(2,2) * a(3,3) - a(2,3) * a(3,2) ) ...
       + a(1,2) * ( a(2,3) * a(3,1) - a(2,1) * a(3,3) ) ...
       + a(1,3) * ( a(2,1) * a(3,2) - a(2,2) * a(3,1) );
%
%  If the determinant is zero, bail out.
%
  if ( det == 0.0 )
    x = [];
    return
  end
%
%  Compute the solution.
%
  x(1) = (   ( a(2,2) * a(3,3) - a(2,3) * a(3,2) ) * b(1) ...
           - ( a(1,2) * a(3,3) - a(1,3) * a(3,2) ) * b(2) ...
           + ( a(1,2) * a(2,3) - a(1,3) * a(2,2) ) * b(3) ) / det;

  x(2) = ( - ( a(2,1) * a(3,3) - a(2,3) * a(3,1) ) * b(1) ...
           + ( a(1,1) * a(3,3) - a(1,3) * a(3,1) ) * b(2) ...
           - ( a(1,1) * a(2,3) - a(1,3) * a(2,1) ) * b(3) ) / det;

  x(3) = (   ( a(2,1) * a(3,2) - a(2,2) * a(3,1) ) * b(1) ...
           - ( a(1,1) * a(3,2) - a(1,2) * a(3,1) ) * b(2) ...
           + ( a(1,1) * a(2,2) - a(1,2) * a(2,1) ) * b(3) ) / det;

  return
end
