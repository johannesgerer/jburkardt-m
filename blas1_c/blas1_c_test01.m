function blas1_c_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests CABS1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2006
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  CABS1 returns the L1 norm of a complex number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Real      Imaginary              \n' );
  fprintf ( 1, '      Part      Part           CABS1(Z)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ c, seed ] = c4_uniform_01 ( seed );
    c = 5.0 * c;
    c_norm = cabs1 ( c );

    fprintf ( 1, '  %10f  %10f     %10f\n', real ( c ), imag ( c ), c_norm );

  end

  return
end
