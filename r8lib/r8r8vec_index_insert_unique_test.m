function r8r8vec_index_insert_unique_test ( )

%*****************************************************************************80
%
%% R8R8VEC_INDEX_INSERT_UNIQUE_TEST tests R8R8VEC_INDEX_INSERT_UNIQUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n_max = 30;

  x_max = 4.0;
  x_min = 1.0;
  y_max = 3.0;
  y_min = 1.0;

  n = 0;
  x = [];
  y = [];
  indx = [];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8R8VEC_INDEX_INSERT_UNIQUE_TEST\n' );
  fprintf ( 1, '  R8R8VEC_INDEX_INSERT_UNIQUE inserts unique values into an\n' );
  fprintf ( 1, '    index sorted array.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generate %d random values:\n', n_max );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index    XVAL    YVAL\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;
  
  for i = 1 : n_max

    [ xval, seed ] = r8_uniform_ab ( x_min, x_max, seed );
    xval = round ( xval );
    [ yval, seed ] = r8_uniform_ab ( y_min, y_max, seed );
    yval = round ( yval );

    [ n, x, y, indx, ival, ierror ] = r8r8vec_index_insert_unique ( ...
      n, x, y, indx, xval, yval );

    fprintf ( 1, '    %6d  %6f  %6f\n', ival, xval, yval );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Vector of unique X Y values:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I  X(I)   Y(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '    %6d  %6f  %6f\n', i, x(i), y(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X, Y sorted by index\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I  INDX(I)  X(INDX(I))  Y(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '    %6d  %6f  %6f\n', i, indx(i), x(indx(i)), y(indx(i)) );
  end

  return
end
