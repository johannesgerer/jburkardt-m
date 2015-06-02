function c8_uniform_01_test ( )

%*****************************************************************************80
%
%% C8_UNIFORM_01_TEST tests C8_UNIFORM_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2015
%
%  Author:
%
%    John Burkardt
%
  seed = 123456678;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8_UNIFORM_01_TEST\n' );
  fprintf ( 1, '  C8_UNIFORM_01 returns a uniformly random "unit" C8.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       C1=C8_UNIFORM_01\n' );
  fprintf ( 1, '     ---------------------\n' );
  fprintf ( 1, '\n' );

  for test = 1 : 10
 
    [ c1, seed ] = c8_uniform_01 ( seed );

    fprintf ( 1, '  (%12f  %12f)\n', real ( c1 ), imag ( c1 ));
 
  end

  return
end
