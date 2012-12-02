function subset_test1435 ( )

%*****************************************************************************80
%
%% TEST1435 tests SUBSET_LEX_NEXT with size restrictions.
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
  fprintf ( 1, 'TEST1435\n' );
  fprintf ( 1, '  SUBSET_LEX_NEXT generates all subsets of an N set.\n' );
  fprintf ( 1, '  The user can impose a restriction on the\n' );
  fprintf ( 1, '  maximum size of the subsets.\n' );

  n = 5;
  ndim = 3;
  k = 0;
  a = [];
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, we require the subsets to be no larger\n' );
  fprintf ( 1, '  than %d\n', ndim );

  while ( 1 )
 
    ltest = ( k == ndim );

    [ k, a ] = subset_lex_next ( n, ltest, ndim, k, a );
 
    if ( 0 < k )
      for i = 1 : k
        fprintf ( 1, '  %4d', a(i) );
      end
      fprintf ( 1, '\n' );
    else
      fprintf ( 1, 'The empty set.\n' );
    end
 
    if ( k == 0 )
      break
    end

  end

  return
end
