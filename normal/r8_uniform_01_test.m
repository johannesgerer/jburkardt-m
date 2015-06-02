function r8_uniform_01_test ( )

%*****************************************************************************80
%
%% R8_UNIFORM_01_TEST tests R8_UNIFORM_01.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_UNIFORM_01_TEST\n' );
  fprintf ( 1, '  R8_UNIFORM_01 produces a sequence of random values.\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SEED = %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ r, seed ] = r8_uniform_01 ( seed );
    fprintf ( 1, '  %2d  %14f\n', i, r );
  end

  return
end
