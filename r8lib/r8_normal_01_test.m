function r8_normal_01_test ( )

%*****************************************************************************80
%
%% R8_NORMAL_01_TEST tests R8_NORMAL_01.
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
  fprintf ( 1, 'R8_NORMAL_01_TEST\n' );
  fprintf ( 1, '  R8_NORMAL_01 generates normally distributed\n' );
  fprintf ( 1, '  random values.\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    [ x, seed ] = r8_normal_01 ( seed );
    fprintf ( 1, '  %f\n', x );

  end

  return
end
