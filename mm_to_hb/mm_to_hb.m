function mm_to_hb ( input_file, output_file )

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
%  Usage:
%
%    mm_to_hb ( input_file, output_file )
%
%  Modified:
%
%    25 March 2006
%
%  Parameters:
%
%    Input, string INPUT_FILE, the Matrix Market file to read.
%
%    Input, string OUTPUT_FILE, the Harwell Boeing file to be created.
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_TO_HB\n' );
  fprintf ( 1, '  MATLAB version\n' );

  a = mm_to_msm ( input_file );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read input file "%s".\n', input_file );

  msm_to_hb ( output_file, a );

  fprintf ( 1, '  Wrote output file "%s".\n', output_file );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_TO_HB\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  timestamp ( );

  return
end
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
  
      T = fscanf ( mmfile, '%f' );

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
function msm_to_hb ( output_filename, A, rhs, title, key, type, ifmt, job ) 

%*****************************************************************************80
%
%% MSM_TO_HB writes a MATLAB Sparse Matrix to a Harwell Boeing Sparse Matrix file.
%
%  Usage: 
%
%    For full control:
%
%      msm_to_hb ( output_filename, A, rhs, 'title', 'key', 'type', ifmt, job ) 
%
%    or, to use defaults:
%
%      msm_to_hb ( output_filename, A )
%
%  Modified:
%
%    28 April 2004
%
%  Author:
%
%    Xiaoye Li, UC Berkeley. 
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the name of the file to which the information
%    should be written.
%
%    Input, sparse matrix A, the NROW by NCOL matrix, stored in MATLAB sparse 
%    matrix format, which is to be written to the file.
%
%    Input, real RHS(NRHS,NROW), the right-hand side array, accessed only if ( 2 < JOB).
%
%    Input, string TITLE, a title of up to 72 characters.
%    TITLE defaults to 'Title'.
%
%    Input, string KEY, a key for the matrix, of up to 8 characters.
%    KEY defaults to 'Key'.
%
%    Input, string TYPE, the HB type for the matrix, of exactly 3 characters.
%    TYPE defaults to 'RUA' (real, unsymmetric, assembled).
%
%    Input, integer IFMT, specifies the output format of the numerical values.
%    * IFMT < 100 chooses the format Dxx.yy, in which yy is precisely IFMT 
%      and xx is IFMT+7.
%    * 100 < IFMT chooses the format Fxx.yy, in which the length of the mantissa 
%      yy is the integer mod(ifmt,100) and the length of the integer part is IFMT/100.
%    For example:
%    * IFMT =   4 means  E11.4   [-]x.xxxxE+ee    
%    * IFMT = 104 means  F7.4    [-]x.xxxx
%    IFMT defaults to 8.
%
%    Input, integer JOB, indicates what is to be written out.
%    * 1, write structure only, the index arrays JA and IA.
%    * 2, write structure and matrix, A, JA, IA
%    * 3, write structure, matrix, and one right hand side: A, JA, IA, RHS.
%    * K+2, write structure, matrix and K successive right-hand sides.
%    JOB defaults to 2.
%
  [ nrow, ncol ] = size ( A );
  nnzeros = nnz ( A );
  n = ncol;
%
%  Coordinate form --> compressed column format: ja,ia,a
%
  k = 0;
  ja(1) = k + 1;
  for j = 1 : n 
    [ rows, temp, vals ] = find ( A(:,j) );
    sz = size ( rows ); 
    for k2 = 1 : sz
      k = k + 1;
      ia(k) = rows(k2);
      a(k) = vals(k2);
    end
    ja(j+1) = k + 1;
  end

  fid = fopen ( output_filename, 'wt+' );

  if ( fid < 0 ); 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MSM_TO_HB - Fatal error!\n' );
    fprintf ( 1, '  Cannot open the output file %s.\n', output_filename );
    error(['Can''t open file "' output_filename '" for writing.']); 
  end;
%
%  Default format
%
  if ( nargin < 4 )
    title = 'Title';
  end

  if ( nargin < 5 )
    key = 'Key';
  end

  if ( nargin < 6 )
    type = 'RUA';
  end

  if ( nargin < 7 )
    ifmt = 8;
  end

  if ( nargin < 8 )
    job = 2;
  end
%
%  Determine the FORTRAN format for the column pointer array.
%
  len = ceil ( log10 ( 0.1 + nnzeros + 1 ) ) + 1;
  nperline = min ( floor ( 80 / len ), ncol+1 );
  ptr_len = len;
  ptr_nperline = nperline;
  ptrcrd = floor ( ncol / nperline ) + 1;
  s1 = int2str ( len );
  s2 = int2str ( nperline );
  ptrfmt = [ '(' s1 'I' s2 ')' ];
%
%  Determine the FORTRAN format for the row index array.
%
  nperline = min ( floor ( 80 / len ), nnzeros );
  ind_len = len;
  ind_nperline = nperline;
  indcrd = floor ( ( nnzeros-1 ) / nperline ) + 1;
  s1 = int2str ( nperline );
  s2 = int2str ( len );
  indfmt = [ '(' s1 'I' s2 ')' ];
%
%  Determine the FORTRAN format for array and RHS values.
%
  valcrd = 0;
  rhscrd = 0;
  c_valfmt = [];

  if ( 1 < job )
    if ( 100 <= ifmt )
      ihead = floor ( ifmt / 100 );
      ifmt = ifmt - 100 * ihead;
      len = ihead + ifmt + 2;
      nperline = floor ( 80 / len );
      c_len = len;
      for i = 1 : nperline
        c_valfmt = [ c_valfmt '%' int2str ( c_len ) '.' int2str ( ifmt ) 'f' ];
      end
      valfmt = [ int2str ( nperline ) 'F' int2str ( len ) '.' int2str ( ifmt ) ];
    else
      len = ifmt + 7;
      nperline = floor ( 80 / len );
      c_len = len;
      s1 = int2str ( c_len );
      s2 = int2str ( ifmt );
      for i = 1 : nperline
        c_valfmt = [ c_valfmt '%' s1 '.' s2 'E' ];
      end
      s1 = int2str ( nperline );
      s2 = int2str ( len );
      s3 = int2str ( ifmt );
      valfmt = [ s1 'E' s2 '.' s3 ];
    end
    valcrd = floor ( ( nnzeros - 1 ) / nperline ) + 1;
    valfmt = [ '(' valfmt ')' ];
    c_valfmt = [ c_valfmt '\n' ];
  end

  nrhs = job - 2;
  if ( 1 <= nrhs )
    rhscrd = floor ( ( nrhs * nrow - 1 ) / nperline ) + 1;
  end

  totcrd = ptrcrd + indcrd + valcrd + rhscrd;
%
%  Write the header.
%
%  Line 1.
%
  t = title; 
  m = size ( t, 2 );

  for i = m+1 : 72
    t = [ t ' ' ];
  end
  fprintf ( fid, '%72s', t );
  t = key; 
  m = size ( t, 2 );
  for i = m+1 : 8
    t = [ t ' ' ]; 
  end
  fprintf ( fid, '%8s\n', t );
%
%  Line 2
%
  fprintf ( fid, '%14d%14d%14d%14d%14d\n', totcrd, ptrcrd, indcrd, valcrd, rhscrd );
%
%  Line 3
%
  t = type; 
  m = size ( t, 2 );
  for i = m+1 : 14 
    t = [ t ' ' ]; 
  end
  fprintf ( fid, '%14s', t );
  fprintf ( fid, '%14i%14i%14i%14i\n', nrow, ncol, nnzeros, nrhs );
%
%  Line 4
%
  t = ptrfmt; 
  m = size ( t, 2 );
  for i = m+1 : 16
    t = [ t ' ' ];
  end
  fprintf ( fid, '%16s', t );
  t = indfmt; 
  m = size ( t, 2 );
  for i = m+1 : 16
    t = [ t ' ' ];
  end
  fprintf ( fid, '%16s', t );
  t = valfmt;
  m = size ( t, 2 );
  for i = m+1 : 20
    t = [ t ' ' ];
  end
  fprintf ( fid, '%20s', t );
  fprintf ( fid, '%20s\n', t );
%
%  Column pointers.
%
  t = [];
  s1 = int2str ( ptr_len );
  for j = 1 : ptr_nperline
    t = [ t '%' s1 'd' ];
  end
  t = [ t '\n' ];
  fprintf ( fid, t, ja(1:ncol+1) ); 
  if ( ptr_nperline < ncol + 1 & ...
    ( ncol + 1 ) / ptr_nperline ~= floor ( ( ncol+1 ) / ptr_nperline ) )
    fprintf ( fid, '\n' );
  end
%
%  Row indices.
%
  t = [];
  s1 = int2str ( ind_len );
  for j = 1 : ind_nperline
    t = [ t '%' s1 'd' ]; 
  end
  t = [ t '\n' ]; 
  fprintf ( fid, t, ia(1:nnzeros) ); 
  if ( ind_nperline < nnzeros & ...
    nnzeros / ind_nperline ~= floor ( nnzeros / ind_nperline ) )
    fprintf ( fid, '\n' );
  end
%
%  Numerical values of nonzero elements of the matrix.
%
  if ( 2 <= job )
    if ( job == 2 )
    	fprintf ( fid, c_valfmt, a(1:nnzeros) );
    else
    	fprintf ( fid, c_valfmt, a(1:nnzeros) );
	if ( nperline < nnzeros & ...
        nnzeros/nperline ~= floor ( nnzeros / nperline ) )
	    fprintf ( fid, '\n' );
	end
	fprintf ( fid, c_valfmt, rhs(1:nrhs*nrow) );
    end
  end

  fprintf ( fid, '\n' );

  fclose ( fid );

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
