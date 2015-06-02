function cell_test01 ( )

%*****************************************************************************80
%
%% CELL_TEST01 stores some of Pascal's triangle in an R8CVV.
%
%  Discussion:
%
%    An R8CVV is a "cell array vector of vectors" of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 November 2012
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  nr = [ 4; 5; 6; 7; 8 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CELL_TEST01\n' );
  fprintf ( 1, '  Use a real cell array (vector of vectors) to store rows 3:7\n' );
  fprintf ( 1, '  of Pascal''s triangle.\n' );

  i4vec_print ( m, nr, '  The row sizes:' );
%
%  From the NR information:
%  * determine the total size, MN
%
  mn = r8cvv_size ( m, nr );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The storage for the cell array is %d\n', mn );
%
%  Allocate the cell array.
%
  a = zeros ( mn, 1 );
%
%  Allocate a vector big enough to hold any single row.
%
  nr_max = max ( nr(1:m) );
  ai = zeros ( nr_max, 1 );
%
%  From the NR information:
%  * determine the offsets.
%
  roff = r8cvv_offset ( m, nr );
  i4vec_print ( m + 1, roff, '  The row offsets:' );
%
%  Rows 1 through 5 of A will contain rows 3 through 7 of Pascal's triangle.
%  Set these values one row at a time.
%
  ai(1) = 1.0;

  for row = 1 : 7

    col = row + 1;
    ai(col) = ai(col-1);
    for col = row : -1 : 2
      ai(col) = ai(col) + ai(col-1);
    end

    if ( 3 <= row )
      i = row - 2;
      a = r8cvv_rset ( mn, a, m, roff, i, ai );
    end

  end
%
%  Print the cell array.
%
  r8cvv_print ( mn, a, m, roff, '  Rows 3:7 of Pascal''s Triangle:' );
%
%  Retrieve the entry from cell array row 3, column 4:
%
  i = 3;
  j = 4;
  aij = r8cvv_iget ( mn, a, m, roff, i, j );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A(%d,%d) = %g\n', i, j, aij );
%
%  Retrieve row 4:
%
  i = 4;
  ai = r8cvv_rget ( mn, a, m, roff, i );
  nv = roff(i+1) - roff(i);
  r8vec_transpose_print ( nv, ai, '  A(4,*):' );
%
%  Retrieve a list of entries.
%
  nn = 4;
  in = [ 1; 2; 5; 5 ];
  jn = [ 2; 3; 4; 8 ];
  vn = r8cvv_nget ( mn, a, m, roff, nn, in, jn );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Retrieve an arbitrary list of items:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nn
    fprintf ( 1, '  A(%d,%d) = %g\n', in(i), jn(i), vn(i) );
  end

  return
end
