function r8vec_write ( n, r, output_file )

%*****************************************************************************80
%
%% R8VEC_WRITE writes an R8VEC to a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real R(N), the vector to be written.
%
%    Input, string OUTPUT_FILE, the name of the file to which
%    the information is to be written.
%
  output_unit = fopen ( output_file, 'wt' );

  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file "%s".\n', output_file );
    error ( 'R8VEC_WRITE - Fatal error!' );
  end

  for i = 1 : n
    fprintf ( output_unit, '  %16f\n', r(i) );
  end

  fclose ( output_unit );

  return
end
