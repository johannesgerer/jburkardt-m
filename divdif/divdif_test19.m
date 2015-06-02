function divdif_test19 ( )

%*****************************************************************************80
%
%% DIVDIF_TEST19 tests ROOTS_TO_R8POLY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIVDIF_TEST19\n' );
  fprintf ( 1, '  ROOTS_TO_R8POLY computes polynomial coefficients\n' );
  fprintf ( 1, '  from roots.\n' );
  fprintf ( 1, '\n' );

  nroots = 1;
  roots(1) = 3.0;
  r8vec_print ( nroots, roots, '  The roots:' );

  [ nc, c ] = roots_to_r8poly ( nroots, roots );

  r8poly_print ( nc, c, '  The polynomial:' );

  nroots = 2;
  roots(1:2) = [ 3.0, 1.0 ];
  r8vec_print ( nroots, roots, '  The roots:' );

  [ nc, c ] = roots_to_r8poly ( nroots, roots );

  r8poly_print ( nc, c, '  The polynomial:' );

  nroots = 3;
  roots(1:3) = [ 3.0, 1.0, 2.0 ];
  r8vec_print ( nroots, roots, '  The roots:' );

  [ nc, c ] = roots_to_r8poly ( nroots, roots );

  r8poly_print ( nc, c, '  The polynomial:' );

  nroots = 4;
  roots(1:4) = [ 3.0, 1.0, 2.0, 4.0 ];
  r8vec_print ( nroots, roots, '  The roots:' );

  [ nc, c ] = roots_to_r8poly ( nroots, roots );

  r8poly_print ( nc, c, '  The polynomial:' );

  return
end
