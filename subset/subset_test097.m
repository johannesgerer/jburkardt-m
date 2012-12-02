function subset_test097 ( )

%*****************************************************************************80
%
%% TEST097 tests PERM_LEX_NEXT, PERM_SIGN.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST097\n' );
  fprintf ( 1, '  PERM_LEX_NEXT generates permutations in order.\n' );
  fprintf ( 1, '  PERM_SIGN computes the sign of a permutation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  RANK  SIGN  Permutation\n' );
  fprintf ( 1, '\n' );

  n = 4;
  p = [];
  more = 0;
  rank = 0;

  while ( 1 )

    [ p, more ] = perm_lex_next ( n, p, more );
    p_sign = perm_sign ( n, p );

    if ( ~more )
      break
    end

    fprintf ( 1, '  %2d  %4d  ', rank, p_sign );
    for i = 1 : n
      fprintf ( 1, '  %2d', p(i) );
    end
    fprintf ( 1, '\n' );

    rank = rank + 1;

  end
 
  return
end
