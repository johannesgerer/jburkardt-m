function [ m, n, nz_num, base ] = r8cc_read_size ( col_file, row_file )

%*****************************************************************************80
%
%% R8CC_READ_SIZE reads the sizes of a R8CC sparse matrix from a file.
%
%  Discussion:
%
%    The value of M is "guessed" to be the largest value that occurs in
%    the ROW file.  However, if a row index of 0 is encountered, then
%    the value of M is incremented by 1.
%
%    The value of N is the number of records in the COL file minus 1.
%
%    The value of NZ_NUM is simply the number of records in the ROW file.
%
%    The value of BASE is 0 or 1, depending on whether the program
%    "guesses" that the row and column indices are 0-based or 1-based.
%    Although the first entry of the COL array might be used as evidence,
%    this program makes its determination based on whether it encounters
%    a 0 index in the ROW file.
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
%    Input, string COL_FILE, ROW_FILE, the names of the
%    column and row files that describe the structure of the matrix.
%
%    Output, integer M, N, the inferred number of rows and columns
%    in the sparse matrix.
%
%    Output, integer NZ_NUM, the number of nonzero entries in the
%    sparse matrix.
%
%    Output, integer BASE, is 0 if the row indexing is believed
%    to be 0-based, and 1 if the row-index is believed to be
%    1-based.  In uncertain cases, BASE = 1 is the default.
%

%
%  Default values.
%
  m = -1;
  n = -1;
  nz_num = -1;
  base = -1;
%
%  Check the COL file first.
%
  input_unit = fopen ( col_file );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8CC_READ_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', col_file );
    error ( 'R8CC_READ_SIZE - Fatal error!' );
    return;
  end

  n = -1;

  while ( 1 )

    [ col, count ] = fscanf ( input_unit, '%d', 1 );

    if ( count ~= 1 )
      break;
    end

    n = n + 1;

  end

  fclose ( input_unit );
%
%  Check the ROW file.
%
  input_unit = fopen ( row_file );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8CC_READ_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', row_file );
    error ( 'R8CC_READ_SIZE - Fatal error!' );
    return;
  end

  base = 1;
  m = 0;
  nz_num = 0;

  while ( 1 )

    [ row, count ] = fscanf ( input_unit, '%d', 1 );

    if ( count ~= 1 )
      break;
    end

    nz_num = nz_num + 1;
    m = max ( m, row );
    if ( row == 0 )
      base = 0;
    end

  end

  fclose ( input_unit );

  return
end
