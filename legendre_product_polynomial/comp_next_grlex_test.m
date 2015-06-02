function comp_next_grlex_test ( )

%*****************************************************************************80
%
%% COMP_NEXT_GRLEX_TEST tests COMP_NEXT_GRLEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMP_NEXT_GRLEX_TEST\n' );
  fprintf ( 1, '  A COMP is a composition of an integer N into K parts.\n' );
  fprintf ( 1, '  Each part is nonnegative.  The order matters.\n' );
  fprintf ( 1, '  COMP_NEXT_GRLEX determines the next COMP in \n' );
  fprintf ( 1, '  graded lexicographic (grlex) order.\n' );

  kc = 3;
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank:     NC       COMP    \n' );
  fprintf ( 1, '  ----:     --   ------------\n' );

  for rank = 1 : 71

    if ( rank == 1 )
      xc = zeros ( kc, 1 );
    else
      xc = comp_next_grlex ( kc, xc );
    end

    nc = sum ( xc(1:kc) );

    fprintf ( 1, '   %3d: ', rank );
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
