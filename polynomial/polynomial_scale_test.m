function polynomial_scale_test ( )

%*****************************************************************************80
%
%% POLYNOMIAL_SCALE_TEST tests POLYNOMIAL_ScALE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYNOMIAL_SCALE_TEST\n' );
  fprintf ( 1, '  POLYNOMIAL_SCALE scales a polynomial by a multiplier S.\n' );

  m = 3;
  o = 6;
  c = [ 7.0, - 5.0, 9.0, 11.0, 0.0, - 13.0 ];
  e = [ 1, 2, 4, 5, 12, 33 ];

  fprintf ( 1, '\n' );
  title = '  P(X) = ';
  polynomial_print ( m, o, c, e, title );

  s = - 0.5;
  fprintf ( 1, '\n' );
  fprintf ( '  Apply scale factor S = %g\n', s );
  [ o, c, e ] = polynomial_scale ( s, m, o, c, e );

  fprintf ( 1, '\n' );
  title = '  S * P(X) = ';
  polynomial_print ( m, o, c, e, title );

  return
end

