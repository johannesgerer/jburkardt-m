function c8lib_test0064 ( )

%*****************************************************************************80
%
%% TEST0064 tests C8_NORMAL_01.
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
  seed = 123456789;
  test_num = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0064\n' );
  fprintf ( 1, '  C8_NORMAL_01 generates unit pseudonormal\n' );
  fprintf ( 1,'    complex values.\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    [ x, seed ] = c8_normal_01 ( seed );
    fprintf ( 1, '  %12f  %12f\n', real ( x ), imag ( x ) );

  end

  return
end
