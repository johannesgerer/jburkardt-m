function combo_test34 ( )

%*****************************************************************************80
%
%% COMBO_TEST34 tests RGF_ENUM, RGF_RANK, RGF_SUCCESSOR, RGF_UNRANK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
%
%  Author:
%
%    John Burkardt
%
  m = 4;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST34\n' );
  fprintf ( 1, '  Restricted growth functions:\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  RGF_ENUM enumerates,\n' );
  fprintf ( 1, '  RGF_RANK ranks,\n' );
  fprintf ( 1, '  RGF_SUCCESSOR lists;\n' );
  fprintf ( 1, '  RGF_UNRANK unranks.\n' );
%
%  Enumerate.
%
  nrgf = rgf_enum ( m );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  For M = %d\n', m );
  fprintf ( 1, '  the number of RGF''s is %d\n', nrgf );
  fprintf ( 1, ' \n' );
%
%  List.
%
  f = [];
  rank = -1;

  while ( 1 )

    rank_old = rank;

    [ f, rank ] = rgf_successor ( m, f, rank );

    if ( rank <= rank_old )
      break
    end

    fprintf ( 1, '  %4d  ', rank );
    for i = 1 : m
      fprintf ( 1, '%5d', f(i) );
    end
    fprintf ( 1, '\n' );

  end
%
%  Unrank.
%
  rank = floor ( nrgf / 2 );

  f = rgf_unrank ( rank, m );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The element of rank %d:\n', rank );
  fprintf ( 1, ' \n' );
  i4vec_print ( m, f, '  The element' );
%
%  Rank.
%
  rank = rgf_rank ( m, f );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The rank of the element is computed as %d:\n', rank );

  return
end
