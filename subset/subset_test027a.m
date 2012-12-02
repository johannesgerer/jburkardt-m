function subset_test027a ( )

%*****************************************************************************80
%
%% TEST027a tests EQUIV_NEXT.
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
  fprintf ( 1, 'TEST027a\n' );
  fprintf ( 1, '  EQUIV_NEXT generates all partitions of a set.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank/element:' );
  for i = 1 : n
    fprintf ( 1, '  %4d', i );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
 
  rank = 0;
  npart = [];
  jarray = [];
  a = [];
  more = 0;
 
  while ( 1 )
 
    [ npart, jarray, a, more ] = equiv_next ( n, npart, jarray, a, more );
 
    rank = rank + 1;
    fprintf ( 1, '  %2d  ', rank );
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
