function x = r8mat_read_bin ( input_filename, m, n )

%*****************************************************************************80
%
%% R8MAT_READ_BIN reads an R8MAT from a binary file.
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
%    Input, string INPUT_FILENAME, the input filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of data items.
%
%    Output, real X(M,N), the data.
%
  input_unit = fopen ( input_filename, 'rb' );

  x = fread ( input_unit, [ m, n ], 'double' );

  fclose ( input_unit );

  return
end
