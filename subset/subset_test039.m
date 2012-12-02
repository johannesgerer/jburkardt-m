function subset_test039 ( )

%*****************************************************************************80
%
%% TEST039 tests I4MAT_01_ROWCOLSUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  m = 13;
  n = 17;
  c = [  4,  4, 11, 10, 10,  8,  9, 10,  8,  9,  3, 10,  4,  7,  9,  3,  3 ];
  r = [ 14, 13, 14, 10, 12,  2, 10,  1, 10, 11,  6,  2, 17 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST039\n' );
  fprintf ( 1, '  I4MAT_01_ROWCOLSUM constructs a 01 matrix with\n' );
  fprintf ( 1, '  given row and column sums.\n' );

  i4vec_print ( m, r, '  The rowsum vector R:' );
  rperm = i4vec_sort_heap_index_d ( m, r );

  for i = 1 : m
    r2(i) = r(rperm(i));
  end

  i4vec_print ( n, c, '  The columnsum vector C: ' );
  cperm = i4vec_sort_heap_index_d ( n, c );

  for i = 1 : n
    c2(i) = c(cperm(i));
  end

  [ a, ierror ] = i4mat_01_rowcolsum ( m, n, r2, c2 );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Error flag IERROR = %d\n', ierror );
    return
  end
%
%  Invert the R and C permutations.
%
  a = i4mat_perm2 ( m, n, a, rperm, cperm );

  i4mat_print ( m, n, a, '  The rowcolsum matrix:' );

  for i = 1 : m
    r3(i) = sum ( a(i,1:n) );
  end

  i4vec_print ( m, r3, '  Computed row sums' );

  for j = 1 : n
    c3(j) = sum ( a(1:m,j) );
  end

  i4vec_print ( n, c3, '  Computed column sums:' );

  return
end
