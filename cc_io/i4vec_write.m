function i4vec_write ( output_filename, n, x )

%*****************************************************************************80
%
%% I4VEC_WRITE writes an I4VEC file.
%
%  Discussion:
%
%    An I4VEC is a vector of I4's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer N, the number of points.
%
%    Input, integer X(N), the vector.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4VEC_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'I4VEC_WRITE - Error!' );
  end

  for j = 1 : n
    fprintf ( output_unit, '%d\n', x(j) );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
