function stroud_test207 ( )

%*****************************************************************************80
%
%% STROUD_TEST207 tests the Stroud EN_R2 rules on monomials.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STROUD_TEST207\n' );
  fprintf ( 1, '  Demonstrate the use of Stroud rules for the region\n' );
  fprintf ( 1, '  EN_R2, that is, all of N-dimensional space, with the\n' );
  fprintf ( 1, '  weight function W(X) = exp ( - X1^2 - X2^2 ... -XN^2 )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use the formulas to integrate various monomials of\n' );
  fprintf ( 1, '  the form X1^ALPHA1 * X2^ALPHA2 * ... XN^ALPHAN\n' );
  fprintf ( 1, '  and compare to the exact integral.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The precision of each formula is known, and we only use\n' );
  fprintf ( 1, '  a formula if its precision indicates it should be able to\n' );
  fprintf ( 1, '  produce an exact result.\n' );

  for n = 1 : 7

    alpha = zeros ( n, 1 );
    en_r2_test ( n, alpha );

    alpha = zeros ( n, 1 );
    alpha(1) = 2;
    en_r2_test ( n, alpha );

    alpha = zeros ( n, 1 );
    alpha(2) = 4;
    en_r2_test ( n, alpha );

    alpha = zeros ( n, 1 );
    i = mod ( 3 - 1, n ) + 1;
    alpha(i) = 6;
    en_r2_test ( n, alpha );

    alpha = zeros ( n, 1 );
    alpha(1) = 2;
    alpha(2) = 4;
    en_r2_test ( n, alpha );

    alpha = zeros ( n, 1 );
    i = mod ( 4 - 1, n ) + 1;
    alpha(i) = 8;
    en_r2_test ( n, alpha );

    alpha = zeros ( n, 1 );
    i = mod ( 5 - 1, n ) + 1;
    alpha(i) = 10;
    en_r2_test ( n, alpha );

    alpha = 1 : n;
    en_r2_test ( n, alpha );

    alpha(1:n) = 2;
    en_r2_test ( n, alpha );

  end

  return
end
