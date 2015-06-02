function a = pick ( n, w, z )

%*****************************************************************************80
%
%% PICK returns the PICK matrix.
%
%  Formula:
%
%    A(I,J) = ( 1 - conjg ( W(I) ) * W(J) )
%           / ( 1 - conjg ( Z(I) ) * Z(J) )
%
%  Properties:
%
%    A is Hermitian: A* = A.
%
%  Discussion:
%
%    Pick's matrix is related to an interpolation problem in the 
%    complex unit disk |z| < 1.
%
%    If z(1:n) are distinct points in the complex unit disk, and
%    w(1:n) are complex values, then Pick's matrix is positive
%    semidefinite if and only if there is a holomorphic function
%    phi from the unit disk to itself such that phi(z(i)) = w(i).
%
%    phi is unique if and only if Pick's matrix is singular.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John McCarthy,
%    Pick's Theorem: What's the Big Deal?
%    American Mathematical Monthly,
%    Volume 110, Number 1, January 2003, pages 36-45.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, complex W(N), the parameters associated with the
%    numerator.
%
%    Input, complex Z(N), the parameters associated with the
%    denominator.  Normally, the z's are distinct, and each of norm less 
%    than 1.
%
%    Output, complex A(N,N), the matrix.
%
  one = 1.0;

  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      a(i,j) = ( one - conj ( w(i) ) * w(j) ) / ( one - conj ( z(i) ) * z(j) );

    end
  end

  return
end
