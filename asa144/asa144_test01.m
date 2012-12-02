function asa144_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests RCONT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2008
%
%  Author:
%
%    John Burkardt
%
  nrow = 5;
  ncol = 5;

  ncolt = [ 2, 2, 2, 2, 1 ];
  nrowt = [ 3, 2, 2, 1, 1 ];
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  RCONT constructs a random matrix with\n' );
  fprintf ( 1, '  given row and column sums.\n' );

  i4vec_print ( nrow, nrowt, '  The rowsum vector:' );
  i4vec_print ( ncol, ncolt, '  The columnsum vector: ' );

  key = 0;
  nsubt = [];

  for test = 1 : test_num

    [ matrix, nsubt, key, ifault ] = rcont ( nrow, ncol, nrowt, ncolt, nsubt, key );

    if ( ifault ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  RCONT returned IFAULT = %d\n', ifault );
      return
    end

    i4mat_print ( nrow, ncol, matrix, '  The rowcolsum matrix:' );

  end

  return
end
