function xyf_header_print ( point_num, face_num, face_data_num )

%*****************************************************************************80
%
%% XYF_HEADER_PRINT prints the header of an XYF file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, integer FACE_DATA_NUM, the number of face items.
%
  fprintf ( 1, '\n');
  fprintf ( 1, '  Number of points =     %d\n', point_num );
  fprintf ( 1, '  Number of faces =      %d\n', face_num );
  fprintf ( 1, '  Number of face items = %d\n', face_data_num );

  return
end
