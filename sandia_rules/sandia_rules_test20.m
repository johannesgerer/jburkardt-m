function sandia_rules_test20 ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST20 tests LAGUERRE_COMPUTE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 March 2008
%
%  Author:
%
%    John Burkardt
%
  order_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST20\n' );
  fprintf ( 1, '  LAGUERRE_COMPUTE computes a generalized Gauss-Laguerre rule\n' );
  fprintf ( 1, '  which is appropriate for integrands of the form\n' );
  fprintf ( 1, '    Integral ( 0 <= x < +oo ) f(x) exp(-x) dx.\n' );

  for order = 1 : order_max
  
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Order = %d\n', order );

    [ x, w ] = laguerre_compute ( order );
 
    for i = 1 : order
      fprintf ( 1, '  %8d  %24.16f  %24.16f\n', i, x(i), w(i) );
    end

  end

  return
end
