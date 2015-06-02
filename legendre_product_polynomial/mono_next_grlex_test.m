function monomial_test035 ( )

%*****************************************************************************80
%
%% MONOMIAL_TEST035 tests MONO_NEXT_GRLEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONOMIAL_TEST035\n' );
  fprintf ( 1, '  MONO_NEXT_GRLEX computes the next monomial\n' );
  fprintf ( 1, '  in M variables, in graded lexicographic order.\n' );

  m = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Let M =  %d\n', m );

  a = 0;
  b = 3;
  seed = 123456789;

  for i = 1 : 10

    [ x, seed ] = i4vec_uniform_ab ( m, a, b, seed );

    fprintf ( 1, '\n' );
    for j = 1 : m
      fprintf ( 1, '  %1d', x(j) );
    end
    fprintf ( 1, '\n' );

    for j = 1 : 5
      x = mono_next_grlex ( m, x );
      for j = 1 : m
        fprintf ( 1, '  %1d', x(j) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
