function pgma_write_test ( file_out_name )

%*****************************************************************************80
%
%% PGMA_WRITE_TEST tests the ASCII PGM write routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character FILE_OUT_NAME, the name of the output file.
%
  nrow = 300;
  ncol = 300;
%
%  Set the data.
%
  g = pgma_example ( nrow, ncol );
%
%  Write the data to the file.
%
  pgma_write ( file_out_name, g );

  return
end

