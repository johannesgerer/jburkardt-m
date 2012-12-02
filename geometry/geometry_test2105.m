function test2105 ( )

%*****************************************************************************80
%
%% TEST2105 tests TRIANGLE_LATTICE_POINT_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 July 2009
%
%  Author:
%
%    John Burkardt
%
  n = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2105\n' );
  fprintf ( 1,'  TRIANGLE_LATTICE_POINT_NEXT returns the next lattice\n' );
  fprintf ( 1, '  point in a triangle defined by:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    0 <= X(1)/C(1) + X(2)/C(2) <= C(3).\n' );

  for i = 1 : n + 1
    c(i) = n + 2 - i;
  end
  v(1:n) = 0;
  more = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  C = ' );
  for i = 1 : n + 1
    fprintf ( 1, '  %4d', c(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );

  i = 0;

  while ( 1 )
    [ v, more ] = triangle_lattice_point_next ( c, v, more );
    if ( ~more )
      fprintf ( 1, '  No more.\n' );
      break
    end
    i = i + 1;
    fprintf ( 1, '  %4d', i );
    for j = 1 : n
      fprintf ( 1, '  %4d', v(j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
