function v = r8vec_house_column ( n, a_vec, k )

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
%    12 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix A.
%
%    Input, real A_VEC(N,1), column K of the matrix A.
%
%    Input, integer K, the column of the matrix to be modified.
%
%    Output, real V(N,1), a vector of unit L2 norm which defines an
%    orthogonal Householder premultiplier matrix H with the property
%    that the K-th column of H*A is zero below the diagonal.
%

%
%  Destroy all row vectors!
%
  a_vec = a_vec(:);

  v(1:n,1) = 0.0;

  if ( k < 1 || n <= k )
    return
  end

  s = sqrt ( sum ( a_vec(k:n,1).^2 ) );

  if ( s == 0.0 )
    return
  end

  if ( a_vec(k,1) < 0.0 )
    v(k,1) = a_vec(k,1) - abs ( s ) ;
  else
    v(k,1) = a_vec(k,1) + abs ( s );
  end
  v(k+1:n,1) = a_vec(k+1:n,1);
%
%  Normalize V.
%
  s = sqrt ( sum ( v(k:n,1).^2 ) );

  v(k:n,1) = v(k:n,1) / s;

  return
end
