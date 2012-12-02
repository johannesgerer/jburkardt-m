function subset_test0321 ( )

%*****************************************************************************80
%
%% TEST0321 tests GRAY_RANK2, GRAY_UNRANK2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0321\n' );
  fprintf ( 1, '  GRAY_RANK2 ranks a Gray code;\n' );
  fprintf ( 1, '  GRAY_UNRANK2 unranks a Gray code.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    R  =                         RANK\n' );
  fprintf ( 1, '    G  =            GRAY_UNRANK2(RANK)\n' );
  fprintf ( 1, '    R2 = GRAY_RANK2(GRAY_UNRANK2(RANK))\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       R       G       R2\n' );
  fprintf ( 1, '\n' );

  for rank = 0 : 24
    gray = gray_unrank2 ( rank );
    rank2 = gray_rank2 ( gray );
    fprintf ( 1, '  %6d  %6d  %6d\n', rank, gray, rank2 );
  end

  return
end
