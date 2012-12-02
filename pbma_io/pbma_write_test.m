function pbma_write_test ( file_out_name )

%*****************************************************************************80
%
%% PBMA_WRITE_TEST tests the ASCII portable bit map write routines.
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
%    Input, character *file_out_name, the name of the file
%    to contain the ASCII portable pixel map data.
%
  nrow = 200;
  ncol = 200;
%
%  Set the data.
%
  b = pbma_example ( nrow, ncol );
%
%  Write the data to the file.
%
  pbma_write ( file_out_name, b );

  return
end
