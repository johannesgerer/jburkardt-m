function st_to_hb ( input_file, output_file )

%*****************************************************************************80
%
%% ST_TO_HB converts an ST file to a Harwell Boeing Sparse Matrix file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE, the name of the input ST file.
%
%    input, string OUTPUT_FILE, the name of the output HB file.
%
  [ nrow, ncol, nnzero ] = st_header_read ( input_file );

  [ row, col, a ] = st_data_read ( input_file, nrow, ncol, nnzero );

  base0 = 0;
  base1 = 1;
  row = st_rebase ( base0, base1, nnzero, row );
  col = st_rebase ( base0, base1, nnzero, col );
%
%  Make a sparse version of the matrix.
%
  b = sparse ( row, col, a, nrow, ncol, nnzero );
%
%  Have MSM_TO_HB write the sparse matrix to a file.
%
  msm_to_hb ( output_file, b );

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
%  Column pointers
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
%  Row indices
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

  fclose ( fid );

  return
end
function [ row, col, a ] = st_data_read ( input_filename, nrow, ncol, nnzero )

%*****************************************************************************80
%
%% ST_DATA_READ reads the data of an ST file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the ST file.
%
%    Input, integer NROW, the assumed number of rows in the matrix.
%
%    Input, integer NCOL, the assumed number of columns in the matrix.
%
%    Input, integer NNZERO, the assumed number of nonzeros in the matrix.
%
%    Output, integer ROW(NNZERO), COL(NNZERO), the 0-based row and column
%    index of a nonzero matrix entry.
%
%    Output, real A(NNZERO), the value of a nonzero matrix entry.
%
  input_unit = fopen ( input_filename );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ST_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'ST_DATA_READ - Error!' );
    return
  end

  string = '  %d  %d  %f';

  for k = 1 : nnzero

    line = fgets ( input_unit );

    if ( line == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ST_DATA_READ - Error!\n' );
      fprintf ( 1, '  Premature end of input data.\n' );
      error ( 'ST_DATA_READ - Error!' );
      break
    end

    [ x, count ] = sscanf ( line, string );

    row(k) = x(1);
    col(k) = x(2);
    a(k) = x(3);

  end

  fclose ( input_unit );

  return
end
function [ nrow, ncol, nnzero ] = st_header_read ( input_filename )

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
%    01 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the ST file.
%
%    Output, integer NROW, the assumed number of rows in the matrix.
%
%    Output, integer NCOL, the assumed number of columns in the matrix.
%
%    Output, integer NNZERO, the assumed number of nonzeros in the matrix.
%
  input_unit = fopen ( input_filename );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ST_HEADER_READ - Error%\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'ST_HEADER_READ - Error%' );
    return
  end

  nnzero = 0;
  nrow = 0;
  ncol = 0;

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

    nnzero = nnzero + 1;
    nrow = max ( nrow, i + 1 );
    ncol = max ( ncol, j + 1 );

  end

  fclose ( input_unit );

  return
end
function indx = st_rebase ( base1, base2, nnzero, indx )

%*****************************************************************************80
%
%% ST_REBASE changes the base of an index array.
%
%  Discussion:
%
%    Both the ROW and COL arrays are ordinarily 0-based in the ST format.
%    FORTRAN and MATLAB expect 1-based indices.
%
%    To convert ROW and COL from 0-based to 1-based form, call this routine
%    with BASE1=0, BASE2=1.
%
%    If ROW and COL from FORTRAN or MATLAB are to be converted to ST format,
%    call this routine with BASE1=1 and BASE2=0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer BASE1, BASE2, the old and new bases.
%
%    Input, integer NNZERO, the number of nonzeros in the matrix.
%
%    Input, integer INDX(NNZERO), the index vector to be rebased.
%
%    Output, integer INDX(NNZERO), the index vector
%    to be rebased.
%
  indx(1:nnzero) = indx(1:nnzero) - base1 + base2;

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
