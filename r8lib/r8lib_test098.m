function r8lib_test098 ( )

%*****************************************************************************80
%
%% R8LIB_TEST098 tests R8POLY_VALUE_HORNER.
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

  p = [ 24.0, -50.0, +35.0, -10.0, 1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST098\n' );
  fprintf ( 1, '  R8POLY_VALUE_HORNER evaluates a polynomial at a\n' );
  fprintf ( 1, '  point, using Horner''s method.\n' );

  r8poly_print ( n, p, '  The polynomial:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '        X            P(X)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 15
    x = i / 3.0;
    pval = r8poly_value_horner ( n, p, x );
    fprintf ( 1, '  %10f  %10f\n', x, pval );
  end

  return
end
