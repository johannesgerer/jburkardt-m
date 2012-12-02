function subset_test050 ( )

%*****************************************************************************80
%
%% TEST050 tests INDEX_NEXT2.
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
  hi = [ 11, -3, 1 ];
  lo = [ 10, -5, 0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST050\n' );
  fprintf ( 1, '  INDEX_NEXT2 generates all indices of an\n' );
  fprintf ( 1, '  array of given shape with given\n' );
  fprintf ( 1, '  lower and upper limits.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of index entries = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Coordinate, Maximum Index\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %8d  %8d  %8d\n', i, lo(i), hi(i) );
  end
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Index arrays:\n' );
  fprintf ( 1, '\n' );

  a = [];
  more = 0;

  while ( 1 )

    [ a, more ] = index_next2 ( n, lo, hi, a, more );

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
