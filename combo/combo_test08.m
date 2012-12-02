function combo_test08 ( )

%*****************************************************************************80
%
%% COMBO_TEST08 tests GRAY_CODE_*.
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
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBO_TEST08\n' );
  fprintf ( 1, '  Gray codes:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  GRAY_CODE_ENUM enumerates,\n' );
  fprintf ( 1, '  GRAY_CODE_RANK ranks,\n' );
  fprintf ( 1, '  GRAY_CODE_SUCCESSOR lists,\n' );
  fprintf ( 1, '  GRAY_CODE_UNRANK unranks.\n' );
%
%  Enumerate.
%
  ngray = gray_code_enum ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  For N = %d\n', n );
  fprintf ( 1, '  the number of Gray code elements is %d\n', ngray );
  fprintf ( 1, '\n' );
%
%  List
%
  t = [];
  rank = -1;

  while ( 1 );

    rank_old = rank;

    [ t, rank ] = gray_code_successor ( n, t, rank );

    if ( rank <= rank_old )
      break
    end

    fprintf ( 1, '    %4d:  ', rank );
    for i = 1 : n
      fprintf ( 1, '  %2d', t(i) );
    end
    fprintf ( 1, '\n' );

  end
%
%  Unrank.
%
  rank = floor ( ngray / 2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Seek the element of rank %d\n', rank );

  t = gray_code_unrank ( rank, n );

  i4vec_print ( n, t, '  The item of the given rank' );
%
%  Rank.
%
  rank = gray_code_rank ( n, t );

  i4vec_print ( n, t, '  Element to be ranked:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed rank: %d\n', rank );

  return
end
