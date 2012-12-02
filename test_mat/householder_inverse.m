function a = householder_inverse ( n, x )

%*****************************************************************************80
%
%% HOUSEHOLDER_INVERSE returns the inverse of a HOUSEHOLDER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the vector that defines the 
%    Householder matrix.
%
%    Output, real A(N,N), the eigenvalues.
%
  a = householder ( n, x );

  return
end
