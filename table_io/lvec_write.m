function lvec_write ( output_filename, n, table )

%*****************************************************************************80
%
%% LVEC_WRITE writes an LVEC file.
%
%  Discussion:
%
%    An LVEC is a vector of L's.
%
%    An L is FALSE if zero, and TRUE if nonzero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output file name.
%
%    Input, integer N, the number of points.
%
%    Input, logical TABLE(N), the data.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LVEC_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'LVEC_WRITE - Error!' );
  end
%
%  Write the data.
%
  for j = 1 : n
    if ( table(j) == 0 )
      fprintf ( output_unit, '0\n' );
    else
      fprintf ( output_unit, '1\n' );
    end
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
