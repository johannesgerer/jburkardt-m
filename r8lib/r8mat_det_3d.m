function det = r8mat_det_3d ( a )

%*****************************************************************************80
%
%% R8MAT_DET_3D computes the determinant of a 3 by 3 matrix.
%
%  Discussion:
%
%    The determinant is the volume of the shape spanned by the vectors
%    making up the rows or columns of the matrix.
%
%    det = a11 * a22 * a33 - a11 * a23 * a32
%        + a12 * a23 * a31 - a12 * a21 * a33
%        + a13 * a21 * a32 - a13 * a22 * a31
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
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
%    Input, real A(3,3), the matrix whose determinant is desired.
%
%    Output, real DET, the determinant of the matrix.
%
  det  =   a(1,1) * ( a(2,2) * a(3,3) - a(2,3) * a(3,2) ) ...
         + a(1,2) * ( a(2,3) * a(3,1) - a(2,1) * a(3,3) ) ...
         + a(1,3) * ( a(2,1) * a(3,2) - a(2,2) * a(3,1) );

  return
end
