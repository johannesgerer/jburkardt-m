function [ row, col, a ] = r8s3_read ( input_file, n, nz_num )

%*****************************************************************************80
%
%% R8S3_READ reads a R8S3 matrix from a file.
%
%  Discussion:
%
%    This routine needs the value of NZ_NUM, which can be determined
%    by a call to R8S3_READ_SIZE.
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
%    Input, string INPUT_FILE, the name of the file to be read.
%
%    Unused, integer N, the order of the matrix.
%
%    Input, integer NZ_NUM, the number of nonzero elements in the matrix.
%
%    Output, integer ROW(NZ_NUM), COL(NZ_NUM), the row and column indices
%    of the nonzero elements.
%
%    Output, real A(NZ_NUM), the nonzero elements of the matrix.
%
  row = [];
  col = [];
  a = [];
  
  input_unit = fopen ( input_file );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8S3_READ - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file );
    error ( 'R8S3_READ - Fatal error!' );
    return;
  end

  for k = 1 : nz_num

    [ row(k), count ] = fscanf ( input_unit, '%d', 1 );

    if ( count ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8S3_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error reading ROW(%d).\n', k );
      error ( 'R8S3_READ - Fatal error!' );
    end

    [ col(k), count ] = fscanf ( input_unit, '%d', 1 );

    if ( count ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8S3_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error reading COL(%d).\n', k );
      error ( 'R8S3_READ - Fatal error!' );
    end

    [ a(k), count ] = fscanf ( input_unit, '%f', 1 );

    if ( count ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8S3_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error reading A(%d).\n', k );
      error ( 'R8S3_READ - Fatal error!' );
    end

  end

  fclose ( input_unit );

  return
end
