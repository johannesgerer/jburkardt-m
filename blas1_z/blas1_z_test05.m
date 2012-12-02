function blas1_z_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests ZABS2.
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
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  ZABS2 returns the L2 norm of a complex number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Real      Imaginary\n' );
  fprintf ( 1, '      Part      Part           ZABS2(Z)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ c, seed ] = c8_uniform_01 ( seed );
    c = 5.0 * c;
    c_norm = zabs2 ( c );

    fprintf ( 1, '  %10f  %10f     %10f\n', real ( c ), imag ( c ), c_norm );

  end

  return
end
