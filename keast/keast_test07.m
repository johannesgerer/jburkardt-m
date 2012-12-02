function keast_test07 ( )

%*****************************************************************************80
%
%% KEAST_TEST07 tests KEAST_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'KEAST_TEST07\n' );
  fprintf ( 1, '  KEAST_RULE returns the points and weights\n' );
  fprintf ( 1, '  of a Keast rule for the tetrahedron.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we simply print a rule.\n' );

  rule = 10;
  degree = keast_degree ( rule );
  order_num = keast_order_num ( rule );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rule index  = %d\n', rule );
  fprintf ( 1, '  Rule degree = %d\n', degree );
  fprintf ( 1, '  Rule order  = %d\n', order_num );

  [ xyz, w ] = keast_rule ( rule, order_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '         I      W           X           Y           Z\n' );
  fprintf ( 1, '\n' );
  for order = 1 : order_num
    fprintf ( 1, '  %8d  %10f  %10f  %10f  %10f\n', ...
      order, w(order), xyz(1:3,order) );
  end
  
  return
end
