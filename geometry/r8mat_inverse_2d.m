function [ b, det ] = r8mat_inverse_2d ( a )

%*****************************************************************************80
%
%% R8MAT_INVERSE_2D inverts a 2 by 2 real matrix using Cramer's rule.
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
%    Input, real A(2,2), the matrix to be inverted.
%
%    Output, real B(2,2), the inverse of the matrix.
%
%    Output, real DET, the determinant of the matrix.
%

%
%  Compute the determinant.
%
  det = a(1,1) * a(2,2) - a(1,2) * a(2,1);
%
%  If the determinant is zero, bail out.
%
  if ( det == 0.0 )
    b(1:2,1:2) = 0.0;
    return
  end
%
%  Compute the entries of the inverse matrix using an explicit formula.
%
  b(1,1) = + a(2,2) / det;
  b(1,2) = - a(1,2) / det;
  b(2,1) = - a(2,1) / det;
  b(2,2) = + a(1,1) / det;

