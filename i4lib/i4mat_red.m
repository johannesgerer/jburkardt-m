function [ a, irow, icol ] = i4mat_red ( m, n, a )

%*****************************************************************************80
%
%% I4MAT_RED divides out common factors in a row or column of an I4MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2005
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
%
%    Input, integer A(M,N), the matrix to be reduced.
%
%    Output, integer A(M,N), the reduced matrix.  The greatest common factor 
%    in any row or column is 1.
%
%    Output, integer IROW(M), the row factors that were divided out.
%
%    Output, integer ICOL(N), the column factors that were divided out.
%
  if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_RED - Warning!\n' );
    fprintf ( 1, '  M must be greater than 0.\n' );
    fprintf ( 1, '  Input M = %d\n', m );
    error ( 'I4MAT_RED - Fatal error!' );
  end

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_RED - Warning!\n' );
    fprintf ( 1, '  N must be greater than 0.\n' );
    fprintf ( 1, '  Input N = %d\n', n );
    error ( 'I4MAT_RED - Fatal error!' );
  end
%
%  Remove factors common to a column.
%
  incx = 1;
  for j = 1 : n
    [ a(1:m,j), icol(j) ] = i4vec_red ( m, a(1:m,j), incx );
  end
%
%  Remove factors common to a row.
%
  incx = 1;
  for i = 1 : m
    [ a(i,1:n), irow(i) ] = i4vec_red ( n, a(i,1:n), incx );
  end

  return
end
