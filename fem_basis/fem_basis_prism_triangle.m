function b = fem_basis_prism_triangle ( i, j, xyz )

%*****************************************************************************80
%
%% FEM_BASIS_PRISM_TRIANGLE evaluates a triangular prism basis function.
%
%  Discussion:
%
%    The element is a 3D prism, formed from a triangular base in the
%    XY plane that is extended vertically in the Z direction.
%
%    I(1:3) are the integer barycentric coordinates of a point in the
%    triangle.  I(1) + I(2) + I(3) = DI, the degree of the triangular
%    basis function BI.  X = I(1) / DI, Y = I(2) / DI.
%    The triangle is assumed to be the unit reference
%    triangle 0 <= X <= 1, 0 <= Y <= 1, 0 <= X + Y <= 1.
%
%    J(1:2) are the integer barycentric coordinates of a point in the
%    line segment.  J(1) + J(2) = DJ, the degree of the linear basis 
%    function BJ.  Z = J(1) / DJ.  
%    The line is assumed to be the unit line 0 <= Z <= 1.
%
%    The degree of the basis function B = BI * BJ is D = DI + DJ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I(3), the integer barycentric coordinates of
%    the triangular basis function, 0 <= I(*).  
%    The polynomial degree DI = I(1) + I(2) + I(3).
%
%    Input, integer J(2), the integer barycentric coordinates of
%    the linear basis function, 0 <= J(*).  
%    The polynomial degree DJ = J(1) + J(2).
%
%    Input, real XYZ(3), the evaluation point.
%
%    Output, real B, the value of the basis function at XYZ.
%

  bi = fem_basis_2d ( i(1), i(2), i(3), xyz(1), xyz(2) );

  bj = fem_basis_1d ( j(1), j(2), xyz(3) );
  
  b = bi * bj;

  return
end