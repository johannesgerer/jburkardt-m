function table = r8mat_read ( input_filename )

%*****************************************************************************80
%
%% R8MAT_READ reads information from an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
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
%    Output, real TABLE(M,N), the point coordinates.
%
  [ m, n ] = r8mat_header_read ( input_filename );

  if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_READ - Fatal error!\n' );
    fprintf ( 1, '  The spatial dimension is not positive.\n' );
  end

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_READ - Fatal error!\n' );
    fprintf ( 1, '  The number of points is not positive.\n' );
  end

  table(1:m,1:n) = r8mat_data_read ( input_filename, m, n );

  return
end
