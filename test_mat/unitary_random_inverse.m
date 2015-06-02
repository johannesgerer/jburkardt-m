function a = unitary_random_inverse ( n, key )

%*****************************************************************************80
%
%% UNITARY_RANDOM_INVERSE returns the inverse of the UNITARY_RANDOM matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Pete Stewart,
%    Efficient Generation of Random Orthogonal Matrices With an Application
%    to Condition Estimators,
%    SIAM Journal on Numerical Analysis,
%    Volume 17, Number 3, June 1980, pages 403-409.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, integer KEY, a positive value that selects the data.
%
%    Output, complex A(N,N), the matrix.
%
  a = unitary_random ( n, key );

  a = ctranspose ( a );

  return
end
