function r8_uniform_ab_test ( )

%*****************************************************************************80
%
%% R8_UNIFORM_AB_TEST tests R8_UNIFORM_AB.
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
  a = 10.0;
  b = 20.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_UNIFORM_AB_TEST\n' );
  fprintf ( 1, '  R8_UNIFORM_AB returns random values in a given range:\n' );
  fprintf ( 1, '  [ A, B ]\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For this problem:\n' );
  fprintf ( 1, '  A = %f\n', a );
  fprintf ( 1, '  B = %f\n', b );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : 10
    [ r, seed ] = r8_uniform_ab ( a, b, seed );
    fprintf ( 1, '  %f\n', r );
  end

  return
end
