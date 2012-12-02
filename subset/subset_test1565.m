function subset_test1565 ( )

%*****************************************************************************80
%
%% TEST1565 tests VECTOR_CONSTRAINED_NEXT
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
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1565\n' );
  fprintf ( 1, '  VECTOR_CONSTRAINED_NEXT:\n' );
  fprintf ( 1, '  Consider vectors:\n' );
  fprintf ( 1, '    X_MIN(1:N) <= X(1:N) <= X_MAX(1:N),\n' );
  fprintf ( 1, '  Set\n' );
  fprintf ( 1, '    P = Product X_MAX(1:N)\n' );
  fprintf ( 1, '  Accept only vectors for which:\n' );
  fprintf ( 1, '    sum ( (X(1:N)-1) * P / X_MAX(1:N) ) <= P\n' );

  more = 0;
  x_min = [ 2, 2, 1 ];
  x_max = [ 4, 5, 3 ];

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
  x_prod = prod ( x_max(1:n) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum allowed CONSTRAINT = P =        %d\n', x_prod );
  fprintf ( 1, '\n' );

  x = [];

  while ( 1 )

    [ x, constraint, more ] = vector_constrained_next ( ...
      n, x_min, x_max, x, more );

    if ( ~more )
      break
    end

    i = i + 1;
    fprintf ( 1, '  %8d  %8d  %8d  %8d  %12d\n', i, x(1:n), constraint );

  end

  return
end
