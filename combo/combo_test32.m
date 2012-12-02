function combo_test32 ( )

%*****************************************************************************80
%
%% COMBO_TEST32 tests QUEENS and BACKTRACK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST32\n' );
  fprintf ( 1, '  QUEENS produces nonattacking queens\n' );
  fprintf ( 1, '  on a chessboard.\n' );
  fprintf ( 1, '  BACKTRACK supervises a backtrack search.\n' );
  fprintf ( 1, ' \n' );

  n = 8;
  iarray = [];
  indx = 0;
  k = -1;
  nstack = -1;
  maxstack = n * n;
  stack = zeros ( maxstack, 1 );

  while ( 1 )

    [ n, iarray, indx, k, nstack, stack ] = backtrack ( n, iarray, ...
      indx, k, nstack, stack, maxstack );

    if ( indx == 1 )

      for i = 1 : n
        fprintf ( 1, '%4d', iarray(i) );
      end
      fprintf ( 1, '\n' );

    elseif ( indx == 2 )

      [ nstack, stack ] = queens ( n, iarray, k, nstack, stack, maxstack );

    else

      break

    end

  end

  return
end
