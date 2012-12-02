function subset_test028a ( )

%*****************************************************************************80
%
%% TEST028a tests EQUIV_NEXT2.
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
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST028a\n' );
  fprintf ( 1, '  EQUIV_NEXT2 generates all partitions of a set.\n' );
  fprintf ( 1, '  Here, N = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank/element:' );
  for i = 1 : n
    fprintf ( 1, '  %4d', i );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
 
  rank = 0;
  a = [];
  done = 1;

  while ( 1 )

    [ a, done ] = equiv_next2 ( n, a, done );

    if ( done )
      break
    end

    rank = rank + 1;
    fprintf ( 1, '  %2d  ', rank );
    for i = 1 : n
      fprintf ( 1, '  %2d', a(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
