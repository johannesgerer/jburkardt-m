function r8mat_write_bin ( output_filename, m, n, x )

%*****************************************************************************80
%
%% R8MAT_WRITE_BIN writes an array of real data to a binary file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of data items.
%
%    Input, real X(M,N), the data.
%
  output_unit = fopen ( output_filename, 'wb' );

  count = fwrite ( output_unit, x, 'double' );

  fclose ( output_unit );

  return
end
