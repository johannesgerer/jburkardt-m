function r8sp_write ( m, n, nz_num, row, col, a, output_file )

%*****************************************************************************80
%
%% R8SP_WRITE writes a R8SP matrix to a file.
%
%  Discussion:
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
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, integer NZ_NUM, the number of nonzero elements in the matrix.
%
%    Input, integer ROW(NZ_NUM), COL(NZ_NUM), the row and column indices
%    of the nonzero elements.
%
%    Input, real A(NZ_NUM), the nonzero elements of the matrix.
%
%    Input, string OUTPUT_FILE, the name of the file to which
%    the information is to be written.
%
  output_unit = fopen ( output_file, 'wt' );

  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8SP_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file "%s".\n', output_file );
    error ( 'R8SP_WRITE - Fatal error!' );
  end

  for k = 1 : nz_num
    fprintf ( output_unit, '  %8d  %8d  %16f\n', row(k), col(k), a(k) );
  end

  fclose ( output_unit );

  return
end
