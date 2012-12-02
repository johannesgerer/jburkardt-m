function r8vec_write ( output_filename, n, x )

%*****************************************************************************80
%
%% R8VEC_WRITE writes an R8VEC file.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
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
%    Input, real X(N), the vector.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8VEC_WRITE - Error!' );
  end

  for j = 1 : n
    fprintf ( output_unit, '  %24.16g\n', x(j) );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
