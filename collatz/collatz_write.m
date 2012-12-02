function collatz_write ( n, r, file_out_name )

%*****************************************************************************80
%
%% COLLATZ_WRITE writes a Collatz sequence to a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements in the subsequence.
%
%    Input, real R(N), the points.
%
%    Input, string FILE_OUT_NAME, the name of the output file.
%
  file_out_unit = fopen ( file_out_name, 'w' );

  if ( file_out_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COLLATZ_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file "%s".\n', file_out_name );
    error ( 'COLLATZ_WRITE - Fatal error!' );
  end

  for i = 1 : n
    fprintf ( file_out_unit, '  %d\n', r(i) );
  end

  fclose ( file_out_unit );

  return
end
