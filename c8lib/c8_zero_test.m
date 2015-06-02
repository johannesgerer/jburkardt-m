function c8_zero_test ( )

%*****************************************************************************80
%
%% C8_ZERO_TEST tests C8_ZERO.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2015
%
%  Author:
%
%    John Burkardt
%
  seed = 123456678;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8_ZERO_TEST\n' );
  fprintf ( 1, '  C8_ZERO returns zero as a C8\n' );
  fprintf ( 1, '\n' );
  c1 = c8_zero ( );
  fprintf ( 1, '  C1 = C8_ZERO ( ) = (%g,%g)\n', real ( c1 ), imag ( c1 ) );

  return
end
