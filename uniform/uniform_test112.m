function uniform_test112 ( )

%*****************************************************************************80
%
%% TEST112 tests LVEC_UNIFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 March 2008
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  seed_init = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST112\n' );
  fprintf ( 1, '  LVEC_UNIFORM_01 computes a vector of\n' );
  fprintf ( 1, '  pseudorandom logical values.\n' );

  seed = seed_init;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed_init );

  [ lvec, seed ] = lvec_uniform ( n, seed );

  fprintf ( 1, '\n' );

  for i = 1 : 10
    fprintf ( 1, '  %8d  %d\n', i, lvec(i) );
  end

  return
end
