function lpp_value_test ( )

%*****************************************************************************80
%
%% LPP_VALUE_TEST tests LPP_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LPP_VALUE_TEST:\n' );
  fprintf ( 1, '  LPP_VALUE evaluates a Legendre product polynomial.\n' );

  m = 3;
  n = 1;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( m, -1.0, +1.0, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Evaluate at X = ( %g, %g, %g )\n', x(1:3) )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank  I1  I2  I3:  L(I1,X1)*L(I2,X2)*L(I3,X3)  P(X1,X2,X3)\n' );
  fprintf ( 1, '\n' );

  for rank = 1 : 20

    l = comp_unrank_grlex ( m, rank );
%
%  Evaluate the LPP directly.
%
    v1 = lpp_value ( m, n, l, x );
%
%  Convert the LPP to a polynomial, and reevaluate.
%
    o_max = prod ( floor ( ( l(1:m) + 2 ) / 2 ) );

    [ o, c, e ] = lpp_to_polynomial ( m, l, o_max );

    v2 = polynomial_value ( m, o, c, e, n, x );
%
%  Compare results.
%
    fprintf ( 1, '  %4d  %2d  %2d  %2d  %12g  %12g\n', rank, l(1:m), v1, v2 );

  end

  return
end
