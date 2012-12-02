function c8lib_test0065 ( )

%*****************************************************************************80
%
%% TEST0065 tests C8_SQRT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 10;
  seed = 123456678;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0065\n' );
  fprintf ( 1, '  C8_SQRT computes the principal square root of a C8.\n' );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '            C1=random            C2=C8_SQRT(C1)         C3=C2*C2\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
 
    [ c1, seed ] = c8_uniform_01 ( seed );
    c2 = c8_sqrt ( c1 );
    c3 = c1 * c1;

    fprintf ( 1, '  %10f  %10f    %10f  %10f    %10f  %10f\n', ...
      real ( c1 ), imag ( c1 ), ...
      real ( c2 ), imag ( c2 ), ...
      real ( c3 ), imag ( c3 ) );
 
  end

  return
end
