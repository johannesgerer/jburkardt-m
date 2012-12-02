function unicycle_test04 ( )

%*****************************************************************************80
%
%% UNICYCLE_TEST04 tests UNICYCLE_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNICYCLE_TEST04\n' );
  fprintf ( 1, '  UNICYCLE_NEXT generates unicycles in lex order.\n' );
  fprintf ( 1, '\n' );
  rank = -1;
  u = [];

  while ( 1 )

    [ u, rank ] = unicycle_next ( n, u, rank );

    if ( rank == - 1 )
      break
    end

    fprintf ( 1, '  %3d:  ', rank );
    for i = 1 : n
      fprintf ( '%2d', u(i) );
    end
    fprintf ( 1, '\n' );

  end
 
  return
end
