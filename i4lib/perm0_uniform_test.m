function perm0_uniform_test ( )

%*****************************************************************************80
%
%% PERM0_UNIFORM_TEST tests PERM0_UNIFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2015
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PERM0_UNIFORM_TEST\n' );
  fprintf ( 1, '  PERM0_UNIFORM randomly selects a permutation of 0, ..., N-1.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : 5

    [ p, seed ] = perm0_uniform ( n, seed );

    fprintf ( 1, '  ' );
    for i = 1 : n
      fprintf ( 1, '%4d', p(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
