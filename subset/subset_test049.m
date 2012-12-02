function subset_test049 ( )

%*****************************************************************************80
%
%% TEST049 tests INDEX_NEXT1.
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
  n = 3;
  hi = [ 4, 2, 3 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST049\n' );
  fprintf ( 1, '  INDEX_NEXT1 generates all indices of an\n' );
  fprintf ( 1, '  array of given shape, with\n' );
  fprintf ( 1, '  lower limit 1 and given upper limits.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of index entries = %d\n', n );

  i4vec_print ( n, hi, '  Coordinate maximum indices:' );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index arrays:' );
  fprintf ( 1, '\n' );

  a = [];
  more = 0;

  while ( 1 )

    [ a, more ] = index_next1 ( n, hi, a, more );

    for i = 1 : n
      fprintf ( 1, '  %2d', a(i) );
    end
    fprintf ( 1, '\n' );

    if ( ~more )
      break
    end

  end

  return
end
