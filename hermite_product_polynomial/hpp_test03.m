function hpp_test03 ( )

%*****************************************************************************80
%
%% HPP_TEST03 tests HEPP_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HPP_TEST03:\n' );
  fprintf ( 1, '  HePP_VALUE evaluates a Hermite product polynomial.\n' );
  fprintf ( 1, '  POLYNOMIAL_VALUE evaluates a polynomial.\n' );

  m = 3;
  n = 1;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( m, -1.0, +1.0, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Evaluate at X = ( %g, %g, %g )\n', x(1:3) )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank  I1  I2  I3:  He(I1,X1)*He(I2,X2)*He(I3,X3)  P(X1,X2,X3)\n' );
  fprintf ( 1, '\n' );

  for rank = 1 : 20

    l = comp_unrank_grlex ( m, rank );
%
%  Evaluate the HePP directly.
%
    v1 = hepp_value ( m, n, l, x );
%
%  Convert the HePP to a polynomial, and reevaluate.
%
    o_max = prod ( floor ( ( l(1:m) + 2 ) / 2 ) );

    [ o, c, e ] = hepp_to_polynomial ( m, l, o_max );

    v2 = polynomial_value ( m, o, c, e, n, x );
%
%  Compare results.
%
    fprintf ( 1, '  %4d  %2d  %2d  %2d  %12g  %12g\n', rank, l(1:m), v1, v2 );

  end

  return
end
