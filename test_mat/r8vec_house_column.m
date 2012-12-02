function v = r8vec_house_column ( n, a, k )

%*****************************************************************************80
%
%% R8VEC_HOUSE_COLUMN defines a Householder premultiplier that "packs" a column.
%
%  Discussion:
%
%    The routine returns a vector V that defines a Householder
%    premultiplier matrix H(V) that zeros out the subdiagonal entries of
%    column K of the matrix A.
%
%       H(V) = I - 2 * v * v'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix A.
%
%    Input, real A(N), column K of the matrix A.
%
%    Input, integer K, the column of the matrix to be modified.
%
%    Output, real V(N), a vector of unit L2 norm which defines an
%    orthogonal Householder premultiplier matrix H with the property
%    that the K-th column of H*A is zero below the diagonal.
%
  v(1:n) = 0.0;

  if ( k < 1 | n <= k )
    return
  end

  s = sqrt ( sum ( a(k:n).^2 ) );

  if ( s == 0.0 )
    return
  end

  v(k) = a(k) + abs ( s ) * r8_sign ( a(k) );
  v(k+1:n) = a(k+1:n);

  v(k:n) = v(k:n) / sqrt ( v(k:n).^2 );

  return
end
