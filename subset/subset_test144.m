function subset_test144 ( )

%*****************************************************************************80
%
%% TEST144 tests SUBSET_GRAY_NEXT.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST144\n' );
  fprintf ( 1, '  SUBSET_GRAY_NEXT generates all subsets of an N set.\n' );
  fprintf ( 1, '  using the Gray code ordering:\n' );
  fprintf ( 1, '  0 0 1 0 1 means the subset contains 3 and 5.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Gray code\n' );
  fprintf ( 1, '\n' );
 
  rank = 0;
  n = 5;
  a = [];
  more = 0;
  ncard = [];
  
  while ( 1 )
 
    [ a, more, ncard, iadd ] = subset_gray_next ( n, a, more, ncard );

    rank = rank + 1;

    fprintf ( 1, '  %2d', rank );
    for i = 1 : n
      fprintf ( 1, '  %4d', a(i) );
    end
    fprintf ( 1, '\n' );

    if ( ~more )
      break
    end

  end

  return
end
