function combo_test21 ( )

%*****************************************************************************80
%
%% COMBO_TEST21 tests NPART_TABLE and PART_TABLE.
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
  maxn = 10;
  maxpart = 5;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST21\n' );
  fprintf ( 1, '  NPART_TABLE tabulates partitions\n' );
  fprintf ( 1, '  of N with NPART parts;\n' );
  fprintf ( 1, '  PART_TABLE tabulates partitions of N.\n' );

  offset = 1;

  p = npart_table ( maxn, maxpart );

  p2 = part_table ( maxn );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '    I P(I)  P(I,0) P(I,1) P(I,2) P(I,3) P(I,4) P(I,5)\n' );
  fprintf ( 1, ' \n' );

  for i = 0 : maxn
    fprintf ( 1, '%5d%5d', i, p2(i+offset) );
    for j = 0 : maxpart
      fprintf ( 1, '%5d', p(i+offset,j+offset) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
