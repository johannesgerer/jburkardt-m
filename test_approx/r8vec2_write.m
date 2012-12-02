function r8vec2_write ( output_filename, n, x, y )

%*****************************************************************************80
%
%% R8VEC2_WRITE writes an R8VEC2 file.
%
%  Discussion:
%
%    An R8VEC2 is a pair of vectors of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 July 2011
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
%    Input, real X(N), Y(N), the vectors.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC2_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8VEC2_WRITE - Error!' );
  end

  for j = 1 : n
    fprintf ( output_unit, '  %24.16g  %24.16g\n', x(j), y(j) );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
