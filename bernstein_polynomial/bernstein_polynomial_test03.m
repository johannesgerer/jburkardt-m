function bernstein_polynomial_test03 ( )

%*****************************************************************************80
%
%% BERNSTEIN_POLYNOMIAL_TEST03 tests the Partition-of-Unity property.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BERNSTEIN_POLYNOMIAL_TEST03:\n' );
  fprintf ( 1, '  BERNSTEIN_POLY_01 evaluates the Bernstein polynomials\n' );
  fprintf ( 1, '  based on the interval [0,1].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here we test the partition of unity property.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     X          Sum ( 0 <= K <= N ) BP01(N,K)(X)\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for n = 0 : 10

    [ x, seed ] = r8_uniform_01 ( seed );

    bvec = bernstein_poly_01 ( n, x );

    fprintf ( 1, '  %4d  %7.4f  %14.6g\n', n, x, sum ( bvec(1:n+1) ) );

  end

  return
end
