function [ n, nz_num ] = r8s3_read_size ( input_file )

%*****************************************************************************80
%
%% R8S3_READ_SIZE reads the size of a R8S3 matrix from a file.
%
%  Discussion:
%
%    The value of NZ_NUM is simply the number of records in the input file.
%
%    The value of N is determined as the maximum entry in the row and column
%    vectors.
%
%    The R8S3 storage format corresponds to the SLAP Triad format.
%
%    The R8S3 storage format stores the row, column and value of each nonzero
%    entry of a sparse matrix.  The entries may be given in any order.  No
%    check is made for the erroneous case in which a given matrix entry is
%    specified more than once.
%
%    There is a symmetry option for square matrices.  If the symmetric storage
%    option is used, the format specifies that only nonzeroes on the diagonal
%    and lower triangle are stored.  However, this routine makes no attempt
%    to enforce this.  The only thing it does is to "reflect" any nonzero
%    offdiagonal value.  Moreover, no check is made for the erroneous case
%    in which both A(I,J) and A(J,I) are specified, but with different values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE, the name of the file to 
%    be read.
%
%    Output, integer N, the order of the matrix.
%
%    Output, integer NZ_NUM, the number of nonzero elements in the matrix.
%
  n = 0;
  nz_num = 0;

  input_unit = fopen ( input_file );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8S3_READ_SIZE - Error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'R8S3_READ_SIZE - Error!' );
    return;
  end

  while ( 1 )

    [ row_k, count ] = fscanf ( input_unit, '%d', 1 );

    if ( count ~= 1 )
      break
    end

    [ col_k, count ] = fscanf ( input_unit, '%d', 1 );

    if ( count ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8S3_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error reading COL(%d).\n', k );
      error ( 'R8S3_READ_SIZE - Fatal error!' );
    end

    [ a_k, count ] = fscanf ( input_unit, '%f', 1 );

    if ( count ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8S3_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error reading COL(%d).\n', k );
      error ( 'R8S3_READ_SIZE - Fatal error!' );
    end

    nz_num = nz_num + 1;
    n = max ( n, row_k );
    n = max ( n, col_k );

  end

  fclose ( input_unit );

  return
end
