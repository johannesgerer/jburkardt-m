function subset_test099 ( )

%*****************************************************************************80
%
%% TEST099 tests PERM_NEXT.
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
  fprintf ( 1, 'TEST099\n' );
  fprintf ( 1, '  PERM_NEXT generates permutations.\n' );
  fprintf ( 1, '\n' );

  more = 0;
  p = [];
  even = [];
 
  while ( 1 )

    [ p, more, even ] = perm_next ( n, p, more, even );

    perm_print ( n, p, ' ' );

    if ( ~more )
      break
    end
 
  end

  return
end
