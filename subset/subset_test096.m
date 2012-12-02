function subset_test096 ( )

%*****************************************************************************80
%
%% TEST096 tests PERM_LEX_NEXT.
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
  fprintf ( 1, 'TEST096\n' );
  fprintf ( 1, '  PERM_LEX_NEXT generates permutations in order.\n' );
  fprintf ( 1, '\n' );
  
  p = [];
  more = 0;
 
  while ( 1 )

    [ p, more ] = perm_lex_next ( n, p, more );

    if ( ~more )
      break
    end

    perm_print ( n, p, ' ' );

  end

  return
end
