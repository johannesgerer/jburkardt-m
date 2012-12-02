function [ a, seed ] = r8col_duplicates ( m, n, n_unique, seed )

%*****************************************************************************80
%
%% R8COL_DUPLICATES generates an R8COL with some duplicate columns.
%
%  Discussion:
%
%    An R8COL is an M by N array of R8's, regarded as an array of N columns,
%    each of length M.
%
%    This routine generates a random R8COL with a specified number of
%    duplicate columns.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in each column of A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, integer N_UNIQUE, the number of unique columns in A.
%    1 <= N_UNIQUE <= N.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(M,N), the array.
%
%    Output, integer SEED, a seed for the random number generator.
%
  if ( n_unique < 1 || n < n_unique )
    fprintf ( 2, '\n' );
    fprintf ( 2, 'R8COL_DUPLICATES - Fatal error!\n' );
    fprintf ( 2, '  1 <= N_UNIQUE <= N is required.\n' );
    error ( 'R8COL_DUPLICATES - Fatal error!' );
  end

  [ a, seed ] = r8mat_uniform_01 ( m, n_unique, seed );
%
%  Randomly copy unique columns.
%
  for j1 = n_unique + 1 : n
    [ j2, seed ] = i4_uniform_ab ( 1, n_unique, seed );
    a(1:m,j1) = a(1:m,j2);
  end
%
%  Permute the columns.
%
  for j1 = 1 : n
    [ j2, seed ] = i4_uniform_ab ( j1, n, seed );
    temp(1:m) = a(1:m,j1);
    a(1:m,j1) = a(1:m,j2);
    a(1:m,j2) = temp(1:m);
  end

  return
end
