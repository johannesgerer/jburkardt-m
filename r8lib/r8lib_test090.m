function r8lib_test090 ( )

%*****************************************************************************80
%
%% TEST090 tests R8POLY_DERIV.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST090\n' );
  fprintf ( 1, '  R8POLY_DERIV computes the coefficients of\n' );
  fprintf ( 1, '    the derivative of a polynomial.\n' );

  x = r8vec_indicator ( n );

  c = roots_to_r8poly ( n, x );

  r8poly_print ( n, c, '  The initial polynomial' );

  for d = 0 : n
    cp = r8poly_deriv ( n, c, d );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The derivative of order %d\n', d );
    fprintf ( 1, '\n' );
    r8poly_print ( n-d, cp, ' ' );
  end

  return
end
