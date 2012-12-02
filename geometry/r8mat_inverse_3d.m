function [ b, det ] = r8mat_inverse_3d ( a )

%*****************************************************************************80
%
%% R8MAT_INVERSE_3D inverts a 3 by 3 R8MAT using Cramer's rule.
%
%  Discussion:
%
%    If DET is zero, then A is singular, and does not have an
%    inverse.  In that case, B is simply set to zero, and a
%    message is printed.
%
%    If DET is nonzero, then its value is roughly an estimate
%    of how nonsingular the matrix A is.
%
%  Modified:
%
%    31 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(3,3), the matrix to be inverted.
%
%    Output, real B(3,3), the inverse of the matrix.
%
%    Output, real DET, the determinant of the matrix.
%

%
%  Compute the determinant of A
%
  det =   a(1,1) * ( a(2,2) * a(3,3) - a(2,3) * a(3,2) ) ...
        + a(1,2) * ( a(2,3) * a(3,1) - a(2,1) * a(3,3) ) ...
        + a(1,3) * ( a(2,1) * a(3,2) - a(2,2) * a(3,1) );
%
%  If the determinant is zero, bail out.
%
  if ( det == 0.0 )
    b(1:3,1:3) = 0.0;
    return
  end
%
%  Compute the entries of the inverse matrix using an explicit
%  formula.
%
  b(1,1) = + ( a(2,2) * a(3,3) - a(2,3) * a(3,2) ) / det;
  b(1,2) = - ( a(1,2) * a(3,3) - a(1,3) * a(3,2) ) / det;
  b(1,3) = + ( a(1,2) * a(2,3) - a(1,3) * a(2,2) ) / det;

  b(2,1) = - ( a(2,1) * a(3,3) - a(2,3) * a(3,1) ) / det;
  b(2,2) = + ( a(1,1) * a(3,3) - a(1,3) * a(3,1) ) / det;
  b(2,3) = - ( a(1,1) * a(2,3) - a(1,3) * a(2,1) ) / det;

  b(3,1) = + ( a(2,1) * a(3,2) - a(2,2) * a(3,1) ) / det;
  b(3,2) = - ( a(1,1) * a(3,2) - a(1,2) * a(3,1) ) / det;
  b(3,3) = + ( a(1,1) * a(2,2) - a(1,2) * a(2,1) ) / det;
