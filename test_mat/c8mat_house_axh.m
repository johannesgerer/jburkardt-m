function ah = c8mat_house_axh ( n, a, v )

%*****************************************************************************80
%
%% C8MAT_HOUSE_AXH computes A*H where H is a compact Householder matrix.
%
%  Discussion:
%
%    The Householder matrix H(V) is defined by
%
%      H(V) = I - 2 * v * hermitian ( v ) / ( hermitian ( v ) * v )
%
%    This routine is not particularly efficient.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, complex A(N,N), the matrix.
%
%    Input, complex V(N), a vector defining a Householder matrix.
%
%    Output, complex AH(N,N), the product A*H.
%
  v_normsq = v(1:n) * v(1:n)';

  ah(1:n,1:n) = a(1:n,1:n);
%
%  Compute A * hermitian ( H ) = A * H
%
  for i = 1 : n
    for j = 1 : n
      for k = 1 : n
        ah(i,j) = ah(i,j) - 2.0 * a(i,k) * v(k) * v(j)' / v_normsq;
      end
    end
  end

  return
end
