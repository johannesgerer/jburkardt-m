function stroud_test2075 ( )

%*****************************************************************************80
%
%% STROUD_TEST2075 tests the rules for EPN with GLG weight on monomials.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2010
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;

  alpha_test = [ - 0.5, 0.0, 0.5, 1.0, 2.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'STROUD_TEST2075\n' );
  fprintf ( 1, '  Demonstrate the use of quadrature rules for the region\n' );
  fprintf ( 1, '  EPN_GLG, that is, the positive half space [0,+oo)^N, with the\n' );
  fprintf ( 1, '  weight W(ALPHA;X) = product ( 1 <= I <= N ) X(I)^ALPHA exp ( -X(I) )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use the formulas to integrate various monomials of\n' );
  fprintf ( 1, '  the form X(1)^E(1) * X(2)^E(2) * ... X(N)^E(N)\n' );
  fprintf ( 1, '  and compare to the exact integral.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The precision of each formula is known, and we only use\n' );
  fprintf ( 1, '  a formula if its precision indicates it should be able to\n' );
  fprintf ( 1, '  produce an exact result.\n' );

  for n = 1 : 6

    expon = zeros ( n, 1 );
    for test = 1 : test_num
      alpha = alpha_test(test);
      epn_glg_test ( n, expon, alpha );
    end

    expon = zeros ( n, 1 );
    expon(n) = 1;
    for test = 1 : test_num
      alpha = alpha_test(test);
      epn_glg_test ( n, expon, alpha );
    end

    if ( 2 <= n )
      expon = zeros ( n, 1 );
      expon(1) = 1;
      expon(2) = 1;
      for test = 1 : test_num
        alpha = alpha_test(test);
        epn_glg_test ( n, expon, alpha );
      end
    end

    expon = zeros ( n, 1 );
    expon(1) = 2;
    for test = 1 : test_num
      alpha = alpha_test(test);
      epn_glg_test ( n, expon, alpha );
    end

  end

  return
end
