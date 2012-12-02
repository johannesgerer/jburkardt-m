function [ col, row, a ] = r8cc_read ( col_file, row_file, a_file, ...
  m, n, nz_num )

%*****************************************************************************80
%
%% R8CC_READ reads a R8CC matrix from three files.
%
%  Discussion:
%
%    This routine needs the values of M, N, and NZ_NUM, which can be
%    determined by a call to R8CC_READ_SIZE.
%
%    The R8CC format is the double precision sparse compressed column
%    format.  Associated with this format, we have an M by N matrix
%    with NZ_NUM nonzero entries.  We construct the column pointer
%    vector COL of length N+1, such that entries of column J will be
%    stored in positions COL(J) through COL(J+1)-1.  This indexing
%    refers to both the ROW and A vectors, which store the row indices
%    and the values of the nonzero entries.  The entries of the
%    ROW vector corresponding to each column are assumed to be
%    ascending sorted.
%
%    The R8CC format is equivalent to the MATLAB "sparse" format,
%    and the Harwell Boeing "real unsymmetric assembled" (RUA) format.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992
%
%  Parameters:
%
%    Input, string COL_FILE, ROW_FILE, A_FILE, the names of the
%    files containing the column pointers, row indices, and matrix entries.
%
%    Input, integer M, N, the number of rows and columns in the matrix.
%
%    Input, integer NZ_NUM, the number of nonzero elements in the matrix.
%
%    Output, integer COL(N+1), the column pointers.
%
%    Output, integer ROW(NZ_NUM), the row indices.
%
%    Output, real A(NZ_NUM), the nonzero elements
%    of the matrix.
%
  col = [];
  row = [];
  a = [];
%
%  Read the column information.
%
  input_unit = fopen ( col_file );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8CC_READ - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', col_file );
    error ( 'R8CC_READ - Fatal error!' );
    return;
  end

  for k = 1 : n + 1

    [ col(k), count ] = fscanf ( input_unit, '%d', 1 );

    if ( count ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8CC_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error reading COL(%d).\n', k );
      error ( 'R8CC_READ - Fatal error!' );
    end

  end

  fclose ( input_unit );
%
%  Read the row information.
%
  input_unit = fopen ( row_file );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8CC_READ - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', row_file );
    error ( 'R8CC_READ - Fatal error!' );
    return;
  end

  for k = 1 : nz_num

    [ row(k), count ] = fscanf ( input_unit, '%d', 1 );

    if ( count ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8CC_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error reading ROW(%d).\n', k );
      error ( 'R8CC_READ - Fatal error!' );
    end

  end

  fclose ( input_unit );
%
%  Read the value information.
%
  input_unit = fopen ( a_file );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8CC_READ - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', a_file );
    error ( 'R8CC_READ - Fatal error!' );
    return;
  end

  for k = 1 : nz_num

    [ a(k), count ] = fscanf ( input_unit, '%f', 1 );

    if ( count ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8CC_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error reading A(%d).\n', k );
      error ( 'R8CC_READ - Fatal error!' );
    end

  end

  fclose ( input_unit );

  return
end
