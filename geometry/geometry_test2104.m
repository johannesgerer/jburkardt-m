function test2104 ( )

%*****************************************************************************80
%
%% TEST2104 tests TRIANGLE_LATTICE_LAYER_POINT_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 July 2009
%
%  Author:
%
%    John Burkardt
%
  n = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2104\n' );
  fprintf ( 1, '  TRIANGLE_LATTICE_LAYER_POINT_NEXT returns the next\n' );
  fprintf ( 1, '  point in a triangle lattice layer defined by:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    C(3) - 1 < X(1)/C(1) + X(2)/C(2) <= C(3).\n' );

  c(1) = 2;
  c(2) = 3;
  v(1:n) = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  C =         %4d  %4d\n', c(1:n) );

  for layer = 0 : 4

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Layer %d\n', layer );
    fprintf ( 1, '\n' );

    c(3) = layer;
    more = 0;
    i = 0;

    while ( 1 );
      [ v, more ] = triangle_lattice_layer_point_next ( c, v, more );
      if ( ~more )
        fprintf ( 1, '  No more.\n' );
        break
      end
      i = i + 1;
      fprintf ( 1, '  %4d  %4d  %4d\n', i, v(1:n) );

    end

  end

  return
end
