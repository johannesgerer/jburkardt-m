function c4_normal_01_test ( )

%*****************************************************************************80
%
%% C4_NORMAL_01_TEST tests C4_NORMAL_01.
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
  fprintf ( 1, 'C4_NORMAL_01_TEST\n' );
  fprintf ( 1, '  C4_NORMAL_01 computes pseudorandom complex values\n' );
  fprintf ( 1, '  normally distributed in the unit circle.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ r, seed ] = c4_normal_01 ( seed );
    fprintf ( 1, '  %6d  (%14f,  %14f)\n', i, real ( r ), imag ( r ) );
  end

  return
end
