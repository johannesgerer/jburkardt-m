function c8lib_test0062 ( )

%*****************************************************************************80
%
%% TEST0062 tests C8_CUBE_ROOT.
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
  fprintf ( 1, 'TEST0062\n' );
  fprintf ( 1, '  C8_CUBE_ROOT computes the principal cube root of a C8.\n' );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '            C1=random            C2=C8_CUBE_ROOT(C1)         C3=C2*C2*C2\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
 
    [ c1, seed ] = c8_uniform_01 ( seed );
    c2 = c8_cube_root ( c1 );
    c3 = c1 * c1 * c1;

    fprintf ( 1, '  %10f  %10f    %10f  %10f    %10f  %10f\n', ...
      real ( c1 ), imag ( c1 ), ...
      real ( c2 ), imag ( c2 ), ...
      real ( c3 ), imag ( c3 ) );
 
  end

  return
end
