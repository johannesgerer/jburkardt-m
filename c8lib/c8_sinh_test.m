function c8_sinh_test ( )

%*****************************************************************************80
%
%% C8_SINH_TEST tests C8_SINH.
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
  fprintf ( 1, 'C8_SINH_TEST\n' );
  fprintf ( 1, '  C8_SINH computes the hyperbolic sine of a C8.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '       C1=C8_UNIFORM_01          C2 = C8_SINH(C1)           C3 = C8_ASINH(C1)\n' );
  fprintf ( 1, '     ---------------------     ---------------------     ---------------------\n' );
  fprintf ( 1, '\n' );

  for test = 1 : 10
 
    [ c1, seed ] = c8_uniform_01 ( seed );
    c2 = c8_sinh ( c1 );
    c3 = c8_asinh ( c2);

    fprintf ( 1, '  (%12f  %12f)  (%12f  %12f)  (%12f  %12f)\n', ...
      real ( c1 ), imag ( c1 ), real ( c2 ), imag ( c2 ), real ( c3 ), imag ( c3 ) );
 
  end

  return
end
