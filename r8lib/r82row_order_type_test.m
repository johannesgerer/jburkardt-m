function r82row_order_type_test ( )

%*****************************************************************************80
%
%% R82ROW_ORDER_TYPE_TEST tests R82ROW_ORDER_TYPE.
%
%  Discussion:
%
%    An R82ROW is a (2,N) array of R8's.
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
  n = 4;
  test_num = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R82ROW_ORDER_TYPE_TEST\n' );
  fprintf ( 1, '  R82ROW_ORDER_TYPE classifies an R8VEC as\n' );
  fprintf ( 1, '  -1: no order\n' );
  fprintf ( 1, '   0: all equal;\n' );
  fprintf ( 1, '   1: ascending;\n' );
  fprintf ( 1, '   2: strictly ascending;\n' );
  fprintf ( 1, '   3: descending;\n' );
  fprintf ( 1, '   4: strictly descending.\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    [ x, seed ] = r8mat_uniform_01 ( 2, n, seed );

    x(1:2,1:n) = round ( 3.0 * x(1:2,1:n) );

    order = r82row_order_type ( n, x );

    string = sprintf ( '  Order type = %d\n', order );

    r82row_print ( n, x, string );

  end

  return
end
