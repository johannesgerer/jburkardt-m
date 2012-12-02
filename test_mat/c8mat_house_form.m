function h = c8mat_house_form ( n, v )

%*****************************************************************************80
%
%% C8MAT_HOUSE_FORM constructs a Householder matrix from its compact form.
%
%  Discussion:
%
%    H(v) = I - 2 * v * hermitian ( v ) / ( hermitian ( v ) * v )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, complex V(N), the vector defining the
%    Householder matrix.
%
%    Output, complex H(N,N), the Householder matrix.
%
  beta = v(1:n) * v(1:n)';

  h = c8mat_identity ( n );

  for i = 1 : n
    for j = 1 : n
      h(i,j) = h(i,j) - 2.0 * v(i) *  v(j)' / beta;
    end
  end

  return
end
