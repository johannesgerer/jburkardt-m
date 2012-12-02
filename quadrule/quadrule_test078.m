function quadrule_test078 ( )

%*****************************************************************************80
%
%% TEST078 tests FEJER2_COMPUTE and FEJER2_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 October 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST078\n' );
  fprintf ( 1, '  FEJER2_COMPUTE computes the abscissas and weights\n' );
  fprintf ( 1, '  of a Fejer type 2 quadrature rule.\n' );
  fprintf ( 1, '  FEJER2_SET sets the abscissas and weights\n' );
  fprintf ( 1, '  of a Fejer type 2 quadrature rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Compare\n' );
  fprintf ( 1, '  (W1,X1) from FEJER2_SET,\n' );
  fprintf ( 1, '  (W2,X2) from FEJER2_COMPUTE.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Order  W1            W2          X1          X2\n' );
  fprintf ( 1, '\n' );

  for order = 1 : 10

    [ x1, w1 ] = fejer2_set ( order );
    [ x2, w2 ] = fejer2_compute ( order );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %8d\n', order );

    for i = 1 : order
      fprintf ( 1, '            %12f  %12f  %12f  %12f\n', ...
        w1(i), w2(i), x1(i), x2(i) );
    end

  end

  return
end
