function stroud_test163 ( )

%*****************************************************************************80
%
%% STROUD_TEST163 tests the rules for CN with Gegenbauer weight on monomials.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2010
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;

  alpha_test = [ -0.5, 0.0, 0.5, 1.0, 1.5 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'STROUD_TEST163\n' );
  fprintf ( 1, '  Demonstrate the use of quadrature rules for the region\n' );
  fprintf ( 1, '  CN_GEG, that is, the hypercube [-1,+1]^N, with the\n' );
  fprintf ( 1, '  weight W(ALPHA;X) = product ( 1 <= I <= N )\n' );
  fprintf ( 1, '    (1-X(I)^2)^ALPHA\n' );
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

      expon(1:n) = 0;
      cn_geg_test ( n, alpha, expon );

    end

    for test = 1 : test_num

      alpha = alpha_test(test);

      expon(1:n) = 0;
      expon(n) = 1;
      cn_geg_test ( n, alpha, expon );

    end

    if ( 2 <= n )

      for test = 1 : test_num

        alpha = alpha_test(test);

        expon(1:n) = 0;
        expon(1) = 1;
        expon(2) = 1;
        cn_geg_test ( n, alpha, expon );

      end

    end

    for test = 1 : test_num

      alpha = alpha_test(test);

      expon(1:n) = 0;
      expon(1) = 2;
      cn_geg_test ( n, alpha, expon );

    end

  end

  return
end
