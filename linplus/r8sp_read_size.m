function [ m, n, nz_num ] = r8sp_read_size ( input_file )

%*****************************************************************************80
%
%% R8SP_READ_SIZE reads the size of a R8SP matrix from a file.
%
%  Discussion:
%
%    The value of NZ_NUM is simply the number of records in the input file.
%
%    The values of M and N are determined as the maximum entry in the row 
%    and column vectors.
%
%    The R8SP storage format stores the row, column and value of each nonzero
%    entry of a sparse matrix.
%
%    It is possible that a pair of indices (I,J) may occur more than
%    once.  Presumably, in this case, the intent is that the actual value
%    of A(I,J) is the sum of all such entries.  This is not a good thing
%    to do, but I seem to have come across this in MATLAB.
%
%    The R8SP format is used by CSPARSE ("sparse triplet"), DLAP/SLAP 
%    ("nonsymmetric SLAP triad"), by MATLAB, and by SPARSEKIT ("COO" format).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2006
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
%    Output, integer M, N, the number of rows and columns of the matrix.
%
%    Output, integer NZ_NUM, the number of nonzero elements in the matrix.
%
  m = 0;
  n = 0;
  nz_num = 0;

  input_unit = fopen ( input_file );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8SP_READ_SIZE - Error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'R8SP_READ_SIZE - Error!' );
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
      fprintf ( 1, 'R8SP_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error reading COL(%d).\n', k );
      error ( 'R8SP_READ_SIZE - Fatal error!' );
    end

    [ a_k, count ] = fscanf ( input_unit, '%f', 1 );

    if ( count ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8SP_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error reading COL(%d).\n', k );
      error ( 'R8SP_READ_SIZE - Fatal error!' );
    end

    m = max ( m, row_k );
    n = max ( n, col_k );
    nz_num = nz_num + 1;

  end

  fclose ( input_unit );

  return
end
