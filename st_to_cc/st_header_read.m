function [ i_min, i_max, j_min, j_max, m, n, nst ] = st_header_read ( ...
  input_filename )

%*****************************************************************************80
%
%% ST_HEADER_READ reads the header of an ST file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the ST file.
%
%    Output, integer I_MIN, I_MAX, the minimum and maximum rows.
%
%    Output, integer J_MIN, J_MAX, the minimum and maximum columns.
%
%    Output, integer M, the number of rows.
%
%    Output, integer N, the number of columns.
%
%    Output, integer NST, the number of nonzeros.
%
  input_unit = fopen ( input_filename );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ST_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'ST_HEADER_READ - Fatal error!' );
    return
  end

  nst = 0;
  i_min = + Inf;
  i_max = - Inf;
  j_min = + Inf;
  j_max = - Inf;

  string = '  %d  %d  %f';

  while ( 1 )

    line = fgets ( input_unit );

    if ( line == -1 )
      break
    end

    [ x, count ] = sscanf ( line, string );

    i = x(1);
    j = x(2);
    aij = x(3);

    nst = nst + 1;
    i_min = min ( i_min, i );
    i_max = max ( i_max, i );
    j_min = min ( j_min, j );
    j_max = max ( j_max, j );

  end

  fclose ( input_unit );

  m = i_max - i_min + 1;
  n = j_max - j_min + 1;

  return
end
