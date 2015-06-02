function a = c8mat_test_inverse ( n )

%*****************************************************************************80
%
%% C8MAT_TEST_INVERSE computes the inverse of the test matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, complex A(N,N), the matrix.
%
  a = ( c8mat_test ( n ) )';

  return
end
