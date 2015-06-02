function [ value, seed ] = unitary_random_determinant ( n, key )

%*****************************************************************************80
%
%% UNITARY_RANDOM_DETERMINANT returns the determinant of a random unitary matrix.
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
%    Input, integer N, the order of the matrix.
%
%    Input, integer KEY, a positive value that selects the data.
%
%    Output, complex VALUE, the determinant.
%
  value = 1.0 + 0 * i;

  return
end
