function a = diagonal_inverse ( n, x )

%*****************************************************************************80
%
%% DIAGONAL_INVERSE returns the inverse of a diagonal matrix.
%
%  Discussion:
%
%    The diagonal entries must be nonzero.
%
%  Example:
%
%    M = 5, N = 5, X = ( 1, 2, 3, 4, 5 )
%
%    1  0   0   0   0
%    0 1/2  0   0   0
%    0  0  1/3  0   0
%    0  0   0  1/4  0
%    0  0   0   0  1/5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N , the number of rows and columns 
%    of the matrix..
%
%    Input, real X(N), the diagonal entries of the matrix.
%
%    Output, real A(M,N), the inverse of the matrix.
%
  a(1:n,1:n) = 0.0;

  if ( any ( x(1:n) == 0.0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIAGONAL_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  Matrix is not invertible.\n' );
    error ( 'DIAGONAL_INVERSE - Fatal error!' );
  end

  for i = 1 : n
    a(i,i) = 1.0 / x(i);
  end

  return
end
