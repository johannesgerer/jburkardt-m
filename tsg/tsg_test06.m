function tsg_test06 ( )

%*****************************************************************************80
%
%% TSG_TEST06 compares grid sizes for different growth options.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TSG_TEST06\n' );
  fprintf ( 1, '  Generate Clenshaw-Curtis sparse grids in 2D.\n' );
  fprintf ( 1, '  For the "growth" argument, compare all three options.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Level   HYPER     LEVEL     BASIS\n' );
  fprintf ( 1, '\n' );

  dim = 2;
  rule = 'clenshaw-curtis';
  order = 0;

  for level = 1 : 7

    [ weights, points ] = tsgMakeQuadrature ( dim, rule, level, order, 'hyperbolic' );
    n1 = size ( points, 1 );

    [ weights, points ] = tsgMakeQuadrature ( dim, rule, level, order, 'level' );
    n2 = size ( points, 1 );

    [ weights, points ] = tsgMakeQuadrature ( dim, rule, level, order, 'basis' );
    n3 = size ( points, 1 );

    fprintf ( 1, '  %2d:  %8d  %8d  %8d\n', level, n1, n2, n3 );

  end

  return
end
