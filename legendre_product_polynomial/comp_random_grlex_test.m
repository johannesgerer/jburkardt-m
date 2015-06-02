function comp_random_grlex_test ( )

%*****************************************************************************80
%
%% COMP_RANDOM_GRLEX_TEST tests COMP_RANDOM_GRLEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMP_RANDOM_GRLEX_TEST\n' );
  fprintf ( 1, '  A COMP is a composition of an integer N into K parts.\n' );
  fprintf ( 1, '  Each part is nonnegative.  The order matters.\n' );
  fprintf ( 1, '  COMP_RANDOM_GRLEX selects a random COMP in\n' );
  fprintf ( 1, '  graded lexicographic (grlex) order between indices RANK1 and RANK2.\n' );
  fprintf ( 1, '\n' );

  kc = 3;
  rank1 = 20;
  rank2 = 60;
  seed = 123456789;

  for test = 1 : 5
    [ xc, rank, seed ] = comp_random_grlex ( kc, rank1, rank2, seed );
    nc = sum ( xc(1:kc) );
    fprintf ( 1, '   %3d: ', rank );
    fprintf ( 1, '    %2d = ', nc );
    for j = 1 : kc - 1
      fprintf ( 1, '%2d + ', xc(j) );
    end
    fprintf ( 1, '%2d\n', xc(kc) );
  end

  return
end
