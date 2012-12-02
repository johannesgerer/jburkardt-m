function phi = basis_mn_tet10 ( t, n, p )

%*****************************************************************************80
%
%% BASIS_MN_TET10: all bases at N points for a TET10 element.
%
%  Discussion:
%
%    The routine is given the coordinates of the vertices of a tetrahedron.
%
%    It works directly with these coordinates, and does not refer to a
%    reference element.
%
%    P1 through P4 are vertices.
%
%    P1 <= P5  <= P2
%    P2 <= P6  <= P3
%    P1 <= P7  <= P3
%    P1 <= P8  <= P4
%    P2 <= P9  <= P4
%    P3 <= P10 <= P4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Olgierd Zienkiewicz,
%    The Finite Element Method,
%    Sixth Edition,
%    Butterworth-Heinemann, 2005,
%    ISBN: 0750663200,
%    LC: TA640.2.Z54.
%
%  Parameters:
%
%    Input, real T(3,4), the coordinates of the vertices.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real P(3,N), the points where the basis functions
%    are to be evaluated.
%
%    Output, real PHI(10,N), the value of the basis functions
%    at the evaluation points.
%
  phi_linear(1:4,1:n) = basis_mn_tet4 ( t, n, p );

  phi( 1,1:n) = ( 2.0 * phi_linear(1,1:n)  - 1.0 ) .* phi_linear(1,1:n);
  phi( 2,1:n) = ( 2.0 * phi_linear(2,1:n)  - 1.0 ) .* phi_linear(2,1:n);
  phi( 3,1:n) = ( 2.0 * phi_linear(3,1:n)  - 1.0 ) .* phi_linear(3,1:n);
  phi( 4,1:n) = ( 2.0 * phi_linear(4,1:n)  - 1.0 ) .* phi_linear(4,1:n);
  phi( 5,1:n) =   4.0 * phi_linear(1,1:n)          .* phi_linear(2,1:n);
  phi( 6,1:n) =   4.0 * phi_linear(2,1:n)          .* phi_linear(3,1:n);
  phi( 7,1:n) =   4.0 * phi_linear(1,1:n)          .* phi_linear(3,1:n);
  phi( 8,1:n) =   4.0 * phi_linear(1,1:n)          .* phi_linear(4,1:n);
  phi( 9,1:n) =   4.0 * phi_linear(2,1:n)          .* phi_linear(4,1:n);
  phi(10,1:n) =   4.0 * phi_linear(3,1:n)          .* phi_linear(4,1:n);

  return
end