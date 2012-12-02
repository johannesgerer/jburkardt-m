function a = hamming ( m, n )

%*****************************************************************************80
%
%% HAMMING computes the Hamming matrix.
%
%  Example:
%
%    M = 3, N = 7
%
%    1 1 1 0 1 0 0
%    1 1 0 1 0 1 0
%    1 0 1 1 0 0 1
%
%    7 6 5 3 4 2 1 <-- binary interpretation of columns
%
%  Discussion:
%
%    For a given order M, the Hamming matrix is a rectangular array
%    of M rows and (2**M)-1 columns.  The entries of the matrix are
%    0 and 1.  The columns of A should be interpreted as the binary
%    representations of the integers between 1 and (2**M)-1.
%
%    We can also think of the columns as representing nonempty subsets
%    of an M set.  With this perspective, the columns of the matrix
%    are listed by order of size of subset.  For a given size, the columns
%    are ordered lexicographically.
%
%    The Hamming matrix can be viewed as an embodiment of the Hamming
%    code.  The nonsingleton columns correspond to data bits, and the
%    singleton columns correspond to check bits.  Each row of the
%    matrix represents a condition that the data bits and check bits
%    must satisfy.
%
%  Properties:
%
%    A has full row rank.
%
%    The last M columns of A contain the M by M identity matrix.
%
%    A is integral: int ( A ) = A.
%
%    A is a zero-one matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in the matrix.
%
%    Input, integer N, the number of columns in the matrix.
%    N must be equal to 2^M-1.
%
%    Output, real A(M,N), the matrix.
%
  if ( n ~= 2^m - 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HAMMING - Fatal error!\n' );
    fprintf ( 1, '  M = %d\n', m );
    fprintf ( 1, '  N = %d\n', n );
    fprintf ( 1, '  but N = 2^M-1 is required.\n' );
    error ( 'HADAMARD - Fatal error!' );
  end

  a(1:m,1:n) = 0.0;

  iarray = [];
  size = 0;
  more = 0;

  for j = 1 : n

    [ iarray, size, more ] = sub_by_size_next ( m, iarray, size, more );

    for k = 1 : size
      i = iarray(k);
      a(i,j) = 1.0;
    end

  end

  return
end
