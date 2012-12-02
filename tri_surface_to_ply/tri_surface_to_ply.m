function tri_surface_to_ply ( prefix )

%*****************************************************************************80
%
%% TRI_SURFACE_TO_PLY converts a TRI_SURFACE file to a PLY file.
%
%  Usage:
%
%    tri_surface_to_ply ( 'prefix' )
%
%    where 'prefix' is the common prefix for the files:
%
%    * prefix_nodes.txt      the tri_surface node file to be read;
%    * prefix_elements.txt   the tri_surface element file to be read;
%    * prefix.ply            the ply file to be created.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string PREFIX, the common filename prefix.
%
  verbose = 0;

  if ( verbose )
    timestamp ( );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_SURFACE_TO_PLY\n' );
    fprintf ( 1, '  MATLAB version\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Read the nodes and elements of a TRI_SURFACE file.\n' );
    fprintf ( 1, '  Create a corresponding PLY file.\n' );
  end
%
%  If at least one command line argument, it's the prefix.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_SURFACE_DISPLAY:\n' );
    prefix = input ( 'Enter the common filename prefix:' );

  else

  end
%
%  Create the filenames.
%
  node_filename    = strcat ( prefix, '_nodes.txt' );
  element_filename = strcat ( prefix, '_elements.txt' );
  ply_filename     = strcat ( prefix, '.ply' );
%
%  Read the node data.
%
  [ dim_num, node_num ] = r8mat_header_read ( node_filename );

  if ( verbose )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Spatial dimension of nodes = %d\n', dim_num );
    fprintf ( 1, '  Number of nodes =            %d\n', node_num );
  end

  if ( dim_num ~= 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_SURFACE_DISPLAY - Fatal error!\n' );
    fprintf ( 1, '  The nodes do not have dimension 3.\n' );
    error ( 'TRI_SURFACE_DISPLAY - Fatal error!\n' );
  end

  node_xyz = r8mat_data_read ( node_filename, dim_num, node_num );

  if ( verbose )
    r8mat_transpose_print_some ( dim_num, node_num, node_xyz, ...
      1, 1, dim_num, 5, '  First five nodes:' );
  end
%
%  Read the element data.
%
  [ element_order, element_num ] = i4mat_header_read ( element_filename );

  if ( verbose )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Order of elements =  %d\n', element_order );
    fprintf ( 1, '  Number of elements = %d\n', element_num );
  end

  if ( element_order ~= 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_SURFACE_DISPLAY - Fatal error!\n' );
    fprintf ( 1, '  The elements do not have order 3.\n' );
    error ( 'TRI_SURFACE_DISPLAY - Fatal error!\n' );
  end

  element_node = i4mat_data_read ( element_filename, element_order, ...
    element_num );

  if ( verbose )
    i4mat_transpose_print_some ( element_order, element_num, element_node, ...
      1, 1, element_order, 5, '  First five elements:' );
  end
%
%  Convert the data.
%
  ply_data = tri_surface_data_to_ply_data ( node_xyz, element_node );
%
%  Write the PLY file.
%
  ply_write ( ply_data, ply_filename, 'ascii' );

  fprintf ( 'Created the file "%s"\n', ply_filename );
%
%  Terminate.
%
  if ( verbose )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_SURFACE_DISPLAY:\n' );
    fprintf ( 1, '  Normal end of execution.\n' );

    fprintf ( 1, '\n' );
    timestamp ( );
  end

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
%    08 February 2010
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
    return
  end

  column_num = s_word_count ( line );

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
%    08 February 2010
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
function table = i4mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% I4MAT_DATA_READ reads data from an I4MAT file.
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
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer M, N, the number of rows and columns in the data.
%
%    Output, integer TABLE(M,N), the point coordinates.
%

%
%  Build up the format string for reading M real numbers.
%
  string = ' ';

  for i = 0 : m
    string = strcat ( string, ' %d' );
  end

  input_unit = fopen ( input_filename );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'I4MAT_DATA_READ - Error!' );
  end

  table = zeros ( m, n );

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'I4MAT_DATA_READ - Error!\n' );
      fprintf ( 1, '  End of input while reading data.\n' );
      error ( 'I4MAT_DATA_READ - Error!' );
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
function [ m, n ] = i4mat_header_read ( input_filename )

%*****************************************************************************80
%
%% I4MAT_HEADER_READ reads the header from an I4MAT file.
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
    fprintf ( 1, 'I4MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data columns in\n' );
    fprintf ( 1, '  the file %s.\n', input_filename );
  end

  n = file_row_count ( input_filename );

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data rows in\n' );
    fprintf ( 1, '  the file %s\n', input_filename );
  end

  return
end
function i4mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% I4MAT_TRANSPOSE_PRINT_SOME prints some of an I4MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, a title.
%
  incx = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  for i2lo = max ( ilo, 1 ) : incx : min ( ihi, m )

    i2hi = i2lo + incx - 1;
    i2hi = min ( i2hi, m );
    i2hi = min ( i2hi, ihi );

    inc = i2hi + 1 - i2lo;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row: ' );
    for i = i2lo : i2hi
      fprintf ( 1, '%7d  ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );
    fprintf ( 1, '\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d  ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%7d  ', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
function ply_write ( Elements, Path, Format, Str )

%*****************************************************************************80
%
%% PLY_WRITE writew 3D data as a PLY file.
%
%   PLY_WRITE(DATA,FILENAME) writes the structure DATA as a binary
%   PLY file.  Every field of DATA is interpreted as an element
%   and every subfield as an element property.  Each subfield of
%   property data must either be an array or a cell array of
%   arrays.  All property data in an element must have the same
%   length.
%
%   A common PLY data structure has the following fields:
%      DATA.vertex.x = x coordinates, [Nx1] real array
%      DATA.vertex.y = y coordinates, [Nx1] real array
%      DATA.vertex.z = z coordinates, [Nx1] real array
%
%      DATA.face.vertex_indices = vertex index lists,
%         an {Mx1} cell array where each cell holds a one-
%         dimesional array (of any length) of vertex indices.
%   Some other common data fields:
%      DATA.vertex.nx = x coordinate of normal, [Nx1] real array
%      DATA.vertex.ny = y coordinate of normal, [Nx1] real array
%      DATA.vertex.nz = z coordinate of normal, [Nx1] real array
%
%      DATA.edge.vertex1 = index to a vertex, [Px1] integer array
%      DATA.edge.vertex2 = second vertex index, [Px1] integer array
%   Many other fields and properties can be added.  The PLY format
%   is not limited to the naming in the examples above -- they are
%   only the conventional naming.
%
%   PLY_WRITE(DATA,FILENAME,FORMAT) write the PLY with a specified
%   data format, where FORMAT is
%      'ascii'                  ASCII text data
%      'binary_little_endian'   binary data, little endian
%      'binary_big_endian'      binary data, big endian (default)
%
%   PLY_WRITE(DATA,FILENAME,FORMAT,'double') or
%   PLY_WRITE(DATA,FILENAME,'double') write floating-point data as
%   double precision rather than in the default single precision.
%
%   Example:
%   % make a cube
%   clear Data;
%   Data.vertex.x = [0;0;0;0;1;1;1;1];
%   Data.vertex.y = [0;0;1;1;0;0;1;1];
%   Data.vertex.z = [0;1;1;0;0;1;1;0];
%   Data.face.vertex_indices = {[0,1,2,3],[7,6,5,4], ...
%         [0,4,5,1],[1,5,6,2],[2,6,7,3],[3,7,4,0]};
%   ply_write(Data,'cube.ply','ascii');
%
%  Modified:
%
%    01 March 2007
%
%  Author:
%
%    Pascal Getreuer 2004
%
  if ( nargin < 4 )

    Str = '';

    if ( nargin < 3 )
      Format = 'binary_big_endian';
    elseif strcmpi(Format,'double')
      Str = 'double';
      Format = 'binary_big_endian';
    end

  end

  [ fid, Msg ] = fopen ( Path, 'wt' );

  if ( fid == -1 )
    error(Msg);
  end

  PlyTypeNames = {'char','uchar','short','ushort','int','uint','float','double', ...
    'char8','uchar8','short16','ushort16','int32','uint32','float32','double64'};
  FWriteTypeNames = {'schar','uchar','int16','uint16','int32','uint32','single','double'};
  MatlabTypeNames = {'int8','uint8','int16','uint16','int32','uint32','single','double'};
  PrintfTypeChar = {'%d','%u','%d','%u','%d','%u','%-.6f','%-.14e'};
  IntegerDataMin = [-128,0,-2^15,-2^31,0];
  IntegerDataMax = [127,255,2^16-1,2^31-1,2^32-1];
%
%  write PLY header
%
  fprintf(fid,'ply\nformat %s 1.0\ncomment created by MATLAB ply_write\n',Format);
  ElementNames = fieldnames(Elements);
  NumElements = length(ElementNames);
  Data = cell(NumElements,1);

  for i = 1 : NumElements

    eval(['tmp=isa(Elements.',ElementNames{i},',''struct'');']);

    if ( tmp )
      eval(['PropertyNames{i}=fieldnames(Elements.',ElementNames{i},');']);
    else
      PropertyNames{i} = [];
    end

    if ( ~isempty(PropertyNames{i}) )
      eval(['Data{i}{1}=Elements.',ElementNames{i},'.',PropertyNames{i}{1},';']);
      ElementCount(i) = prod(size(Data{i}{1}));
      Type{i} = zeros(length(PropertyNames{i}),1);
    else
      ElementCount(i) = 0;
    end

    fprintf(fid,'element %s %u\n',ElementNames{i},ElementCount(i));

    for j = 1 : length(PropertyNames{i})

      eval(['Data{i}{j}=Elements.',ElementNames{i},'.',PropertyNames{i}{j},';']);

      if ( ElementCount(i) ~= prod(size(Data{i}{j})) )
        fclose(fid);
        error('All property data in an element must have the same length.');
      end

      if ( iscell(Data{i}{j}) )
        Type{i}(j) = 9;
        Data{i}{j} = Data{i}{j}{1};
      end

      for k = 1 : length(MatlabTypeNames)
        if ( isa(Data{i}{j},MatlabTypeNames{k}) )
          Type{i}(j) = Type{i}(j) + k;
          break;
        end
      end

      if ( ~rem(Type{i}(j),9) )
        fclose(fid);
        error('Unsupported data structure.');
      end
%
%  Try to convert float data to integer data
%
%  Array data.
%
      if ( Type{i}(j) <= 8 )
        if any(strcmp({'single','double'},MatlabTypeNames{Type{i}(j)}))
          if ~any(floor(Data{i}{j}) ~= Data{i}{j})  % data is integer
            MinValue = min(min(Data{i}{j}));
            MaxValue = max(max(Data{i}{j}));

               % choose smallest possible integer data format
            tmp = max(min(find(MinValue >= IntegerDataMin)),min(find(MaxValue <= IntegerDataMax)));

            if ~isempty(tmp)
              Type{i}(j) = tmp;
            end
          end
        end
      else        % cell array data
        eval(['Data{i}{j}=Elements.',ElementNames{i},'.',PropertyNames{i}{j},';']);
        tmp = 1;

        for k = 1:prod(size(Data{i}{j}))
          tmp = tmp & all(floor(Data{i}{j}{k}) == Data{i}{j}{k});
        end

        if tmp  % data is integer
          MinValue = inf;
          MaxValue = -inf;

          for k = 1:prod(size(Data{i}{j}))
            MinValue = min(MinValue,min(Data{i}{j}{k}));
            MaxValue = max(MaxValue,max(Data{i}{j}{k}));
          end

            % choose smallest possible integer data format
          tmp = max(min(find(MinValue >= IntegerDataMin)),min(find(MaxValue <= IntegerDataMax)));

          if ~isempty(tmp)
            Type{i}(j) = tmp + 9;
          end

        end
      end

      % convert double to single if specified
      if rem(Type{i}(j),9) == 8 & ~strcmpi(Str,'double')
        Type{i}(j) = Type{i}(j) - 1;
      end

      if Type{i}(j) <= 8
        fprintf(fid,'property %s %s\n',PlyTypeNames{Type{i}(j)},PropertyNames{i}{j});
      else
        fprintf(fid,'property list uchar %s %s\n',PlyTypeNames{Type{i}(j)-9},PropertyNames{i}{j});
      end
    end
  end

  fprintf(fid,'end_header\n');

  switch Format
    case 'ascii'
      Format = 0;
    case 'binary_little_endian'
      fclose(fid);
      fid = fopen(Path,'a','ieee-le');
      Format = 1;
    case 'binary_big_endian'
      fclose(fid);
      fid = fopen(Path,'a','ieee-be');
      Format = 2;
  end

  for i = 1 : NumElements
    if ~isempty(PropertyNames{i})
      if ~Format          % write ASCII data
        for k = 1:ElementCount(i)
          for j = 1:length(PropertyNames{i})
            if Type{i}(j) <= 8
              fprintf(fid,[PrintfTypeChar{Type{i}(j)},' '],Data{i}{j}(k));
            else
              fprintf(fid,'%u%s ',length(Data{i}{j}{k}),sprintf([' ',PrintfTypeChar{Type{i}(j)-9}],Data{i}{j}{k}));
            end
          end

          fprintf(fid,'\n');
        end
      else            % write binary data
        if all(Type{i} <= 8) & all(Type{i} == Type{i}(1))
          % property data without list types (fast)
          tmp = zeros(length(PropertyNames{i}),ElementCount(i));

          for j = 1:length(PropertyNames{i})
            tmp(j,:) = Data{i}{j}(:)';
          end

          fwrite(fid,tmp,FWriteTypeNames{Type{i}(j)});
        elseif all(Type{i} > 8)
        % only list types
          Type{i} = Type{i} - 9;

          if length(PropertyNames{i}) == 1
           % only one list property
            tmp = FWriteTypeNames{Type{i}(1)};

            for k = 1:ElementCount(i)
              fwrite(fid,length(Data{i}{1}{k}),'uchar');
              fwrite(fid,Data{i}{1}{k},tmp);
            end
          else
           % multiple list properties
            for k = 1:ElementCount(i)
              for j = 1:length(PropertyNames{i})
                fwrite(fid,length(Data{i}{j}{k}),'uchar');
                fwrite(fid,Data{i}{j}{k},FWriteTypeNames{Type{i}(j)});
              end
            end
          end
        else
        % mixed type
          for k = 1:ElementCount(i)
            for j = 1:length(PropertyNames{i})
              if Type{i}(j) <= 8
                fwrite(fid,Data{i}{j}(k),FWriteTypeNames{Type{i}(j)});
              else
                fwrite(fid,length(Data{i}{j}{k}),'uchar');
                fwrite(fid,Data{i}{j}{k},FWriteTypeNames{Type{i}(j)-9});
              end
            end
          end
        end
      end
    end
  end

  fclose(fid);

  return
end
function table = r8mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% R8MAT_DATA_READ reads data from an R8MAT file.
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
%    08 February 2010
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
  end

  table = zeros(m,n);

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
function r8mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8MAT_TRANSPOSE_PRINT_SOME prints some of an R8MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, a title.
%
  incx = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  for i2lo = max ( ilo, 1 ) : incx : min ( ihi, m )

    i2hi = i2lo + incx - 1;
    i2hi = min ( i2hi, m );
    i2hi = min ( i2hi, ihi );

    inc = i2hi + 1 - i2lo;
    
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row: ' );
    for i = i2lo : i2hi
      fprintf ( 1, '%7d       ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%12f', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

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
function ply_data = tri_surface_data_to_ply_data ( node_xyz, triangle_node )

%*****************************************************************************80
%
%% TRI_SURFACE_DATA_TO_PLY_DATA converts TRI_SURFACE data to PLY data.
%
%  Discussion:
%
%    This routine converts data from the TRI_SURFACE to PLY format.
%    Specifically, given a 3 by NODE_NUM array of node coordinates,
%    and a 3 by TRIANGLE_NUM array of node indices that form triangles,
%    the routine creates a MATLAB data structure corresponding to
%    the data in a PLY file.
%
%    The PLY data can be written to a PLY file using the PLY_WRITE
%    routine.
%
%  Example:
%
%    The following TRI_SURFACE data describes the surface of a pyramid:
%
%      node_xyz = [ 0,0,0; 1,0,0; 1,1,0; 0,1,0; 0.5,0.5,1.6 ]';
%
%      triangle_node = [ 2,1,4; 2,4,3; 1,2,5; 1,5,4; 4,5,3; 2,3,5 ]';
%
%    It can be viewed with these MATLAB commands:
%
%      trisurf ( triangle_node', node_xyz(1,:), node_xyz(2,:), node_xyz(3,:) );
%      axis equal;
%
%    The TRI_SURFACE data can be converted to PLY format:
%
%      ply_data = tri_surface_to_ply ( node_xyz, triangle_node );
%
%    The PLY data can be written to a PLY file.
%
%      ply_write ( ply_data, 'pyramid.ply', 'ascii' );
%
%  Modified:
%
%    28 February 2007
%
%  Author:
%
%    Pascal Getreuer, 2004
%    Modifications by John Burkardt
%
%  Parameters:
%
%    Input, real NODE_XYZ(3,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer TRIANGLE_NODE(3,TRIANGLE_NUM), the node indices that
%    form each triangle.  The node indices are 1-based.
%
%    Output, data structure PLY_DATA, the information
%    about the triangular mesh, suitable for storage as a PLY file.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_SURFACE_TO_PLY - Fatal error!\n' );
    fprintf ( 1, '  Not enough input arguments.\n' );
    fprintf ( 1, '  Input must include NODE_XYZ and TRIANGLE_NODE.\n' );
    error ( 'TRI_SURFACE_TO_PLY - Not enough input arguments.' );
  end

  if ( size ( node_xyz, 1 ) ~= 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_SURFACE_TO_PLY - Fatal error!\n' );
    fprintf ( 1, '  NODE_XYZ must have 3 rows.\n' );
    error ( 'TRI_SURFACE_TO_PLY - NODE_XYZ must have 3 rows.' ); 
  end

  if ( size ( triangle_node, 1 ) ~= 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_SURFACE_TO_PLY - Fatal error!\n' );
    fprintf ( 1, '  TRIANGLE_NODE must have 3 rows.\n' );
    error ( 'TRI_SURFACE_TO_PLY - TRIANGLE_NODE must have 3 rows.' ); 
  end
%
%  Store the coordinates of the vertices into the PLY_DATA structure.
%
  node_num = size ( node_xyz, 2 );

  ply_data.vertex.x = node_xyz(1,1:node_num);
  ply_data.vertex.y = node_xyz(2,1:node_num);
  ply_data.vertex.z = node_xyz(3,1:node_num);
%
%  Store the indices of the vertices that form the (triangular)
%  faces.
%
  triangle_num = size ( triangle_node, 2 );

  ply_data.face.vertex_indices = cell ( triangle_num, 1 );
%
%  Since PLY uses 0-based indices, we need to subtract 1 from each.
%
  for k = 1 : triangle_num
    ply_data.face.vertex_indices{k} = triangle_node(:,k) - 1;
  end

  return
end
