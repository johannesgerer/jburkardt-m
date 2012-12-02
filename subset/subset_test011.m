function subset_test011 ( )

%*****************************************************************************80
%
%% TEST011 tests COMB_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST011\n' );
  fprintf ( 1, '  COMB_NEXT produces combinations.\n' );
 
  n = 5;

  for k= 1 : n

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Combinations of size %d:\n', k );
    fprintf ( 1, '\n' );

    a = [];
    done = 1;

    while ( 1 )

      [ a, done ] = comb_next ( n, k, a, done );
 
      if ( done )
        break
      end

      for i = 1 : k
        fprintf ( 1, '  %4d', a(i) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
