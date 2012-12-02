function subset_test15696 ( )

%*****************************************************************************80
%
%% SUBSET_TEST15696 tests VECTOR_CONSTRAINED_NEXT7.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2010
%
%  Author:
%
%    John Burkardt
%
  n_max = 3;

  alpha = [ 4.0, 3.0, 5.0 ]';
  q_max = 20.0;
  q_min = 16.0;
  x_max = [ 2, 6, 4 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBSET_TEST15696\n' );
  fprintf ( 1, '  VECTOR_CONSTRAINED_NEXT7:\n' );
  fprintf ( 1, '  Consider vectors:\n' );
  fprintf ( 1, '    0 <= X(1:N) <= X_MAX(1:N),\n' );
  fprintf ( 1, '  Set\n' );
  fprintf ( 1, '    TOTAL = sum ( ALPHA(1:N) * X(1:N) )\n' );
  fprintf ( 1, '  Accept only vectors for which:\n' );
  fprintf ( 1, '    Q_MIN <= TOTAL <= Q_MAX\n' );

  for n = 2 : n_max

    more = 0;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  ALPHA:' );
    for j = 1 : n
      fprintf ( 1, '  %8d', alpha(j) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Q_MIN:  %f\n', q_min );
    fprintf ( 1, '  Q_MAX:  %f\n', q_max );
    fprintf ( 1, '  X_MAX:' );
    for j = 1 : n
      fprintf ( 1, '  %8d', x_max(j) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );

    i = 0;
    x = [];

    while ( 1 )

      [ x, more ] = vector_constrained_next7 ( n, alpha, x_max, x, q_min, ...
        q_max, more );

      if ( ~more )
        break
      end

      total = alpha(1:n)' * x(1:n);
      i = i + 1;
      fprintf ( 1, '  %8d  %14f', i, total );
      for j = 1 : n
        fprintf ( 1, '  %8d', x(j) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
