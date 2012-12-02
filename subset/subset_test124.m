function test124 ( )

%*****************************************************************************80
%
%% TEST124 tests REGRO_NEXT.
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
  fprintf ( 1, 'TEST124\n' );
  fprintf ( 1, '  REGRO_NEXT generates all restricted growth \n' );
  fprintf ( 1, '  functions.\n' );
  fprintf ( 1, '\n' );

  rank = 0;
  n = 4;
  v = [];
  vmax = [];
  done = 1;
 
  while ( 1 )

    [ v, vmax, done ] = regro_next ( n, v, vmax, done );

    if ( done )
      break
    end

    rank = rank + 1;
    fprintf ( 1, '  %2d  ', rank );
    for i = 1 : n
      fprintf ( 1, '  %2d', v(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
