function test1788 ( )

%*****************************************************************************80
%
%% TEST17888 tests SIMPLEX_LATTICE_LAYER_POINT_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 July 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 4;
  n_test = [ 1, 2, 3, 4 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1788\n' );
  fprintf ( 1, '  SIMPLEX_LATTICE_LAYER_POINT_NEXT returns the next\n' );
  fprintf ( 1, '  point in an N-dimensional simplex lattice layer defined by:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    C(N+1) - 1 <= X(1)/C(1) + X(2)/C(2) + ... + X(N)/C(N) <= C(N+1).\n' );

  for test = 1 : test_num

    n = n_test(test);

    for i = 1 : n
      c(i) = i + 1;
    end
    v(1:n) = 0;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  N = %d\n', n );
    fprintf ( 1, '  C = ' );
    for i = 1 : n
      fprintf ( 1, '  %4d', c(i) );
    end
    fprintf ( 1, '\n' );

    for layer = 0 : 2

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Layer %d\n', layer );
      fprintf ( 1, '\n' );

      c(n+1) = layer;
      more = 0;
      i = 0;

      while ( 1 )
        [ v, more ] = simplex_lattice_layer_point_next ( n, c, v, more );
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

    end

  end

  return
end
