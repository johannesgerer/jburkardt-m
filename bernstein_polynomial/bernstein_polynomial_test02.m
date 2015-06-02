function bernstein_polynomial_test02 ( )

%*****************************************************************************80
%
%% BERNSTEIN_POLYNOMIAL_TEST02 tests BERNSTEIN_POLY_AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 July 2011
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BERNSTEIN_POLYNOMIAL_TEST02\n' );
  fprintf ( 1, '  BERNSTEIN_POLY_AB evaluates Bernstein polynomials over an\n' );
  fprintf ( 1, '  arbitrary interval [A,B].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, we demonstrate that \n' );
  fprintf ( 1, '    BPAB(N,K,A1,B1)(X1) = BPAB(N,K,A2,B2)(X2)\n' );
  fprintf ( 1, '  provided only that\n' );
  fprintf ( 1, '    (X1-A1)/(B1-A1) = (X2-A2)/(B2-A2).\n' );

  x = 0.3;
  a = 0.0;
  b = 1.0;
  bern = bernstein_poly_ab ( n, a, b, x );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     K     A        B        X       BPAB(N,K,A,B)(X)\n' );
  fprintf ( 1, '\n' );
  for k = 0 : n
    fprintf ( 1, '  %4d  %4d  %7.4f  %7.4f  %7.4f  %14.6g\n', n, k, a, b, x, bern(k+1) );
  end
 
  x = 1.3;
  a = 1.0;
  b = 2.0;
  bern = bernstein_poly_ab ( n, a, b, x );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     K     A        B        X       BPAB(N,K,A,B)(X)\n' );
  fprintf ( 1, '\n' );
  for k = 0 : n
    fprintf ( 1, '  %4d  %4d  %7.4f  %7.4f  %7.4f  %14.6g\n', n, k, a, b, x, bern(k+1) );
  end

  x = 2.6;
  a = 2.0;
  b = 4.0;
  bern = bernstein_poly_ab ( n, a, b, x );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     K     A        B        X       BPAB(N,K,A,B)(X)\n' );
  fprintf ( 1, '\n' );
  for k = 0 : n
    fprintf ( 1, '  %4d  %4d  %7.4f  %7.4f  %7.4f  %14.6g\n', n, k, a, b, x, bern(k+1) );
  end

  return
end
