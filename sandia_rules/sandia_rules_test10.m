function sandia_rules_test10 ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST10 tests GEGENBAUER_COMPUTE.
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
  test_num = 3;

  alpha_test = [ 0.5, 1.0, 2.5 ];
  order_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST10\n' );
  fprintf ( 1, '  GEGENBAUER_COMPUTE computes a generalized Gauss-Gegenbauer rule\n' );
  fprintf ( 1, '  which is appropriate for integrands of the form\n' );
  fprintf ( 1, '    Integral ( -1 <= x <= +1 ) f(x) (1-x^2)^alpha dx.\n' );

  for test = 1 : test_num
  
    alpha = alpha_test(test);

    for order = 1 : order_max
    
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Order = %d\n', order );
      fprintf ( 1, '  ALPHA = %f\n', alpha );

      [ x, w ] = gegenbauer_compute ( order, alpha );

      for i = 1 : order
        fprintf ( 1, '  %8d  %24.16f  %24.16f\n', i, x(i), w(i) );
      end

    end

  end

  return
end
