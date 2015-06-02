function a = complex3 ( )

%*****************************************************************************80
%
%% COMPLEX3 returns the COMPLEX3 matrix.
%
%  Formula:
%
%    1        1 + 2i     2 + 10i
%    1 + i        3i    -5 + 14i
%    1 + i        5i    -8 + 20i
%
%  Properties:
%
%    A is complex.
%
%    A is integral.
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
  a(1,1) = complex (  1.0,  0.0 );
  a(2,1) = complex (  1.0,  1.0 );
  a(3,1) = complex (  1.0,  1.0 );

  a(1,2) = complex (  1.0,  2.0 );
  a(2,2) = complex (  0.0,  3.0 );
  a(3,2) = complex (  0.0,  5.0 );

  a(1,3) = complex (  2.0, 10.0 );
  a(2,3) = complex ( -5.0, 14.0 );
  a(3,3) = complex ( -8.0, 20.0 );

  return
end
