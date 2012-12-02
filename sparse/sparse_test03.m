function sparse_test03 ( )

%*****************************************************************************80
%
%% SPARSE_TEST03 demonstrates SIZE, NNZ and FIND for sparse matrices.
%
%  Discussion:
%
%    Given a sparse matrix A, the MATLAB functions NNZ, SIZE
%    and FIND can return some interesting information.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    George Lindfield, John Penny,
%    Numerical Methods Using MATLAB,
%    Prentice Hall, 1999.
%  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_TEST03:\n' );
  fprintf ( 1, '  Demonstrate the use of MATLAB''s SIZE, NNZ and FIND\n' );
  fprintf ( 1, '  commands to retrieve information about a sparse matrix.\n' );
%
%  WILKINSON is a built in function that returns a sparse matrix.
%
  A = wilkinson ( 21 );
%
%  Get the formal rows and columns of the full matrix.
%
  [ m, n ] = size ( A );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  [ m, n ] = size ( A )\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );
%
%  Get the number of nonzero entries in A.
%
  nz_num = nnz ( A );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  nz_num = nnz ( A )\n' );
  fprintf ( 1, '  Matrix nonzeros NZ_NUM = %d\n', nz_num );
%
%  Get the sparse triplet representation of A as a set of row indices,
%  column indices, and values.  Notice how the data is sorted.
%
  [ row, col, val ] = find ( A );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  [ row, col, val ] = find ( A )\n' );
  fprintf ( 1, '  Matrix sparse triplet representation:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       ROW       COL     VAL\n' );
  fprintf ( 1, '\n' );
%
%  Print (some of) the sparse triplet data.
%
  for i = 1 : nz_num

    if ( i < 10 | nz_num - 10 < i )
      fprintf ( 1, '  %8d  %8d  %14f\n', row(i), col(i), val(i) );
    end

    if ( i == 10 )
      fprintf ( 1, '..(skipping some entries)...\n' );
    end

  end

  return
end
