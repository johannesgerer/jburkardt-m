function subset_test100 ( )

%*****************************************************************************80
%
%% TEST100 tests PERM_NEXT2.
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
  fprintf ( 1, 'TEST100\n' );
  fprintf ( 1, '  PERM_NEXT2 generates permutations in order.\n' );
  fprintf ( 1, '\n' );
  
  n = 4;
  p = [];
  invers = [];
  done = 1;
 
  while ( 1 )

    [ p, invers, done ] = perm_next2 ( n, p, invers, done );
 
    if ( done )
      break
    end

    perm_print ( n, p, ' ' );

  end

  return
end
