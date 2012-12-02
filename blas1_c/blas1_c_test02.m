function blas1_c_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests CABS2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2006
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  CABS2 returns the L2 norm of a complex number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Real      Imaginary\n' );
  fprintf ( 1, '      Part      Part           CABS2(Z)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ c, seed ] = c4_uniform_01 ( seed );
    c = 5.0 * c;
    c_norm = cabs2 ( c );

    fprintf ( 1, '  %10f  %10f     %10f\n', real ( c ), imag ( c ), c_norm );

  end

  return
end
