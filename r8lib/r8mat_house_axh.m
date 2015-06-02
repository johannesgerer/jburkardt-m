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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2013
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
%    Input, real V(N,1), a vector defining a Householder matrix.
%
%    Output, real AH(N,N), the product A*H.
%
  ah = a - 2.0 * a * v * v' / ( v' * v );

  return
end
