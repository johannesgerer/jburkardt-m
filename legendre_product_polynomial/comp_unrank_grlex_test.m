function comp_unrank_grlex_test ( )

%*****************************************************************************80
%
%% COMP_UNRANK_GRLEX_TEST tests COMP_UNRANK_GRLEX.
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
  fprintf ( 1, 'COMP_UNRANK_GRLEX_TEST\n' );
  fprintf ( 1, '  A COMP is a composition of an integer N into K parts.\n' );
  fprintf ( 1, '  Each part is nonnegative.  The order matters.\n' );
  fprintf ( 1, '  COMP_UNRANK_GRLEX determines the parts\n' );
  fprintf ( 1, '  of a COMP from its rank.\n' );

  kc = 3;
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank: ->  NC       COMP\n' );
  fprintf ( 1, '  ----:     --   ------------\n' );

  for rank1 = 1 : 71

    xc = comp_unrank_grlex ( kc, rank1 );
    nc = sum ( xc(1:kc) );

    fprintf ( 1, '   %3d: ', rank1 );
    fprintf ( 1, '    %2d = ', nc );
    for j = 1 : kc - 1
      fprintf ( 1, '%2d + ', xc(j) );
    end
    fprintf ( 1, '%2d\n', xc(kc) );
%
%  When XC(1) == NC, we have completed the compositions associated with
%  a particular integer, and are about to advance to the next integer.
%
    if ( xc(1) == nc )
      fprintf ( 1, '  ----:     --   ------------\n' );
    end

  end

  return
end
