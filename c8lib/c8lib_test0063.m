function c8lib_test0063 ( )

%*****************************************************************************80
%
%% TEST0063 tests C8_MAGNITUDE.
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
  fprintf ( 1, 'TEST0063\n' );
  fprintf ( 1, '  C8_MAGNITUDE computes the magnitude of a C8.\n' );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '            C1=random            MAG=C8_MAGNITUDE(C1)\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
 
    [ c1, seed ] = c8_uniform_01 ( seed );
    magnitude = c8_magnitude ( c1 );

    fprintf ( 1, '  %10f  %10f    %10f\n', ...
      real ( c1 ), imag ( c1 ), magnitude );
 
  end

  return
end
