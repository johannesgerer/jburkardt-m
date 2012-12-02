function cn_leg_tests ( )

%*****************************************************************************80
%
%% CN_LEG_TESTS tests the rules for CN with Legendre weight on monomials.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CN_LEG_TESTS\n' );
  fprintf ( 1, '  Demonstrate the use of quadrature rules for the region\n' );
  fprintf ( 1, '  CN_LEG, that is, the hypercube [-1,+1]^N, with the\n' );
  fprintf ( 1, '  Legendre weight W(X) = 1\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use the formulas to integrate various monomials of\n' );
  fprintf ( 1, '  the form X(1)^E(1) * X(2)^E(2) * ... X(N)^E(N)\n' );
  fprintf ( 1, '  and compare to the exact integral.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The precision of each formula is known, and we only use\n' );
  fprintf ( 1, '  a formula if its precision indicates it should be able to\n' );
  fprintf ( 1, '  produce an exact result.\n' );

  for n = 1 : 6

    expon(1:n) = 0;
    cn_leg_test ( n, expon );

    expon(1:n) = 0;
    expon(n) = 1;
    cn_leg_test ( n, expon );

    if ( 2 <= n )
      expon(1:n) = 0;
      expon(1) = 1;
      expon(2) = 1;
      cn_leg_test ( n, expon );
    end

    expon(1:n) = 0;
    expon(1) = 2;
    cn_leg_test ( n, expon );

    expon(1:n) = 0;
    expon(n) = 3;
    cn_leg_test ( n, expon );

    expon(1:n) = 0;
    expon(n) = 4;
    cn_leg_test ( n, expon );

    if ( 2 <= n )
      expon(1:n) = 0;
      expon(1) = 2;
      expon(n) = 3;
      cn_leg_test ( n, expon );
    end

  end

  return
end
