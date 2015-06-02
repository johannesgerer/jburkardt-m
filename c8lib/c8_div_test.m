function c8_div_test ( )

%*****************************************************************************80
%
%% C8_DIV_TEST tests C8_DIV.
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
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8_DIV_TEST\n' );
  fprintf ( 1, '  C8_DIV computes C3 = C1 / C2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        C1=C8_UNIFORM_01          C2=C8_UNIFORM_01' );
  fprintf ( 1,       '          C3=C8_DIV(C1,C2)          C4=C1/C2\n' );
  fprintf ( 1, '     ---------------------     ---------------------' );
  fprintf ( 1, '     ---------------------     ---------------------\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ c1, seed ] = c8_uniform_01 ( seed );
    [ c2, seed ] = c8_uniform_01 ( seed );
    c3 = c8_div ( c1, c2 );
    c4 = c1 / c2;

    fprintf ( 1, '  %12.4f%12.4f  %12.4f%12.4f  %12.4f%12.4f  %12.4f%12.4f\n', ...
      real ( c1 ), imag ( c1 ), real ( c2 ), imag ( c2 ), ...
      real ( c3 ), imag ( c3 ), real ( c4 ), imag ( c4 ) );

  end

  return
end
