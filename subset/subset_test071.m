function subset_test071 ( )

%*****************************************************************************80
%
%% TEST071 tests KSUB_NEXT.
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
  k = 3;
  n = 5;
  a(1:k) = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST071\n' );
  fprintf ( 1, '  KSUB_NEXT generates all K subsets of an N set\n' );
  fprintf ( 1, '  in lexicographic order.\n' );
  fprintf ( 1, '\n' );

  more = 0;
  rank = 0;
 
  while ( 1 )

    [ a, more ] = ksub_next ( n, k, a, more );

    rank = rank + 1;
    fprintf ( 1, '  %2d  ', rank );
    for i = 1 : k
      fprintf ( 1, '  %2d', a(i) );
    end
    fprintf ( 1, '\n' );

    if ( ~more )
      break
    end

  end

  return
end
