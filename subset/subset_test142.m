function subset_test142 ( )

%*****************************************************************************80
%
%% TEST142 tests SUBSET_BY_SIZE_NEXT.
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
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST142\n' );
  fprintf ( 1, '  SUBSET_BY_SIZE_NEXT generates all subsets of an N set.\n' );
  fprintf ( 1, '\n' );

  a = [];
  size = [];
  more = 0;
  rank = 0;

  while ( 1 )

    [ a, size, more ] = subset_by_size_next ( n, a, size, more );

    rank = rank + 1;
    fprintf ( 1, '  %2d', rank );

    if ( 0 < size )
      for i = 1 : size
        fprintf ( 1, '  %2d', a(i) );
      end
      fprintf ( 1, '\n' );
    else
      fprintf ( 1, '  The empty set\n' );
    end

    if ( ~more )
      break
    end

  end

  return
end
