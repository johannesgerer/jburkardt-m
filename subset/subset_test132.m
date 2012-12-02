function subset_test132 ( )

%*****************************************************************************80
%
%% TEST132 tests R8POLY_FVAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST132\n' );
  fprintf ( 1, '  R8POLY_FVAL evaluates a polynomial in factorial form.\n' );

  a = r8vec_indicator ( n );
 
  r8vec_print ( n, a, '  The factorial polynomial coefficients:' );

  x = 2.0;

  val = r8poly_fval ( n, a, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8POLY(%f) = %f\n', x, val );
  fprintf ( 1, '  The correct value is 11.\n' );
 
  return
end
