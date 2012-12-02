function a = complex3_inverse ( )

%*****************************************************************************80
%
%% COMPLEX3_INVERSE returns the inverse of the COMPLEX3 matrix.
%
%  Formula:
%
%      10 +  i    -2 + 6i    -3 - 2i
%       9 - 3i         8i    -3 - 2i
%      -2 + 2i    -1 - 2i     1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Joan Westlake,
%    Test Matrix A1,
%    A Handbook of Numerical Matrix Inversion and Solution of Linear Equations,
%    John Wiley, 1968.
%
%  Parameters:
%
%    Output, complex A(3,3), the matrix.
%
  a(1,1) = complex ( 10.0,  1.0 );
  a(2,1) = complex (  9.0, -3.0 );
  a(3,1) = complex ( -2.0,  2.0 );

  a(1,2) = complex ( -2.0,  6.0 );
  a(2,2) = complex (  0.0,  8.0 );
  a(3,2) = complex ( -1.0, -2.0 );

  a(1,3) = complex ( -3.0, -2.0 );
  a(2,3) = complex ( -3.0, -2.0 );
  a(3,3) = complex (  1.0,  0.0 );

  return
end
