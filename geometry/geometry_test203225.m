function test203225 ( )

%*****************************************************************************80
%
%% TEST203225 tests TETRAHEDRON_LATTICE_POINT_NEXT.
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
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST203225\n' );
  fprintf ( 1, '  TETRAHEDRON_LATTICE_POINT_NEXT returns the next lattice\n' );
  fprintf ( 1, '  point in a tetrahedron defined by:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    0 <= X(1)/C(1) + X(2)/C(2) + X(3)/C(3) <= C(4).\n' );

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
    [ v, more ] = tetrahedron_lattice_point_next ( c, v, more );
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
