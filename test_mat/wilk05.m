function a = wilk05 ( )

%*****************************************************************************80
%
%% WILK05 returns the WILK05 matrix.
%
%  Formula:
%
%    A(I,J) = 1.8144 / ( I + J + 1 )
%
%  Example:
%
%    0.604800  0.453600  0.362880  0.302400  0.259200
%    0.453600  0.362880  0.302400  0.259200  0.226800
%    0.362880  0.302400  0.259200  0.226800  0.201600
%    0.302400  0.259200  0.226800  0.201600  0.181440
%    0.259200  0.226800  0.201600  0.181440  0.164945
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is essentially a scaled portion of the Hilbert matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    James Wilkinson,
%    The Algebraic Eigenvalue Problem,
%    Oxford University Press, 1965,
%    page 234.
%
%  Parameters:
%
%    Output, real A(5,5), the matrix.
%
  n = 5;

  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n
      a(i,j) = 1.8144 / ( i + j + 1 );
    end
  end

  return
end
