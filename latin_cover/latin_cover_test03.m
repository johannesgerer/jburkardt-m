function latin_cover_test03 ( )

%*****************************************************************************80
%
%% LATIN_COVER_TEST03 tests LATIN_COVER_3D.
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
  fprintf ( 1, 'LATIN_COVER_TEST03\n' );
  fprintf ( 1, '  LATIN_COVER_3D:\n' );

  for n = 3 : 2 : 9

    seed = 123456789;

    for test = 1 : 3

      p = zeros ( 3, n );

      [ p(1,1:n), seed ] = perm_uniform ( n, seed );
 
      perm_print ( n, p(1,1:n), '  Permutation 1' );

      [ p(2,1:n), seed ] = perm_uniform ( n, seed );
 
      perm_print ( n, p(2,1:n), '  Permutation 2' );

      [ p(3,1:n), seed ] = perm_uniform ( n, seed );
 
      perm_print ( n, p(3,1:n), '  Permutation 3' );

      a = latin_cover_3d ( n, p );

      i4block_print ( n, n, n, a, '  Latin cover' );

    end

  end

  return
end
