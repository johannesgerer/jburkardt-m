function c8_arg_test ( )

%*****************************************************************************80
%
%% C8_ARG_TEST tests C8_ARG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2013
%
%  Author:
%
%    John Burkardt
%
  test_num = 10;
  seed = 123456678;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8_ARG_TEST\n' );
  fprintf ( 1, '  C8_ARG computes the argument of a C8.\n' );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '            C1=random            ARG=C8_ARG(C1)\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
 
    [ c1, seed ] = c8_uniform_01 ( seed );
    argument = c8_arg ( c1 );

    fprintf ( 1, '  %10f  %10f    %10f\n', ...
      real ( c1 ), imag ( c1 ), argument );
 
  end

  return
end
