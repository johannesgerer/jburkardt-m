function asa299_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests SIMPLEX_LATTICE_POINT_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2007
%
%  Author:
%
%    John Burkardt
%
  n = 4;
  t = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  SIMPLEX_LATTICE_POINT_NEXT generates lattice points\n' );
  fprintf ( 1, '  in the simplex\n' );
  fprintf ( 1, '    0 <= X\n' );
  fprintf ( 1, '    sum ( X(1:N) ) <= T\n' );
  fprintf ( 1, '  Here N = %d\n', n );
  fprintf ( 1, '  and T =  %d\n', t );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Index        X(1)      X(2)      X(3)      X(4)\n' );
  fprintf ( 1, '\n' );

  more = 0;
  x = [];

  i = 0;

  while ( 1 )

    [ more, x ] = simplex_lattice_point_next ( n, t, more, x );

    i = i + 1;

    fprintf ( 1, '  %8d  ', i );
    for j = 1 : n
      fprintf ( 1, '  %8d', x(j) );
    end
    fprintf ( 1, '\n' );

    if ( ~more )
      break
    end

  end

  return
end
