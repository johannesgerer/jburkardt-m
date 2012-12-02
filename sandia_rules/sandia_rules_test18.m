function sandia_rules_test18 ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST18 tests JACOBI_COMPUTE.
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
  beta_test = [ 0.5, 1.0, 2.5 ];
  order_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST18\n' );
  fprintf ( 1, '  JACOBI_COMPUTE computes a Gauss-Jacobi rule\n' );
  fprintf ( 1, '  which is appropriate for integrands of the form\n' );
  fprintf ( 1, '    Integral ( -1 <= x <= +1 ) f(x) (1-x)^alpha (1+x)^beta dx.\n' );

  for test1 = 1 : test_num
  
    alpha = alpha_test(test1);

    for test2 = 1 : test_num
    
      beta = beta_test(test2);

      for order = 1 : order_max
      
        fprintf ( 1, '\n' );
        fprintf ( 1, '  Order = %d\n', order );
        fprintf ( 1, '  ALPHA = %f\n', alpha );
        fprintf ( 1, '  BETA =  %f\n', beta );

        [ x, w ] = jacobi_compute ( order, alpha, beta );

        for i = 1 : order
          fprintf ( 1, '  %8d  %24.16f  %24.16f\n', i, x(i), w(i) );
        end

      end
    end
  end

  return
end
