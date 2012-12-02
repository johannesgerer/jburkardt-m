function cn_jac_tests ( )

%*****************************************************************************80
%
%% CN_JAC_TESTS tests the rules for CN with Jacobi weight on monomials.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2010
%
%  Author:
%
%    John Burkardt
%
  test_num = 4;

  alpha_test = [ 0.0, 1.0, 0.0, 0.5 ];
  beta_test = [ 0.0, 0.0, 2.0, 1.5 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CN_JAC_TESTS\n' );
  fprintf ( 1, '  Demonstrate the use of quadrature rules for the region\n' );
  fprintf ( 1, '  CN_JAC, that is, the hypercube [-1,+1]^N, with the\n' );
  fprintf ( 1, '  weight W(ALPHA,BETA;X) = product ( 1 <= I <= N )\n' );
  fprintf ( 1, '    (1-X(I))^ALPHA (1+X(I))^BETA\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use the formulas to integrate various monomials of\n' );
  fprintf ( 1, '  the form X(1)^E(1) * X(2)^E(2) * ... X(N)^E(N)\n' );
  fprintf ( 1, '  and compare to the exact integral.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The precision of each formula is known, and we only use\n' );
  fprintf ( 1, '  a formula if its precision indicates it should be able to\n' );
  fprintf ( 1, '  produce an exact result.\n' );

  for n = 1 : 6

    for test = 1 : test_num

      alpha = alpha_test(test);
      beta  = beta_test(test);

      expon(1:n) = 0;
      cn_jac_test ( n, alpha, beta, expon );

    end

    for test = 1 : test_num

      alpha = alpha_test(test);
      beta  = beta_test(test);

      expon(1:n) = 0;
      expon(n) = 1;
      cn_jac_test ( n, alpha, beta, expon );

    end

    if ( 2 <= n )

      for test = 1 : test_num

        alpha = alpha_test(test);
        beta  = beta_test(test);

        expon(1:n) = 0;
        expon(1) = 1;
        expon(2) = 1;
        cn_jac_test ( n, alpha, beta, expon );

      end

    end

    for test = 1 : test_num

      alpha = alpha_test(test);
      beta  = beta_test(test);

      expon(1:n) = 0;
      expon(1) = 2;
      cn_jac_test ( n, alpha, beta, expon );

    end

  end

  return
end
