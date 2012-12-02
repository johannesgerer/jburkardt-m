function combo_test16 ( )

%*****************************************************************************80
%
%% COMBO_TEST16 tests MARRIAGE.
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
%
%  PREFER(M,W) is the index of women W on man M's list.
%
  prefer = [ ...
    2, 1, 2, 1, 5; ...
    5, 2, 3, 3, 3; ...
    1, 3, 5, 2, 2; ...
    3, 4, 4, 4, 1; ...
    4, 5, 1, 5, 4 ]';
%
%  RANK(W,M) is the index of man M on woman W's list.
%
  rank = [ ...
    2, 4, 1, 4, 5; ...
    4, 3, 3, 2, 2; ...
    5, 5, 4, 1, 3; ...
    3, 1, 2, 3, 1; ...
    1, 2, 5, 5, 4 ]';

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST16\n' );
  fprintf ( 1, '  MARRIAGE arranges a set of stable marriages\n' );
  fprintf ( 1, '  given a set of preferences.\n' );

  [ fiancee, next ] = marriage ( n, prefer, rank );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Man, Wife''s rank, Wife\n' );
  fprintf ( 1, ' \n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %6d  %6d\n', i, next(i), prefer(i,next(i)) );
  end

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Woman, Husband''s rank, Husband\n' );
  fprintf ( 1, ' \n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %6d  %6d\n', i, rank(i,fiancee(i)), fiancee(i) );
  end

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Correct result:\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  M:W 1  2  3  4  5\n' );
  fprintf ( 1, '   1  +  .  .  .  .\n' );
  fprintf ( 1, '   2  .  .  .  +  .\n' );
  fprintf ( 1, '   3  .  .  .  .  +\n' );
  fprintf ( 1, '   4  .  .  +  .  .\n' );
  fprintf ( 1, '   5  .  +  .  .  .\n' );

  return
end
