function r8vec_order_type_test ( )

%*****************************************************************************80
%
%% R8VEC_ORDER_TYPE_TEST tests R8VEC_ORDER_TYPE.
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
  ntest = 6;

  x(1:4,1) = [ 1.0, 3.0, 2.0, 4.0 ]';
  x(1:4,2) = [ 2.0, 2.0, 2.0, 2.0 ]';
  x(1:4,3) = [ 1.0, 2.0, 2.0, 4.0 ]';
  x(1:4,4) = [ 1.0, 2.0, 3.0, 4.0 ]';
  x(1:4,5) = [ 4.0, 4.0, 3.0, 1.0 ]';
  x(1:4,6) = [ 9.0, 7.0, 3.0, 0.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_ORDER_TYPE_TEST\n' );
  fprintf ( 1, '  R8VEC_ORDER_TYPE classifies a real vector as\n' );
  fprintf ( 1, '  -1: no order\n' );
  fprintf ( 1, '   0: all equal;\n' );
  fprintf ( 1, '   1: ascending;\n' );
  fprintf ( 1, '   2: strictly ascending;\n' );
  fprintf ( 1, '   3: descending;\n' );
  fprintf ( 1, '   4: strictly descending.\n' );
  fprintf ( 1, '\n' );

  for itest = 1 : ntest

    order = r8vec_order_type ( n, x(1:n,itest) );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  The following vector has order type %d\n', order );
    fprintf ( 1, '\n' );

    r8vec_print ( n, x(1:n,itest), ' ' );

  end

  return
end
