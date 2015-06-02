function divdif_test08 ( )

%*****************************************************************************80
%
%% DIVDIF_TEST08 tests R8POLY_SHIFT.
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
  n = 3;

  scale = 2.0;
  shift = +3.0;
  poly_cof(1:3) = [ +6.0, -1.0, 2.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIVDIF_TEST08\n' );
  fprintf ( 1, '  R8POLY_SHIFT shifts polynomial coefficients.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Polynomial coefficients for argument X\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %3d  %14f\n', i, poly_cof(i) );
  end

  poly_cof = r8poly_shift ( scale, shift, n, poly_cof );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SCALE = %f\n', scale );
  fprintf ( 1, '  SHIFT = %f\n', shift );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Polynomial coefficients for argument\n' );
  fprintf ( 1, '    Z = SCALE * X + SHIFT\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %3d  %14f\n', i, poly_cof(i) );
  end

  return
end
