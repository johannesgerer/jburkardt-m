function latin_cover_test02 ( )

%*****************************************************************************80
%
%% LATIN_COVER_TEST02 tests LATIN_COVER_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_COVER_TEST02\n' );
  fprintf ( 1, '  LATIN_COVER_2D:\n' );

  for n = 3 : 2 : 9

    seed = 123456789;

    for test = 1 : 3

      p = zeros ( 2, n );

      [ p(1,1:n), seed ] = perm_uniform ( n, seed );
 
      perm_print ( n, p(1,1:n), '  Permutation 1' );

      [ p(2,1:n), seed ] = perm_uniform ( n, seed );
 
      perm_print ( n, p(2,1:n), '  Permutation 2' );

      a = latin_cover_2d ( n, p);

      i4mat_print ( n, n, a, '  Latin cover' );

    end

  end

  return
end
