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
%    28 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real V(N), the vector defining the Householder matrix.
%
%    Output, real H(N,N), the Householder matrix.
%

%
%  Compute the L2 norm of V.
%
  beta = sum ( v(1:n).^2 );
%
%  Form the matrix H.
%
  h = r8mat_identity ( n );

  for i = 1 : n
    for j = 1 : n
      h(i,j) = h(i,j) - 2.0 * v(i) * v(j) / beta;
    end
  end

  return
end
