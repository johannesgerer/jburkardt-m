function c8_div_r8_test ( )

%*****************************************************************************80
%
%% C8_DIV_R8_TEST tests C8_DIV_R8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 February 2015
%
%  Author:
%
%    John Burkardt
%
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8_DIV_R8_TEST\n' );
  fprintf ( 1, '  C8_DIV_R8 computes C3 = C1 / R2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        C1=C8_UNIFORM_01          R2=R8_UNIFORM_01' );
  fprintf ( 1,       '          C3=C8_DIV_R8(C1,R2)          C4=C1/R2\n' );
  fprintf ( 1, '     ---------------------     ---------------------' );
  fprintf ( 1, '     ---------------------     ---------------------\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ c1, seed ] = c8_uniform_01 ( seed );
    r2 = r8_uniform_01 ( seed );
    c3 = c8_div_r8 ( c1, r2 );
    c4 = c1 / r2;

    fprintf ( 1, '  %12.4f%12.4f  %12.4f              %12.4f%12.4f  %12.4f%12.4f\n', ...
      real ( c1 ), imag ( c1 ), r2, ...
      real ( c3 ), imag ( c3 ), real ( c4 ), imag ( c4 ) );

  end

  return
end
