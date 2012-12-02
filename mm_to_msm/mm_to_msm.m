function [ A, rows, cols, entries, rep, field, symm ] = mm_to_msm ( filename )

%*****************************************************************************80
%
%% MM_TO_MSM converts a Matrix Market file to a MATLAB sparse matrix.
%
%  Discussion:
%
%    This routine reads the contents of the Matrix Market file 'filename'
%    into the matrix 'A'.  
%
%    'A' will be either sparse or full, depending on the Matrix Market 
%    format indicated by
%      'coordinate' (coordinate sparse storage), or
%      'array' (dense array storage).
%
%    The data will be duplicated as appropriate if symmetry is 
%    indicated in the header.
%
%  Modified:
%
%    25 March 2006
%
%  Parameters:
%
%    Input, string FILENAME, the name of the Matrix Market file to read.
%
%    Output, matrix A, the matrix read from the file.  It may be in sparse
%    or dense format.
%
%    Output, integer ROWS, COLS, the number of rows and columns 
%    in the matrix.
%
%    Output, integer ENTRIES, the number of nonzero entries for a sparse
%    matrix, or the number of rows times columns for a dense matrix.
%
%    Output, string REP, indicates how the matrix was stored.
%    'coordinate' for sparse storage by coordinates,
%    'array' for dense matrix storage.
%
%    Output, string FIELD, the arithmetic type of the entries,
%    'complex', the matrix is stored as complex numbers;
%    'double', the matrix is stored as double precision numbers;
%    'integer', the matrix is stored as integers;
%    'pattern', just the row and column indices of nonzeros.
%       The 'pattern' option cannot be used for a dense matrix.
%    'real', the matrix is stored as real numbers;
%
%    Output, string SYMM, the symmetry type, 
%    'general', no symmetry;
%    'hermitian', A* = A;
%    'skew-symmetric', A' = -A,
%    'symmetric', A' = A.
%
  mmfile = fopen ( filename, 'r' );

  if ( mmfile == -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
    fprintf ( 1, '  The file could not be opened.\n' );
    error ( 'MM_TO_MSM - File not found' );
  end;

  header = fgets ( mmfile );

  if ( header == -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
    fprintf ( 1, '  The file is empty.\n' );
    error ( 'MM_TO_MSM - Empty file.' )
  end
%
%  If using a version of Matlab for which strtok is not
%  defined, substitute 'gettok' for 'strtok' in the 
%  following lines, and download gettok.m from the
%  Matrix Market site.    
%
  [ head0, header ] = strtok ( header );
  [ head1, header ] = strtok ( header );
  [ rep,   header ] = strtok ( header );
  [ field, header ] = strtok ( header );
  [ symm,  header ] = strtok ( header );
%
%  Force the strings to be in lowercase.
%
  head1 = lower ( head1 );
  rep   = lower ( rep );
  field = lower ( field );
  symm  = lower ( symm );

  if ( length ( symm ) == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
    fprintf ( 1, '  The header was not recognized.\n' );
    fprintf ( 1, '  The correct format is:\n' );
    fprintf ( 1, '%%MatrixMarket matrix representation field symmetry\n' );
    error ( 'MM_TO_MSM - Check header line.' )
  end

  if ( ~strcmp ( head0, '%%MatrixMarket' ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
    error ( 'MM_TO_MSM - Not a valid MatrixMarket header.' )
  end

  if ( ~strcmp ( head1, 'matrix' ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
    fprintf ( 1, '  This Matrix Market file is not of type "matrix".\n' );
    fprintf ( 1, '  It is of a type "%s", which this program cannot handle.\n', headl );
    error ( 'MM_TO_MSM - Exit!' );
  end
%
%  Read through comments, ignoring them.
%
  commentline = fgets ( mmfile );
  while ( 0 < length ( commentline ) & commentline(1) == '%' )
    commentline = fgets ( mmfile );
  end
%
%  We are past the comments.  
%  Now read size information, and branch according to sparse or dense format
%

%  
%  COORDINATE: Read a matrix given in sparse coordinate matrix format.
%
  if ( strcmp ( rep, 'coordinate' ) )

    [ sizeinfo, count ] = sscanf ( commentline, '%d%d%d' );

    while ( count == 0 )

      commentline =  fgets ( mmfile );

      if ( commentline == -1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
        error ( 'MM_TO_MSM - End-of-file before size information found.' )
      end

      [ sizeinfo, count ] = sscanf ( commentline, '%d%d%d' );

      if ( 0 < count & count ~= 3 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
        fprintf ( 1, '  Invalid size specification line.\n' );
        error ( 'MM_TO_MSM - Invalid size specification line.' )
      end

    end

    rows = sizeinfo(1);
    cols = sizeinfo(2);
    entries = sizeinfo(3);
%
%  Real/double precision/integer-valued entries.
%
    if  ( strcmp ( field, 'real' ) | ...
          strcmp ( field, 'double' ) | ...
          strcmp ( field, 'integer' ) )
  
      T = fscanf ( mmfile, '%f' )
      
      if ( size ( T ) ~= 3 * entries )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
        fprintf ( 1, '  The data file does not contain the expected\n' );
        fprintf ( 1, '  amount of data.  Check that the number of data\n' );
        fprintf ( 1, '  lines matches the count of nonzeros\n.');
        error ( 'MM_TO_MSM - Missing numerical data');
      end

      T = reshape ( T, 3, entries )';

      A = sparse ( T(:,1), T(:,2), T(:,3), rows, cols );
%
%  Complex-valued entries.
%
    elseif ( strcmp ( field, 'complex' ) )
  
      T = fscanf ( mmfile, '%f', 4 );

      if ( size ( T ) ~= 4 * entries )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
        fprintf ( 1, '  File does not contain expected amount of data.\n' );
        error ( 'MM_TO_MSM - Invalid data.' );
      end

      T = reshape ( T, 4, entries )';
      A = sparse ( T(:,1), T(:,2), T(:,3) + T(:,4) * i, rows, cols );
%
%  No values given.
%
    elseif ( strcmp ( field, 'pattern' ) )
  
      T = fscanf ( mmfile, '%f' );

      if ( size ( T ) ~= 2 * entries )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
        fprintf ( 1, '  File does not contain expected amount of data.\n' );
        error ( 'MM_TO_MSM - Invalid data.' );
      end

      T = reshape ( T, 2, entries )';
      A = sparse ( T(:,1), T(:,2), ones ( entries, 1 ), rows, cols );

    end
%
%  Read a matrix given in dense array format.
%
  elseif ( strcmp ( rep, 'array' ) ) 

    [ sizeinfo, count ] = sscanf ( commentline, '%d%d' );

    while ( count == 0 )

      commentline =  fgets ( mmfile );

      if ( commentline == -1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
        fprintf ( 1, '  End-of-file reached before size information!\n' );
        error ( 'MM_TO_MSM - End-of-file reached before size information.' )
      end

      [ sizeinfo, count ] = sscanf ( commentline, '%d%d' );

      if ( 0 < count & count ~= 2 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
        fprintf ( 1, '  Invalid size specification line.\n' );
        error ( 'MM_TO_MSM - Invalid size specification line.' )
      end

    end

    rows = sizeinfo(1);
    cols = sizeinfo(2);
    entries = rows * cols;
%
%  Real/double/integer-valued entries.
%
    if  ( strcmp ( field, 'real' ) | ...
          strcmp ( field, 'double' ) | ...
          strcmp ( field, 'integer' ) )

      A = fscanf ( mmfile, '%f' );

      if ( strcmp ( symm, 'symmetric' ) | ...
           strcmp ( symm, 'hermitian' ) | ...
           strcmp ( symm, 'skew-symmetric' ) ) 

        for j = 1 : cols-1
          currenti = j * rows;
          A = [ A(1:currenti); zeros(j,1); A(currenti+1:length(A)) ];
        end
      
      elseif ( strcmp ( symm, 'general' ) )

      else

        fprintf ( 1, '\n' );
        fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
        fprintf ( 1, '  Unrecognized symmetry "%s".\n', symm );
        error ( 'MM_TO_MSM - Unrecognized symmetry.' );

      end

      A = reshape ( A, rows, cols );
%
%  Complex-valued entries.
%
    elseif ( strcmp ( field, 'complex' ) )

      tmpr = fscanf ( mmfile, '%f', 1 );
      tmpi = fscanf ( mmfile, '%f', 1 );
      A  = tmpr + tmpi * i;

      for j = 1 : entries-1
        tmpr = fscanf ( mmfile, '%f', 1 );
        tmpi = fscanf ( mmfile, '%f', 1 );
        A  = [ A; tmpr + tmpi * i ];
      end

      if ( strcmp ( symm, 'symmetric' ) | ...
           strcmp ( symm, 'hermitian' ) | ...
           strcmp ( symm, 'skew-symmetric' ) ) 

        for j = 1 : cols-1
          currenti = j * rows;
          A = [ A(1:currenti); zeros(j,1); A(currenti+1:length(A)) ];
        end

      elseif ( strcmp ( symm, 'general' ) )

      else

        fprintf ( 1, '\n' );
        fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
        fprintf ( 1, '  Unrecognized symmetry = "%s".\n', symm );
        error ( 'MM_TO_MSM - Unrecognized symmetry.' );

      end

      A = reshape ( A, rows, cols );
%
%  "PATTERN", which makes no sense for "DENSE" matrices.
%
    elseif ( strcmp ( field, 'pattern' ) )

     fprintf ( 1, '\n' );
     fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
     fprintf ( 1, '  A DENSE matrix storage format cannot be used\n' );
     fprintf ( 1, '  with a PATTERN type.\n' );
     error ( 'MM_TO_MSM - DENSE matrix storage with PATTERN format.' );
%
%  Unknown matrix type.
%
    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'MM_TO_MSM - Fatal error!\n' );
      fprintf ( 1, '  Invalid matrix type = "%s"\n', field );
      error ( 'MM_TO_MSM - Invalid matrix type specification.' );

    end

  end
  
  fclose ( mmfile );
%
%  If the matrix is symmetric, skew-symmetric or Hermitian, 
%  duplicate the lower triangular part and modify entries as appropriate:
%
  if ( strcmp ( symm, 'symmetric' ) )
    A = A + A.' - diag ( diag ( A ) );
    entries = nnz ( A );
  elseif ( strcmp ( symm, 'hermitian' ) )
    A = A + A' - diag ( diag ( A ) );
    entries = nnz ( A );
  elseif ( strcmp ( symm, 'skew-symmetric' ) )
    A = A - A';
    entries = nnz ( A );
  end

  return
end
