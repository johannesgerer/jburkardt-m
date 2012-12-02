function epn_lag_tests ( )

%*****************************************************************************80
%
%% EPN_LAG_TESTS tests the rules for EPN with Laguerre weight on monomials.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EPN_LAG_TESTS\n' );
  fprintf ( 1, '  Demonstrate the use of quadrature rules for the region\n' );
  fprintf ( 1, '  EPN_LAG, that is, the positive half space [0,+oo)^N, with the\n' );
  fprintf ( 1, '  weight W(X) = product ( 1 <= I <= N ) exp ( -X(I) )\n' );
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
    epn_lag_test ( n, expon );

    expon(1:n) = 0;
    expon(n) = 1;
    epn_lag_test ( n, expon );

    if ( 2 <= n )
      expon(1:n) = 0;
      expon(1) = 1;
      expon(2) = 1;
      epn_lag_test ( n, expon );
    end

    expon(1:n) = 0;
    expon(1) = 2;
    epn_lag_test ( n, expon );

  end

  return
end
