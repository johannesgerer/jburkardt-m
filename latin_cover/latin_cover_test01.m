function latin_cover_test01 ( )

%*****************************************************************************80
%
%% LATIN_COVER_TEST01 tests LATIN_COVER.
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
  fprintf ( 1, 'LATIN_COVER_TEST01\n' );
  fprintf ( 1, '  LATIN_COVER:\n' );

  for n = 3 : 2 : 9

    seed = 123456789;

    for test = 1 : 3

      [ p, seed ] = perm_uniform ( n, seed );
 
      perm_print ( n, p, '  Permutation' );

      a = latin_cover ( n, p );

      i4mat_print ( n, n, a, '  Latin cover' );

    end

  end

  return
end
