function tno_order_test ( )

%*****************************************************************************80
%
%% TNO_ORDER_TEST tests TNO_ORDER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TNO_ORDER_TEST:\n' );
  fprintf ( 1, '  TNO_ORDER is given a level L, and returns the order N of\n' );
  fprintf ( 1, '  a Truncated Normal Odd (TNO) quadrature rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Level   Order\n' );
  fprintf ( 1, '\n' );

  for l = 1 : 20

    n = tno_order ( l );

    fprintf ( 1, '  %2d     %6d\n', l, n )

  end

  return
end
