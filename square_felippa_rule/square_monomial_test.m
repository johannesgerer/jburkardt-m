function square_monomial_test ( degree_max )

%*****************************************************************************80
%
%% SQUARE_MONOMIAL_TEST tests SQUARE_MONOMIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DEGREE_MAX, the maximum total degree of the
%    monomials to check.
%
  a = [ -1.0, -1.0 ];
  b = [ +1.0, +1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SQUARE_MONOMIAL_TEST\n' );
  fprintf ( 1, '  For the unit quadrilateral,\n' );
  fprintf ( 1, '  SQUARE_MONOMIAL returns the exact value of the\n' );
  fprintf ( 1, '  integral of X^ALPHA Y^BETA\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Volume = %f\n', square_volume ( a, b ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     ALPHA      BETA      INTEGRAL\n' );
  fprintf ( 1, '\n' );

  for alpha = 0 : degree_max
    expon(1) = alpha;
    for beta = 0 : degree_max - alpha
      expon(2) = beta;
      value = square_monomial ( a, b, expon );
      fprintf ( 1, '  %8d  %8d  %14.6e\n', expon(1:2), value );
    end
  end

  return
end
