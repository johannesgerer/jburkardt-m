function xyzl_header_print ( point_num, line_num, line_data_num )

%*****************************************************************************80
%
%% XYZL_HEADER_PRINT prints the header of an XYZL file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer LINE_NUM, the number of lines.
%
%    Input, integer LINE_DATA_NUM, the number of line items.
%
  fprintf ( 1, ' \n');
  fprintf ( 1, '  Number of points =     %d\n', point_num );
  fprintf ( 1, '  Number of lines =      %d\n', line_num );
  fprintf ( 1, '  Number of line items = %d\n', line_data_num );

  return
end
