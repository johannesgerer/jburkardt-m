function table = i4mat_read ( input_filename )

%*****************************************************************************80
%
%% I4MAT_READ reads information from an I4MAT file.
%
%  Discussion:
%
%    An I4MAT is an array of I4's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, integer TABLE(M,N), the point coordinates.
%
  [ m, n ] = i4mat_header_read ( input_filename );

  if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_READ - Fatal error!\n' );
    fprintf ( 1, '  The spatial dimension is not positive.\n' );
  end

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_READ - Fatal error!\n' );
    fprintf ( 1, '  The number of points is not positive.\n' );
  end

  table(1:m,1:n) = i4mat_data_read ( input_filename, m, n );

  return
end
