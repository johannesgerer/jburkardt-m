function svd_basis ( )

%*****************************************************************************80
%
%% MAIN is the main program for SVD_BASIS.
%
%  Discussion:
%
%    SVD_BASIS forms a basis from the SVD of a set of data vectors.
%
%    This program uses the singular value decomposition (SVD) to analyze
%    a set of data, and extract a number of dominant modes.
%
%    This program is intended as an intermediate application, in
%    the following situation:
%
%    A) a "high fidelity" or "high resolution" PDE solver is used
%       to determine many (say N = 500) solutions of a discretized
%       PDE at various times, or parameter values.  Each solution
%       may be regarded as an M vector.  Typically, each solution
%       involves an M by M linear system, greatly reduced in
%       complexity because of bandedness or sparsity.
%
%    B) This program is applied to extract L dominant modes from
%       the N solutions.  This is done using the singular value
%       decomposition of the M by N matrix, each of whose columns
%       is one of the original solution vectors.
%
%    C) a "reduced order model" program may then attempt to solve
%       a discretized version of the PDE, using the L dominant
%       modes as basis vectors.  Typically, this means that a dense
%       L by L linear system will be involved.
%
%    Thus, the program might read in 500 files, and write out
%    5 or 10 files of the corresponding size and "shape", representing
%    the dominant solution modes.
%
%    An option has been added to compute the average of the vectors
%    and subtract it before SVD processing.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gal Berkooz, Philip Holmes, John Lumley,
%    The proper orthogonal decomposition in the analysis of turbulent flows,
%    Annual Review of Fluid Mechanics,
%    Volume 25, 1993, pages 539-575.
%
%    John Burkardt, Max Gunzburger, Hyung-Chun Lee,
%    Centroidal Voronoi Tessellation-Based Reduced-Order
%    Modelling of Complex Systems,
%    SIAM Journal on Scientific Computing,
%    Volume 28, Number 2, 2006, pages 459-484.
%
%    Lawrence Sirovich,
%    Turbulence and the dynamics of coherent structures, Parts I-III,
%    Quarterly of Applied Mathematics,
%    Volume XLV, Number 3, 1987, pages 561-590.
%
  clean = 1;

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_BASIS\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Given a PDE for which:\n' );
  fprintf ( 1, '    C is the number of components of the solution \n' );
  fprintf ( 1, '      at any single point,\n' );
  fprintf ( 1, '    P is the number of points where a solution is given,\n' );
  fprintf ( 1, '    N is the number of solution vectors,\n' );
  fprintf ( 1, '    L is the number of modes to be extracted.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Then we let M = C*P be the abstract spatial dimension.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  If requested, we compute the average solution,\n' );
  fprintf ( 1, '  subtract it from each solution, and save that\n' );
  fprintf ( 1, '  as mode #0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Set up A, the M by N matrix of solution vectors,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Get A = U * S * V'', the singular value decomposition.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The first L columns of U are our dominant modes.\n' );
  fprintf ( 1, '\n' );
%
%  What is the basis size?
%
  basis_num = input ( '  How many basis vectors (L) are to be extracted?' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L = %d\n', basis_num );
%
%  Gather one or more "base" file names.
%
  data_file_base_num = 0;
  data_file_base_start = [];
  data_file_base_last = [];
  data_file_base = [];
  data_file_base_size = 0;

  while ( 1 )
%
%  Get the next base file name.
%
    fprintf ( 1, '\n' );
    fprintf ( 1, '  You specify a consecutive sequence of file names\n' );
    fprintf ( 1, '  by giving the first "base" file name.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  If there are no more sequences to enter,\n' );
    fprintf ( 1, '  just hit RETURN.\n' );

    file_name = input ( '  Enter a new base file name, or RETURN.' );

    if ( s_len_trim ( file_name ) <= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  RETURN was entered.\n' );
      fprintf ( 1, '  Presumably, there are no more file sequences.\n' );
      break
    end

    file_name_length = length ( file_name );
    
    data_file_base_num = data_file_base_num + 1;
    data_file_base_start(data_file_base_num) = data_file_base_size + 1;
    data_file_base_last(data_file_base_num) = data_file_base_size + file_name_length;
    data_file_base = strcat ( data_file_base, file_name );
    data_file_base_size = data_file_base_size + file_name_length;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %6d:  "%s"\n', data_file_base_num, file_name );
%
%  For the very first base file, get the data sizes.
%
    if ( data_file_base_num == 1 )

      [ comp_num, node_num ] = r8mat_header_read ( file_name );

      dim_num = comp_num * node_num;

      fprintf ( 1, '\n' );
      fprintf ( 1, '  According to the first base file,\n' );
      fprintf ( 1, '  The number of solution components C =   %d\n', comp_num );
      fprintf ( 1, '  The number of solution points P =       %d\n', node_num );
      fprintf ( 1, '  The "size" of each solution M = (C*P) = %d\n', dim_num );
%
%  Idiocy check.  L must be less than or equal to M.
%
      if ( dim_num < basis_num )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'SVD_BASIS - Fatal error!\n' );
        fprintf ( 1, '\n' );
        fprintf ( 1, '  M < L.\n' );
        fprintf ( 1, '\n' );
        fprintf ( 1, '  That is, the number of modes requested (L) is greater\n' );
        fprintf ( 1, '  than the spatial dimension (M).\n' );
        fprintf ( 1, '  Technically, the program could pad out the answer\n' );
        fprintf ( 1, '  with L-M zero vectors, but instead, we will stop\n' );
        fprintf ( 1, '  assuming you made an error, or a misapprehension.\n' );
        fprintf ( 1, '\n' );
        fprintf ( 1, 'SVD_BASIS:\n' );
        fprintf ( 1, '  Abnormal end of execution.\n' );
        fprintf ( 1, '\n' );
        timestamp;
        return
      end

    end

  end
%
%  Count all the data files.
%
  data_file_num = 0;

  for i = 1 : data_file_base_num

    start = data_file_base_start(i);
    last = data_file_base_last(i);
    data_file = data_file_base(start:last);

    while ( 1 )
      
      if ( ~file_exist ( data_file ) )
        break
      end

      data_file_num = data_file_num + 1;

      data_file = file_name_inc_nowrap ( data_file );

    end

  end

  if ( data_file_num == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SVD_BASIS - Fatal error!\n' );
    fprintf ( 1, '  There do not seem to be any solution files;\n' );
    fprintf ( 1, '  that is, files whose names are "incremented"\n' );
    fprintf ( 1, '  versions of the first file name.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The first file we looked for was "%s"\n', data_file );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SVD_BASIS:\n' );
    fprintf ( 1, '  Abnormal end of execution.\n' );
    fprintf ( 1, '\n' );
    timestamp;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of data files N = %d\n', data_file_num );
%
%  Set up an array to hold all the data.
%
  point_num = data_file_num;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data is stored in an M by N matrix A.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The "spatial" dimension M is   %d\n', dim_num );
  fprintf ( 1, '  The number of data points N is %d\n', point_num );
%
%  Read the data.
%
  l = 0;

  for ii = 1 : data_file_base_num

    start = data_file_base_start(i);
    last = data_file_base_last(i);
    data_file = data_file_base(start:last);

    while ( 1 )

      if ( ~file_exist ( data_file ) )
        break
      end

      l = l + 1;

      table = r8mat_data_read ( data_file, comp_num, node_num );

      k = 0;
      for j = 1 : node_num
        for i = 1 : comp_num
          k = k + 1;
          point(k,l) = table(i,j);
        end
      end

      data_file = file_name_inc_nowrap ( data_file );

    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data has been read into the matrix A.\n' );
%
%----------------------------------------------------------------------------
%  Optionally, average the data, subtract the average from each entry,
%  and later save the average as vector #0.
%----------------------------------------------------------------------------
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_BASIS:\n' );
  fprintf ( 1, '  Averaging of data is optional.\n' );
  fprintf ( 1, '  The program can average the data vectors,\n' );
  fprintf ( 1, '  subtract it from each data vector,\n' );
  fprintf ( 1, '  and write out the data average vector as an\n' );
  fprintf ( 1, '  extra "mode 0" vector.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Do you want to compute and use the average? (''Y''/''N'')\n' );

  average_char = input ( '  Enter ''Y'' or ''N'':' );

  if ( average_char == 'Y' || average_char == 'y' )
    average_normalization = 1;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The user has requested the average vector.\n' );
  else
    average_normalization = 0;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The user does not want the average vector.\n' );
  end

  if ( average_normalization )

    for i = 1 : dim_num
      point_average(i,1) = sum ( point(i,1:point_num) );
    end

    point_average(1:dim_num,1) = point_average(1:dim_num,1) / point_num;

    for i = 1 : dim_num
      point(i,1:point_num) = point(i,1:point_num) - point_average(i,1);
    end

  end
%
%----------------------------------------------------------------------------
%
%  Compute the SVD of A.
%
%----------------------------------------------------------------------------
%
  [ point, sval ] = singular_vectors ( dim_num, point_num, basis_num, point );
%
%----------------------------------------------------------------------------
%
%  "Clean" the output data.  We are having problems with some vectors
%  containing a few very tiny (and meaningless) values.
%
%----------------------------------------------------------------------------
%
  if ( clean )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Because the CLEAN option is on,\n' );
    fprintf ( 1, '  we will set very tiny vector entries to 0.\n' );

    tol = r8_epsilon ( );

    for j = 1 : basis_num
      for i = 1 : dim_num
        if ( abs ( point(i,j) ) < tol )
          point(i,j) = 0.0;
        end
      end
    end
  end
%
%----------------------------------------------------------------------------
%
%  Write the first L left singular vectors (columns of U) to files.
%
%----------------------------------------------------------------------------
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_BASIS:\n' );
  fprintf ( 1, '  Ready to write the left singular vectors to files.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Do you want comments in the header of the file?\n' );
  fprintf ( 1, '  (These begin with the "#" character.) (''Y''/''N'')\n' );

  comment_char = input ( '  Enter ''Y'' or ''N'':' );

  if ( comment_char == 'Y' || comment_char == 'y' )
    comment = 1;
  else
    comment = 0;
  end

  basis_file = 'svd_000.txt';

  if ( average_normalization )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Writing average file "%s".\n', basis_file );

    average_value = 0.0;
    
    r8mat_write ( basis_file, comp_num, node_num, point_average(1:dim_num,1) );

  end

  for j = 1 : basis_num

    basis_file = file_name_inc_nowrap ( basis_file );

    if ( j == 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Writing first file "%s".\n', basis_file );
    end

    if ( j == basis_num )
      fprintf ( 1, '  Writing last file  "%s"\n', basis_file );
    end

    r8mat_write ( basis_file, comp_num, node_num, point(1:dim_num,j) );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_BASIS\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function column_num = file_column_count ( input_file_name )

%*****************************************************************************80
%
%% FILE_COLUMN_COUNT counts the columns in the first line of a file.
%
%  Discussion:
%
%    The file is assumed to be a simple text file.
%
%    Most lines of the file are presumed to consist of COLUMN_NUM words,
%    separated by spaces.  There may also be some blank lines, and some 
%    comment lines, which have a "#" in column 1.
%
%    The routine tries to find the first non-comment non-blank line and
%    counts the number of words in that line.
%
%    If all lines are blanks or comments, it goes back and tries to analyze
%    a comment line.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the file.
%
%    Output, integer COLUMN_NUM, the number of columns in the file.
%
  FALSE = 0;
  TRUE = 1;
%
%  Open the file.
%
  input_unit = fopen ( input_file_name );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'FILE_COLUMN_COUNT - Error!' );
  end
%
%  Read one line, but skip blank lines and comment lines.
%  Use FGETL so we drop the newline character!
%
  got_one = FALSE;

  while ( 1 )

    line = fgetl ( input_unit );

    if ( line == -1 )
      break;
    end

    if ( s_len_trim ( line ) == 0 )

    elseif ( line(1) == '#' )

    else
      got_one = TRUE;
      break;
    end

  end

  fclose ( input_unit );

  if ( got_one == FALSE ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Warning!\n' );
    fprintf ( 1, '  The file does not seem to contain any data.\n' );
    column_num = -1;
    return;
  end

  column_num = s_word_count ( line );

  return
end
function value = file_exist ( file_name )

%*****************************************************************************80
%
%% FILE_EXIST reports whether a file exists.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character FILE_NAME, the name of the file.
%
%    Output, logical FILE_EXIST, is TRUE if the file exists.
%
  fid = fopen ( file_name );

  if ( fid == -1 ) 
    value = 0;
  else
    fclose ( fid );
    value = 1;
  end

  return
end
function file_name = file_name_inc_nowrap ( file_name )

%*****************************************************************************80
%
%% FILE_NAME_INC_NOWRAP increments a partially numeric filename.
%
%  Discussion:
%
%    It is assumed that the digits in the name, whether scattered or
%    connected, represent a number that is to be increased by 1 on
%    each call.  Non-numeric letters of the name are unaffected..
%
%    If the (nonempty) name contains no digits, or all the digits are
%    9, then the empty string is returned.
%
%    If the empty string is input, the routine stops.
%
%  Example:
%
%      Input            Output
%      -----            ------
%      'a7to11.txt'     'a7to12.txt'  (typical case.  Last digit incremented)
%      'a7to99.txt'     'a8to00.txt'  (last digit incremented, with carry.)
%      'a8to99.txt'     'a9to00.txt'
%      'a9to99.txt'     ' '
%      'cat.txt'        ' '
%      ' '              STOP!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the string to be incremented.
%
%    Output, string FILE_NAME, the incremented string.
%
  lens = s_len_trim ( file_name );

  if ( lens <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_NAME_INC_NOWRAP - Fatal error!\n' );
    fprintf ( 1, '  The input filename is empty.\n' );
    error ( 'FILE_NAME_INC_NOWRAP - Fatal error!' );
  end

  change = 0;
  carry = 0;

  for i = lens : -1 : 1

    c = file_name(i);

    if ( '0' <= c && c <= '9' )

      change = change + 1;

      if ( c == '9' )
        c = '0';
        carry = 1;
      else
        c = c + 1;
        carry = 0;
      end
    
      file_name(i) = c;

      if ( c ~= '0' )
        return
      end

    end

  end
%
%  Unsatisfied carry.  The input digits were all 9.  Return blank.
%
  if ( carry == 1 )
    file_name = ' ';
  end
%
%  No digits were found.  Return blank.
%
  if ( change == 0 )
    file_name = ' ';
  end

  return
end
function row_num = file_row_count ( input_file_name )

%*****************************************************************************80
%
%% FILE_ROW_COUNT counts the number of row records in a file.
%
%  Discussion:
%
%    Each input line is a "RECORD".
%
%    The records are divided into three groups:
%    
%    * BLANK LINES (nothing but blanks)
%    * COMMENT LINES (begin with a '#')
%    * DATA RECORDS (anything else)
%
%    The value returned by the function is the number of data records.
%
%    By the way, if the MATLAB routine FGETS is used, instead of
%    FGETL, then the variable LINE will include line termination 
%    characters, which means that a blank line would not actually
%    have zero characters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Output, integer ROW_NUM, the number of rows found. 
%
  input_unit = fopen ( input_file_name );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_ROW_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'FILE_ROW_COUNT - Error!' );
  end

  blank_num = 0;
  comment_num = 0;
  row_num = 0;
  
  record_num = 0;

  while ( 1 )

    line = fgetl ( input_unit );

    if ( line == -1 )
      break;
    end

    record_num = record_num + 1;
    record_length = s_len_trim ( line );
    
    if ( record_length <= 0 )
      blank_num = blank_num + 1;
    elseif ( line(1) == '#' )
      comment_num = comment_num + 1;
    else
      row_num = row_num + 1;
    end

  end

  fclose ( input_unit );

  return
end
function value = r8_epsilon ( )

%*****************************************************************************80
%
%% R8_EPSILON returns the R8 roundoff unit.
%
%  Discussion:
%
%    The roundoff unit is a number R which is a power of 2 with the 
%    property that, to the precision of the computer's arithmetic,
%      1 < 1 + R
%    but 
%      1 = ( 1 + R / 2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the roundoff unit.
%
  value = eps;

  return
end
function table = r8mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% R8MAT_DATA_READ reads data from an R8MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer M, N, the number of rows and columns of data.
%
%    Output, real TABLE(M,N), the point coordinates.
%
  table = [];
%
%  Build up the format string for reading M real numbers.
%
  string = ' ';

  for i = 0 : m
    string = strcat ( string, ' %f' );
  end

  input_unit = fopen ( input_filename );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'R8MAT_DATA_READ - Error!' );
    return;
  end

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      break;
    end

    if ( line(1) == '#' )

    elseif ( s_len_trim ( line ) == 0 )
      
    else

      [ x, count ] = sscanf ( line, string );

      if ( count == m )
        i = i + 1;
        table(1:m,i) = x(1:m);
      end

    end

  end

  fclose ( input_unit );

  return
end
function [ m, n ] = r8mat_header_read ( input_filename )

%*****************************************************************************80
%
%% R8MAT_HEADER_READ reads the header from an R8MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, integer M, the spatial dimension.
%
%    Output, integer N, the number of points.
%
  m = file_column_count ( input_filename );

  if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data columns in\n' );
    fprintf ( 1, '  the file %s.\n', input_filename );
  end

  n = file_row_count ( input_filename );

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data rows in\n' );
    fprintf ( 1, '  the file %s\n', input_filename );
  end

  return
end
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
%  For greater precision, try:
%
%     fprintf ( output_unit, '  %24,16f', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %14f', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function len = s_len_trim ( s )

%*****************************************************************************80
%
%% S_LEN_TRIM returns the length of a character string to the last nonblank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be measured.
%
%    Output, integer LEN, the length of the string up to the last nonblank.
%
  len = length ( s );

  while ( 0 < len )
    if ( s(len) ~= ' ' )
      return
    end
    len = len - 1;
  end

  return
end
function word_num = s_word_count ( s )

%*****************************************************************************80
%
%% S_WORD_COUNT counts the number of "words" in a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be examined.
%
%    Output, integer WORD_NUM, the number of "words" in the string.
%    Words are presumed to be separated by one or more blanks.
%
  FALSE = 0;
  TRUE = 1;

  word_num = 0;
  s_length = length ( s );

  if ( s_length <= 0 )
    return;
  end

  blank = TRUE;

  for i = 1 : s_length

    if ( s(i) == ' ' )
      blank = TRUE;
    elseif ( blank == TRUE )
      word_num = word_num + 1;
      blank = FALSE;
    end

  end

  return
end
function [ u, s ] = singular_vectors ( m, n, basis_num, a )

%*****************************************************************************80
%
%% SINGULAR_VECTORS computes the desired singular values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Anderson, Zhaojun Bai, Christian Bischof, Susan Blackford,
%    James Demmel, Jack Dongarra, Jeremy Du Croz, Anne Greenbaum,
%    Sven Hammarling, Alan McKenney, Danny Sorensen,
%    LAPACK User's Guide,
%    Third Edition,
%    SIAM, 1999,
%    LC: QA76.73.F25L36
%
%  Parameters:
%
%    Input, integer M, the number of spatial dimensions.
%
%    Input, integer N, the number of data points.
%
%    Input, integer BASIS_NUM, the number of basis vectors to be extracted.
%
%    Input, real A(M,N), the matrix whose singular values 
%    are to be computed.  
%
%    Output, real U(M,BASIS_NUM), the first BASIS_NUM left singular vectors.
%
%    Output, real S(BASIS_NUM), the first BASIS_NUM singular values.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SINGULAR_VECTORS\n' );
  fprintf ( 1, '  For an MxN matrix A in general storage,\n' );
  fprintf ( 1, '  The LAPACK routine DGESVD computes the\n' );
  fprintf ( 1, '  singular value decomposition:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    A = U * S * V''\n' );
  fprintf ( 1, '\n' );

  [ u, s, v ] = svd ( a );
%
%  Copy out the first BASIS_NUM singular values.
%
  s = s(1:basis_num);
%
%  Copy out the first BASIS_NUM singular vectors.
%
  u = u(1:m,1:basis_num);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The leading singular values:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : basis_num
    fprintf ( 1, '  %4d  %16f\n', i, s(i) );
  end

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
