function r8r8r8vec_index_insert_unique_test ( )

%*****************************************************************************80
%
%% R8R8R8VEC_INDEX_INSERT_UNIQUE_TEST tests R8R8R8VEC_INDEX_INSERT_UNIQUE.
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
  n = 0;
  x = [];
  y = [];
  z = [];
  indx = [];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8R8R8VEC_INDEX_INSERT_UNIQUE_TEST\n' );
  fprintf ( 1, '  R8R8R8VEC_INDEX_INSERT_UNIQUE inserts unique values into\n' );
  fprintf ( 1, '  an index sorted array.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of random values to generate = %d\n', n_max );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    XVAL    YVAL  ZVAL  Index\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : n_max

    [ xval, seed ] = r8_uniform_ab ( 1.0, 4.0, seed );
    xval = round ( xval );
    [ yval, seed ] = r8_uniform_ab ( 1.0, 3.0, seed );
    yval = round ( yval );
    [ zval, seed ] = r8_uniform_ab ( 1.0, 4.0, seed );
    zval = round ( zval );

    [ n, x, y, z, indx, ival, ierror ] = r8r8r8vec_index_insert_unique ( ...
      n, x, y, z, indx, xval, yval, zval );

    fprintf ( 1, '    %3d  %6f  %6f  %6f\n', ival, xval, yval, zval );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Vector of unique X Y Z values:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I  X(I)   Y(I)    Z(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '    %3d  %6f  %6f  %6f\n', i, x(i), y(i), z(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X Y Z sorted by index:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I  INDX(I)  X(I)  X(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '    %3d  %6f  %6f  %6f\n', i, indx(i), x(indx(i)), ...
      y(indx(i)), z(indx(i)) );
  end

  return
end
