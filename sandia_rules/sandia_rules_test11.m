function sandia_rules_test11 ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST11 tests GEN_HERMITE_COMPUTE against GEN_HERMITE_INTEGRAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 March 2010
%
%  Author:
%
%    John Burkardt
%
  test_num = 3;

  alpha_test = [ 0.5, 1.0, 2.5 ];
  order_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST11\n' );
  fprintf ( 1, '  GEN_HERMITE_COMPUTE computes a generalized Gauss-Hermite rule\n' );
  fprintf ( 1, '  which is appropriate for integrands of the form\n' );
  fprintf ( 1, '    Integral ( -oo < x < +oo ) f(x) x^alpha exp(-x*x) dx.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  GEN_HERMITE_INTEGRAL determines the exact value of\n' );
  fprintf ( 1, '  this integal when f(x) = x^n.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A rule of order ORDER should be exact for monomials X^N\n' );
  fprintf ( 1, '  up to N = 2*ORDER-1\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In the following table, for each order, the LAST THREE estimates\n' );
  fprintf ( 1, '  are made on monomials that exceed the exactness limit for the rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Order         N       Alpha           Estimate       Exact            Error\n' );

  for test = 1 : test_num
  
    alpha = alpha_test(test);

    for order = 1 : order_max
    
      fprintf ( 1, '\n' );

      [ x, w ] = gen_hermite_compute ( order, alpha );
 
      for n = 0 : 2 * order + 2
      
        exact = gen_hermite_integral ( n, alpha );

        f = zeros ( order, 1 );

        if ( n == 0 )
      
          for i = 1 : order
            f(i) = 1.0;
          end
      
        else
      
          for i = 1 : order
            f(i) = x(i)^n;
          end

        end

        estimate = w(1:order)' * f(1:order);

        error = abs ( exact - estimate );
  
        fprintf ( 1, '  %8d  %8d  %14.6f  %14.6g  %14.6g  %14.6e\n', ...
          order, n, alpha, estimate, exact, error );

      end

    end
  end

  return
end
