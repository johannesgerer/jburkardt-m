function l4_uniform_test ( )

%*****************************************************************************80
%
%% L4_UNIFORM_TEST tests L4_UNIFORM.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'L4_UNIFORM_TEST\n' );
  fprintf ( 1, '  L4_UNIFORM computes pseudorandom logical values.\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ value, seed ] = l4_uniform ( seed );
    fprintf ( 1, '  %8d  %d\n', i, value );
  end

  return
end
