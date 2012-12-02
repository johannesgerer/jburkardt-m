function uniform_test111 ( )

%*****************************************************************************80
%
%% TEST111 tests L_UNIFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2008
%
%  Author:
%
%    John Burkardt
%
  seed_init = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST111\n' );
  fprintf ( 1, '  L_UNIFORM computes pseudorandom logical values.\n' );

  seed = seed_init;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed_init );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ value, seed ] = l_uniform ( seed );
    fprintf ( 1, '  %8d  %d\n', i, value );
  end

  return
end
