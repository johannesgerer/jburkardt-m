function ppma_write_test ( file_out_name )

%*****************************************************************************80
%
%% PPMA_WRITE_TEST tests the ASCII portable pixel map write routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 August 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_OUT_NAME, the name of the file
%    to contain the ASCII portable pixel map data.
%
  nrow = 300;
  ncol = 300;
%
%  Set the data.
%
  [ r, g, b ] = ppma_example ( nrow, ncol );
%
%  Write the data to the file.
%
  ppma_write ( file_out_name, r, g, b );

  return
end
