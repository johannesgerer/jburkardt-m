function subset_test101 ( )

%*****************************************************************************80
%
%% TEST101 tests PERM_NEXT3.
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
  fprintf ( 1, 'TEST101\n' );
  fprintf ( 1, '  PERM_NEXT3 generates permutations in order.\n' );
  fprintf ( 1, '\n' );

  n = 4;
  p = [];
  more = 0;
 
  while ( 1 )

    [ p, more ] = perm_next3 ( n, p, more );

    perm_print ( n, p, ' ' );

    if ( ~more )
      break
    end

  end

  return
end
