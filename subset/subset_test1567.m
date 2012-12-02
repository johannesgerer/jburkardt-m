function subset_test1567 ( )

%*****************************************************************************80
%
%% TEST1567 tests VECTOR_CONSTRAINED_NEXT3.
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
  n_max = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1567\n' );
  fprintf ( 1, '  VECTOR_CONSTRAINED_NEXT3:\n' );
  fprintf ( 1, '  Consider vectors:\n' );
  fprintf ( 1, '    X_MIN(1:N) <= X(1:N) <= X_MAX(1:N),\n' );
  fprintf ( 1, '  Set\n' );
  fprintf ( 1, '    CONSTRAINT = sum ( X(1:N) / X_MAX(1:N) )\n' );
  fprintf ( 1, '  Accept only vectors for which:\n' );
  fprintf ( 1, '    CONSTRAINT <= 1\n' );

  x_min = [ 1, 1, 1 ];
  x_max = [ 5, 6, 4 ];

  for n = 2 : n_max

    more = 0;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  X_MIN:' );
    for i = 1 : n
      fprintf ( 1, '  %2d', x_min(i) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  X_MAX:' );
    for i = 1 : n
      fprintf ( 1, '  %2d', x_max(i) );
    end
    fprintf ( 1, '\n' );

    i = 0;
    x = [];

    while ( 1 )

      [ x, constraint, more ] = vector_constrained_next3 ( ...
        n, x_min, x_max, x, more );

      if ( ~more )
        break
      end

      i = i + 1;
      fprintf ( 1, '  %8d', i );
      for j = 1 : n
        fprintf ( 1, '  %8d', x(j) );
      end
      fprintf ( 1, '  %14f\n', constraint );

    end

  end

  return
end
