function blas1_s_test05 ( )

%*****************************************************************************80
%
%% TEST05 demonstrates SCOPY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  SCOPY copies one vector into another.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    x(i) = i;
  end

  for i = 1 : 10
    y(i) = 10 * i;
  end

  for i = 1 : 5
    for j = 1 : 5
      a(i,j) = 10 * i + j;
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = \n' );
  fprintf ( 1, '\n' );
  for i = 1 : 10
    fprintf ( 1, '  %6d  %12f\n', i, x(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Y = \n' );
  fprintf ( 1, '\n' );
  for i = 1 : 10
    fprintf ( 1, '  %6d  %12f\n', i, y(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A = \n' );
  fprintf ( 1, '\n' );
  for i = 1 : 5
    for j = 1 : 5
      fprintf ( 1, '  %8f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  y = scopy ( 5, x, 1, y, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SCOPY ( 5, X, 1, Y, 1 )\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 10
    fprintf ( 1, '  %6d  %12f\n', i, y(i) );
  end

  for i = 1 : 10
    y(i) = 10 * i;
  end

  y = scopy ( 3, x, 2, y, 3 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SCOPY ( 3, X, 2, Y, 3 )\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 10
    fprintf ( 1, '  %6d  %12f\n', i, y(i) );
  end

  a = scopy ( 5, x, 1, a, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SCOPY ( 5, X, 1, A, 1 )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A = \n' );
  fprintf ( 1, '\n' );
  for i = 1 : 5
    for j = 1 : 5
      fprintf ( 1, '  %8f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  for i = 1 : 5
    for j = 1 : 5
      a(i,j) = 10 * i + j;
    end
  end

  a = scopy ( 5, x, 2, a, 5 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SCOPY ( 5, X, 2, A, 5 )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A = \n' );
  fprintf ( 1, '\n' );
  for i = 1 : 5
    for j = 1 : 5
      fprintf ( 1, '  %8f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
