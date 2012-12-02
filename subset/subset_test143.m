function subset_test143 ( )

%*****************************************************************************80
%
%% TEST143 tests SUBSET_LEX_NEXT without size restrictions.
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
  fprintf ( 1, 'TEST143\n' );
  fprintf ( 1, '  SUBSET_LEX_NEXT generates all subsets of an N set.\n' );
  fprintf ( 1, '\n' );
  
  n = 5;
  ltest = 0;
  ndim = 5;
  k = 0;
  a = [];
  rank = 0;
 
  while ( 1 )
 
    [ k, a, ] = subset_lex_next ( n, ltest, ndim, k, a );
 
    rank = rank + 1;
    fprintf ( 1, '  %2d', rank );

    if ( 0 < k )
      for i = 1 : k
        fprintf ( 1, '  %2d', a(i) );
      end
      fprintf ( 1, '\n' );
    else
      fprintf ( 1, '  The empty set.\n' );
    end
 
    if ( k == 0 )
      break
    end

  end

  return
end
