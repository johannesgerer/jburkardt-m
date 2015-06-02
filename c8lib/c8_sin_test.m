function c8_sin_test ( )

%*****************************************************************************80
%
%% C8_SIN_TEST tests C8_SIN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2015
%
%  Author:
%
%    John Burkardt
%
  seed = 123456678;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8_SIN_TEST\n' );
  fprintf ( 1, '  C8_SIN computes the sine of a C8.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '       C1=C8_UNIFORM_01          C2 = C8_SIN(C1)           C3 = C8_ASIN(C1)\n' );
  fprintf ( 1, '     ---------------------     ---------------------     ---------------------\n' );
  fprintf ( 1, '\n' );

  for test = 1 : 10
 
    [ c1, seed ] = c8_uniform_01 ( seed );
    c2 = c8_sin ( c1 );
    c3 = c8_asin ( c2);

    fprintf ( 1, '  (%12f  %12f)  (%12f  %12f)  (%12f  %12f)\n', ...
      real ( c1 ), imag ( c1 ), real ( c2 ), imag ( c2 ), real ( c3 ), imag ( c3 ) );
 
  end

  return
end
