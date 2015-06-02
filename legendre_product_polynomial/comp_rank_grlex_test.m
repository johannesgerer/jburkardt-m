function comp_grank_grlex_test ( )

%*****************************************************************************80
%
%% COMP_RANK_GRLEX_TEST tests COMP_RANK_GRLEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMP_RANK_GRLEX_TEST\n' );
  fprintf ( 1, '  A COMP is a composition of an integer N into K parts.\n' );
  fprintf ( 1, '  Each part is nonnegative.  The order matters.\n' );
  fprintf ( 1, '  COMP_RANK_GRLEX determines the rank of a COMP\n' );
  fprintf ( 1, '  from its parts.\n' );  
  fprintf ( 1, '\n' );
  fprintf ( 1, '        Actual  Inferred\n' );
  fprintf ( 1, '  Test    Rank      Rank\n' );
  fprintf ( 1, '\n' );

  kc = 3;
  rank1 = 20;
  rank2 = 60;
  seed = 123456789;

  for test = 1 : 5
    [ xc, rank3, seed ] = comp_random_grlex ( kc, rank1, rank2, seed );
    rank4 = comp_rank_grlex ( kc, xc );
    fprintf ( 1, '  %4d  %6d  %8d\n', test, rank3, rank4 ); 
  end

  return
end
