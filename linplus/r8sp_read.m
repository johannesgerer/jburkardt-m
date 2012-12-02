function [ row, col, a ] = r8sp_read ( input_file, m, n, nz_num )

%*****************************************************************************80
%
%% R8SP_READ reads a R8SP matrix from a file.
%
%  Discussion:
%
%    This routine needs the value of NZ_NUM, which can be determined
%    by a call to R8SP_READ_SIZE.
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
%    Input, string INPUT_FILE, the name of the file to be read.
%
%    Unused, integer M, N, the number of rows and columns of the matrix.
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
    fprintf ( 1, 'R8SP_READ - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'R8SP_READ - Fatal error!' );
    return;
  end

  for k = 1 : nz_num

    [ row(k), count ] = fscanf ( input_unit, '%d', 1 );

    if ( count ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8SP_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error reading ROW(%d).\n', k );
      error ( 'R8SP_READ - Fatal error!' );
    end

    [ col(k), count ] = fscanf ( input_unit, '%d', 1 );

    if ( count ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8SP_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error reading COL(%d).\n', k );
      error ( 'R8SP_READ - Fatal error!' );
    end

    [ a(k), count ] = fscanf ( input_unit, '%f', 1 );

    if ( count ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8SP_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error reading A(%d).\n', k );
      error ( 'R8SP_READ - Fatal error!' );
    end

  end

  fclose ( input_unit );

  return
end
