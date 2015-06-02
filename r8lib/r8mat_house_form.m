function h = r8mat_house_form ( n, v )

%*****************************************************************************80
%
%% R8MAT_HOUSE_FORM constructs a Householder matrix from its compact form.
%
%  Discussion:
%
%    H(v) = I - 2 * v * v' / ( v' * v )
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
%    Input, integer N, the order of the matrix.
%
%    Input, real V(N,1), the vector defining the Householder matrix.
%
%    Output, real H(N,N), the Householder matrix.
%
  v = v(:);

  h = eye ( n ) - 2.0 * v * v' / ( v' * v );

  return
end
