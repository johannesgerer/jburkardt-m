function r8lib_test003 ( )

%*****************************************************************************80
%
%% TEST003 tests R8_CAS.
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
  test_num = 12;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST003\n' );
  fprintf ( 1, '  R8_CAS evaluates the casine of a number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '	X	   R8_CAS ( X )\n' );
  fprintf ( 1, '\n' );
  for test = 0 : test_num
    x = pi * test / test_num;
    fprintf ( 1, '  %14f  %14f\n', x, r8_cas ( x ) );
  end

  return
end
