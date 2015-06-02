function c8_one_test ( )

%*****************************************************************************80
%
%% C8_ONE_TEST tests C8_ONE.
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
  fprintf ( 1, 'C8_ONE_TEST\n' );
  fprintf ( 1, '  C8_ONE returns one as a C8.\n' );
  fprintf ( 1, '\n' );
  c1 = c8_one ( );
  fprintf ( 1, '  C1 = C8_ONE ( ) = (%g,%g)\n', real ( c1 ), imag ( c1 ) );

  c2 = c1 + c1;
  fprintf ( 1, '  C2 = C1 + C1 = (%g,%g)\n', real ( c2 ), imag ( c2 ) );

  return
end
