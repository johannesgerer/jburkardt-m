function normal_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests C8_NORMAL_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 July 2006
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  C8_NORMAL_01 computes pseudorandom complex values\n' );
  fprintf ( 1, '  normally distributed in the unit circle.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ x, seed ] = c8_normal_01 ( seed );
    fprintf ( 1, '  %6d  (%14f,  %14f)\n', i, real ( x ), imag ( x ) );
  end

  return
end
