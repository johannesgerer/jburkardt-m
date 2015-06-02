function ah = r8mat_house_axh ( n, a, v )

%*****************************************************************************80
%
%% R8MAT_HOUSE_AXH computes A*H where H is a compact Householder matrix.
%
%  Discussion:
%
%    The Householder matrix H(V) is defined by
%
%      H(V) = I - 2 * v * v' / ( v' * v )
%
%    This routine is not particularly efficient.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real A(N,N), the matrix to be postmultiplied.
%
%    Input, real V(N), a vector defining a Householder matrix.
%
%    Output, real AH(N,N), the product A*H.
%
  v_normsq = sum ( v(1:n).^2 );
%
%  Compute A*H' = A*H
%
  for i = 1 : n
    for j = 1 : n
      ah(i,j) = a(i,j);
      for k = 1 : n
        ah(i,j) = ah(i,j) - 2.0 * a(i,k) * v(k) * v(j) / v_normsq;
      end
    end
  end

  return
end
