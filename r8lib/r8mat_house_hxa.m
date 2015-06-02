function ha = r8mat_house_hxa ( n, a, v )

%*****************************************************************************80
%
%% R8MAT_HOUSE_HXA computes H*A where H is a compact Householder matrix.
%
%  Discussion:
%
%    The Householder matrix H(V) is defined by
%
%      H(V) = I - 2 * v * v' / ( v' * v )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real A(N,N), the matrix to be premultiplied.
%
%    Input, real V(N), a vector defining a Householder matrix.
%
%    Output, real HA(N,N), the product H*A.
%
  ha = a - 2.0 * v * v' * a / ( v' * v );

  return
end
