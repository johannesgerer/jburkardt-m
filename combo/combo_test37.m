function combo_test37 ( )

%*****************************************************************************80
%
%% COMBO_TEST37 tests STIRLING_NUMBERS1.
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
  maxm = 6;
  maxn = 6;
  offset = 1;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST37\n' );
  fprintf ( 1, '  STIRLING_NUMBERS1 computes a table of Stirling\n' );
  fprintf ( 1, '  numbers of the first kind.\n' );

  s = stirling_numbers1 ( maxm, maxn );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '    I S(I,0) S(I,1) S(I,2) S(I,3) S(I,4) S(I,5)\n' );
  fprintf ( 1, ' \n' );

  for i = 0 : maxm
    fprintf ( 1, '%5d', i );
    for j = 0 : maxn
      fprintf ( 1, '%5d', s(i+offset,j+offset) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
