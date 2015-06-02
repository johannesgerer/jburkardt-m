function i4vec_order_type_test ( )

%*****************************************************************************80
%
%% I4VEC_ORDER_TYPE_TEST tests I4VEC_ORDER_TYPE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;
  test_num = 6;
%
%  Each ROW of the definition is a COLUMN of the matrix.
%
  x_test = [ ...
    1, 3, 2, 4; ...
    2, 2, 2, 2; ...
    1, 2, 2, 4; ...
    1, 2, 3, 4; ...
    4, 4, 3, 1; ...
    9, 7, 3, 0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_ORDER_TYPE_TEST\n' );
  fprintf ( 1, '  I4VEC_ORDER_TYPE classifies an integer vector as\n' );
  fprintf ( 1, '  -1: no order\n' );
  fprintf ( 1, '   0: all equal;\n' );
  fprintf ( 1, '   1: ascending;\n' );
  fprintf ( 1, '   2: strictly ascending;\n' );
  fprintf ( 1, '   3: descending;\n' );
  fprintf ( 1, '   4: strictly descending.\n' );

  for test = 1 : test_num

    x(1:n) = x_test(1:n,test);

    order = i4vec_order_type ( n, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  The following vector has order type %d\n', order );
    fprintf ( 1, '\n' );
    for j = 1 : n
      fprintf ( 1, '  %6d  %6d\n', j, x(j) );
    end

  end

  return
end
