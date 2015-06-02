function perm1_uniform_test ( )

%*****************************************************************************80
%
%% PERM1_UNIFORM_TEST tests PERM1_UNIFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 October 2014
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PERM1_UNIFORM_TEST\n' );
  fprintf ( 1, '  PERM1_UNIFORM randomly selects a permutation of 1, ..., N.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : 5

    [ p, seed ] = perm1_uniform ( n, seed );

    fprintf ( 1, '  ' );
    for i = 1 : n
      fprintf ( 1, '%4d', p(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
