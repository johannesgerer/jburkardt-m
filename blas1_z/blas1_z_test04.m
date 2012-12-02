function blas1_z_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests ZABS1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2006
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  ZABS1 returns the L1 norm of a complex number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Real      Imaginary              \n' );
  fprintf ( 1, '      Part      Part           ZABS1(Z)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ c, seed ] = c8_uniform_01 ( seed );
    c = 5.0 * c;
    c_norm = zabs1 ( c );

    fprintf ( 1, '  %10f  %10f     %10f\n', real ( c ), imag ( c ), c_norm );

  end

  return
end
