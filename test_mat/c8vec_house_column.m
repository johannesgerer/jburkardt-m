function v = c8vec_house_column ( n, a, k )

%*****************************************************************************80
%
%% C8VEC_HOUSE_COLUMN defines a Householder premultiplier that "packs" a column.
%
%  Discussion:
%
%    The routine returns a vector V that defines a Householder
%    premultiplier matrix H(V) that zeros out the subdiagonal entries of
%    column K of the matrix A.
%
%       H(V) = I - 2 * v * conjg ( v )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix A.
%
%    Input, complex A(N), column K of the matrix A.
%
%    Input, integer K, the column of the matrix to be modified.
%
%    Output, complex V(N), a vector of unit L2 norm which defines a
%    unitary Householder premultiplier matrix H with the property
%    that the K-th column of H * A is zero below the diagonal.
%
  v(1:n) = 0.0;

  if ( k < 1 | n <= k )
    return
  end

  s = sqrt ( a(k:n,1)' * a(k:n,1) );

  if ( s == 0.0 )
    return
  end

  v(k) = a(k,1) + s * a(k,1) / abs ( a(k,1) );

  v(k+1:n) = a(k+1:n,1);

  s = sqrt ( v(k:n) * v(k:n)' );

  v(k:n) = v(k:n) / s;

  return
end
