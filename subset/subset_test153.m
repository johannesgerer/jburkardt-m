function subset_test153 ( )

%*****************************************************************************80
%
%% TEST153 tests TUPLE_NEXT2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 3;

  xmin = [ 2, 3, 8 ];
  xmax = [ 4, 3, 5 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST153\n' );
  fprintf ( 1, '  TUPLE_NEXT2 returns the next "tuple", that is,\n' );
  fprintf ( 1, '  a vector of N integers.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '\n' );
  i4vec_transpose_print ( n, xmin, '  The minimum tuple:' );
  i4vec_transpose_print ( n, xmax, '  The maximum tuple:' );
  rank = 0;
  x = [];
  
  while ( 1 )

    [ rank, x ] = tuple_next2 ( n, xmin, xmax, rank, x );

    if ( rank == 0 )
      break
    end

    fprintf ( 1, '  %2d  ', rank );
    for i = 1 : n
      fprintf ( 1, '  %2d', x(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
