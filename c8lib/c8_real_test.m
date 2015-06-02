function c8_real_test ( )

%*****************************************************************************80
%
%% C8_REAL_TEST tests C8_REAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2015
%
%  Author:
%
%    John Burkardt
%
  seed = 123456678;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8_REAL_TEST\n' );
  fprintf ( 1, '  C8_REAL computes the real part of a C8.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '       C1=C8_UNIFORM_01         R2=C8_REAL(C1)             R3=REAL(C1))\n' );
  fprintf ( 1, '     ---------------------     ---------------------     ---------------------\n' );
  fprintf ( 1, '\n' );

  for test = 1 : 10
 
    [ c1, seed ] = c8_uniform_01 ( seed );
    r2 = c8_real ( c1 );
    r3 = real ( c1 );

    fprintf ( 1, '  (%12f  %12f)  %12f  %12f\n', ...
      real ( c1 ), imag ( c1 ), r2, r3 );
 
  end

  return
end
