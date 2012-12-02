function shape_test ( code )

%*****************************************************************************80
%
%% SHAPE_TEST verifies the shape function values at the basis nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character ( len = * ) CODE, identifies the element to be used.
%    Legal values include 'Q4', 'Q8', 'Q9', 'Q12', 'Q16', 'QL',
%    'T3', 'T4', 'T6' and 'T10'.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SHAPE_TEST: Verify shape functions of type "%s"\n', code );

  element_order = order_code ( code );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Element order = %d\n', element_order );

  [ r, s, area ] = node_reference ( code );

  fprintf ( 1, '  Basis function values at basis nodes\n' );
  fprintf ( 1, '  should form the identity matrix.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : element_order
    [ t, dtdr, dtds ] = shape ( code, r(i), s(i) );
    for j = 1 : element_order
      fprintf ( 1, '  %7f', t(j) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The R and S derivatives should sum to 0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        dTdR sum        dTdS sum\n' );
  fprintf ( 1, '\n' );
  for i = 1 : element_order
    [ t, dtdr, dtds ] = shape ( code, r(i), s(i) );
    rsum = sum ( dtdr(1:element_order) );
    ssum = sum ( dtds(1:element_order) );
    fprintf ( 1, '  %14f  %14f\n', rsum, ssum );
  end

  return
end
