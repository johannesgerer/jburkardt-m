function a = helmert ( n )

%*****************************************************************************80
%
%% HELMERT returns the HELMERT matrix.
%
%  Formula:
%
%    If I = 1 then
%      A(I,J) = 1 / sqrt ( N )
%    else if J < I then
%      A(I,J) = 1 / sqrt ( I * ( I - 1 ) )
%    else if J = I then
%      A(I,J) = (1-I) / sqrt ( I * ( I - 1 ) )
%    else
%      A(I,J) = 0
%
%  Discussion:
%
%    The matrix given above by Helmert is the classic example of
%    a family of matrices which are now called Helmertian or
%    Helmert matrices.
%
%    A matrix is a (standard) Helmert matrix if it is orthogonal,
%    and the elements which are above the diagonal and below the
%    first row are zero.
%
%    If the elements of the first row are all strictly positive,
%    then the matrix is a strictly Helmertian matrix.
%
%    It is possible to require in addition that all elements below
%    the diagonal be strictly positive, but in the reference, this
%    condition is discarded as being cumbersome and not useful.
%
%    A Helmert matrix can be regarded as a change of basis matrix
%    between a pair of orthonormal coordinate bases.  The first row
%    gives the coordinates of the first new basis vector in the old
%    basis.  Each later row describes combinations of (an increasingly
%    extensive set of) old basis vectors that constitute the new
%    basis vectors.
%
%    Helmert matrices have important applications in statistics.
%
%  Example:
%
%    N = 5
%
%    0.4472    0.4472    0.4472    0.4472    0.4472
%    0.7071   -0.7071         0         0         0
%    0.4082    0.4082   -0.8165         0         0
%    0.2887    0.2887    0.2887   -0.8660         0
%    0.2236    0.2236    0.2236    0.2236   -0.8944
%
%  Properties:
%
%    A is generally not symmetric: A' ~= A.
%
%    A is orthogonal: A' * A = A * A' = I.
%
%    Because A is orthogonal, it is normal: A' * A = A * A'.
%
%    A is not symmetric: A' ~= A.
%
%    det ( A ) = (-1)^(N+1)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    HO Lancaster,
%    The Helmert Matrices,
%    American Mathematical Monthly,
%    Volume 72, 1965, pages 4-12.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );
%
%  A begins with the first row, diagonal, and lower triangle set to 1.
%
  for i = 1 : n
    for j = 1 : n

      if ( i == 1 )
        a(i,j) = 1.0 / sqrt ( n );
      elseif ( j < i )
        a(i,j) = 1.0 / sqrt ( i * ( i - 1 ) );
      elseif ( i == j )
        a(i,j) = ( 1 - i ) / sqrt ( i * ( i - 1 ) );
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
