function c8lib_test0061 ( )

%*****************************************************************************80
%
%% TEST0061 tests C8_ARGUMENT.
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
  fprintf ( 1, 'TEST0061\n' );
  fprintf ( 1, '  C8_ARGUMENT computes the argument of a C8.\n' );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '            C1=random            ARG=C8_ARGUMENT(C1)\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
 
    [ c1, seed ] = c8_uniform_01 ( seed );
    argument = c8_argument ( c1 );

    fprintf ( 1, '  %10f  %10f    %10f\n', ...
      real ( c1 ), imag ( c1 ), argument );
 
  end

  return
end
