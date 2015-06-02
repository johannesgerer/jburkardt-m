function [ a, rhsval ] = hb_to_msm ( input_file )

%*****************************************************************************80
%
%% HB_TO_MSM reads a matrix and right hand side from an HB file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE, the name of the file containing the 
%    Harwell-Boeing matrix data.
%
%    Output, real A(M,N), a sparse matrix in MATLAB sparse matrix format.
%
%    Output, real RHSVAL(M,NRHS), right hand side vectors. 
%
  input_unit = fopen ( input_file );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_TO_MSM - Fatal error!\n' );
    fprintf ( 1, '  Error opening the file.\n' );
    error ( 'HB_TO_MSM - Fatal error!' );
  end

  [ title, key, totcrd, ptrcrd, indcrd, valcrd, rhscrd, mxtype, ...
    nrow, ncol, nnzero, neltvl, ptrfmt, indfmt, valfmt, rhsfmt, rhstyp, ...
    nrhs, nrhsix, colptr, rowind, values, rhsval, rhsptr, rhsind, guess, ...
    exact ] = hb_file_read ( input_unit );

  for col = 1 : ncol
    for k = colptr(col) : colptr(col+1)-1
      colind(k) = col;
    end
  end

  a = sparse ( rowind, colind, values, nrow, ncol );

  fclose ( input_unit );

  return
end
function c = ch_cap ( c )

%*****************************************************************************80
%
%% CH_CAP capitalizes a single character.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the character to capitalize.
%
%    Output, character C, the capitalized character.
%
  if ( 'a' <= c & c <= 'z' )
    c = c + 'A' - 'a';
  end

  return
end
function truefalse = ch_eqi ( c1, c2 )

%*****************************************************************************80
%
%% CH_EQI is a case insensitive comparison of two characters for equality.
%
%  Example:
%
%    CH_EQI ( 'A', 'a' ) is TRUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C1, C2, the characters to compare.
%
%    Output, logical TRUEFALSE, is TRUE (1) if the characters are equal.
%
  FALSE = 0;
  TRUE = 1;

  if ( ch_cap ( c1 ) == ch_cap ( c2 ) )
    truefalse = TRUE;
  else
    truefalse = FALSE;
  end

  return
end
function truefalse = ch_is_digit ( c )

%*****************************************************************************80
%
%% CH_IS_DIGIT returns TRUE if the character C is a digit.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, a character.
%
%    Output, integer TRUEFALSE, is TRUE (1) if C is a digit, FALSE (0) otherwise.
%
  TRUE = 1;
  FALSE = 0;

  if ( '0' <= c & c <= '9' )
    truefalse = TRUE;
  else
    truefalse = FALSE;
  end

  return
end
function truefalse = ch_is_format_code ( c )

%*****************************************************************************80
%
%% CH_IS_FORMAT_CODE returns TRUE if a character is a FORTRAN format code.
%
%  Discussion:
%
%    The format codes accepted here are not the only legal format
%    codes in FORTRAN90.  However, they are more than sufficient
%    for my needs!
%
%  Table:
%
%    A  Character
%    B  Binary digits
%    D  Real number, exponential representation
%    E  Real number, exponential representation
%    F  Real number, fixed point
%    G  General format
%    I  Integer
%    L  Logical variable
%    O  Octal digits
%    Z  Hexadecimal digits
%    *  Free format
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the character to be analyzed.
%
%    Output, logical TRUEFALSE, is TRUE (1) if C is a FORTRAN format code
%     and FALSE (0) otherwise.
%
  FALSE = 0;
  TRUE = 1;

      if ( ch_eqi ( c, 'A' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'B' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'D' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'E' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'F' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'G' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'I' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'L' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'O' ) )
    truefalse = TRUE;
  elseif ( ch_eqi ( c, 'Z' ) )
    truefalse = TRUE;
  elseif ( c == '*' )
    truefalse = TRUE;
  else
    truefalse = FALSE;
  end

  return
end
function digit = ch_to_digit ( c )

%*****************************************************************************80
%
%% CH_TO_DIGIT returns the integer value of a base 10 digit.
%
%  Example:
%
%     C   DIGIT
%    ---  -----
%    '0'    0
%    '1'    1
%    ...  ...
%    '9'    9
%    ' '    0
%    'X'   -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the decimal digit, '0' through '9' or blank
%    are legal.
%
%    Output, integer DIGIT, the corresponding integer value.  If C was
%    'illegal', then DIGIT is -1.
%
  if ( '0' <= c & c <= '9' )

    digit = c - '0';

  elseif ( c == ' ' )

    digit = 0;

  else

    digit = -1;

  end

  return
end
function exact = hb_exact_read ( input_unit, nrow, nrhs, rhscrd, rhsfmt, rhstyp )

%*****************************************************************************80
%
%% HB_EXACT_READ reads the exact solution vectors in an HB file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992.
%
%  Parameters:
%
%    Input, integer INPUT_UNIT, the unit from which data is read.
%
%    Input, integer NROW, the number of rows or variables.
%
%    Input, integer NRHS, the number of right hand sides.
%
%    Input, integer RHSCRD, the number of lines in the file for
%    right hand sides.
%
%    Input, character ( len = 20 ) RHSFMT, the format for reading values
%    of the right hand side.
%
%    Input, character ( len = 3 ) RHSTYP, the right hand side type.
%    First character is F for full storage or M for same as matrix.
%    Second character is G if starting "guess" vectors are supplied.
%    Third character is X if exact solution vectors are supplied.
%    Ignored if NRHS = 0.
%
%    Output, real EXACT(NROW,NRHS), the exact solution vectors.
%
  exact = [];

  if ( 0 < rhscrd )

    if ( rhstyp(3) == 'X' ) 

      [ p, code, w, m ] = s_to_format ( rhsfmt );

      line_num = 1 + floor ( ( nrow - 1 ) / p );

      for irhs = 1 : nrhs

        jhi = 0;

        for i = 1 : line_num

          line = fgetl ( input_unit );
          jlo = jhi + 1;
          jhi = min ( jlo + p - 1, nrow );

          khi = 0;

          for j = jlo : jhi
            klo = khi + 1;
            khi = min ( klo + w - 1, length ( line ) );
            s = line(klo:khi);
            exact(j,irhs) = str2num ( s );
          end 
        end
      end

    end

  end

  return
end
function [ title, key, totcrd, ptrcrd, indcrd, valcrd, rhscrd, mxtype, ...
  nrow, ncol, nnzero, neltvl, ptrfmt, indfmt, valfmt, rhsfmt, rhstyp, ...
  nrhs, nrhsix, colptr, rowind, values, rhsval, rhsptr, rhsind, guess, ...
  exact ] = hb_file_read ( input_unit )

%*****************************************************************************80
%
%% HB_FILE_READ reads an HB file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992.
%
%  Parameters:
%
%    Input, integer INPUT_UNIT, the unit from data is read.
%
%    Output, string TITLE(72), a title for the matrix.
%
%    Output, string KEY(8), an identifier for the matrix.
%
%    Output, integer TOTCRD, the total number of lines of data.
%
%    Output, integer PTRCRD, the number of input lines for pointers.
%
%    Output, integer INDCRD, the number of input lines for row indices.
%
%    Output, integer VALCRD, the number of input lines for numerical values.
%
%    Output, integer RHSCRD, the number of input lines for right hand sides.
%
%    Output, character ( len = 3 ) MXTYPE, the matrix type.
%    First character is R for Real, C for complex, P for pattern only.
%    Second character is S for symmetric, U for unsymmetric, H for
%      Hermitian, Z for skew symmetric, R for rectangular.
%    Third character is A for assembled and E for unassembled
%      finite element matrices.
%
%    Output, integer NROW, the number of rows or variables.
%
%    Output, integer NCOL, the number of columns or elements.
%
%    Output, integer NNZERO.  In the case of assembled sparse matrices,
%    this is the number of nonzeroes.  In the case of unassembled finite
%    element matrices, in which the right hand side vectors are also
%    stored as unassembled finite element vectors, this is the total
%    number of entries in a single unassembled right hand side vector.
%
%    Output, integer NELTVL, the number of finite element matrix entries,
%    set to 0 in the case of assembled matrices.
%
%    Output, string PTRFMT(16), the format for reading pointers.
%
%    Output, string INDFMT(16), the format for reading indices.
%
%    Output, string VALFMT(20), the format for reading values.
%
%    Output, string RHSFMT(20), the format for reading values
%    of the right hand side.
%
%    Output, string RHSTYP(3), the right hand side type.
%    First character is F for full storage or M for same as matrix.
%    Second character is G if starting "guess" vectors are supplied.
%    Third character is X if exact solution vectors are supplied.
%    Ignored if NRHS = 0.
%
%    Output, integer NRHS, the number of right hand sides.
%
%    Output, integer NRHSIX, the number of row indices (set to 0
%    in the case of unassembled matrices.)  Ignored if NRHS = 0.
%
%    Output, integer COLPTR(NCOL+1), COLPTR(I) points to the location of
%    the first entry of column I in the sparse matrix structure.
%
%    Output, integer ROWIND(NNZERO) or ROWIND(NELTVL), the row index of
%    each item.
%
%    Output, real VALUES(NNZERO) or VALUES(NELTVL), the nonzero values
%    of the matrix.
%
%    If RHSTYP(1) == 'F':
%
%      Output, integer RHSPTR(*), is not used.
%
%      Output, integer RHSIND(*), is not used.
%
%      Output, real RHSVAL(NROW,NRHS), contains NRHS dense right hand
%      side vectors.
%
%    If RHSTYP(1) = 'M' and MXTYPE(3) = 'A':
%
%      Output, integer RHSPTR(NRHS+1), RHSPTR(I) points to the location of
%      the first entry of right hand side I in the sparse right hand
%      side vector.
%
%      Output, integer RHSIND(NRHSIX), indicates, for each entry of
%      RHSVAL, the corresponding row index.
%
%      Output, real RHSVAL(NRHSIX), contains the value of the right hand
%      side entries.
%
%    If RHSTYP(1) = 'M' and MXTYPE(3) = 'E':
%
%      Output, integer RHSPTR(*), is not used.
%
%      Output, integer RHSIND(*), is not used.
%
%      Output, real RHSVAL(NNZERO,NRHS), contains NRHS unassembled
%      finite element vector right hand sides.
%
%    Output, real GUESS(NROW,NRHS), the starting guess vectors.
%
%    Output, real EXACT(NROW,NRHS), the exact solution vectors.
%

%
%  Read the header block.
%
  [ title, key, totcrd, ptrcrd, indcrd, valcrd, rhscrd, mxtype, ...
    nrow, ncol, nnzero, neltvl, ptrfmt, indfmt, valfmt, rhsfmt, rhstyp, ...
    nrhs, nrhsix ] = hb_header_read ( input_unit );
%
%  Read the matrix structure.
%
  [ colptr, rowind ] = hb_structure_read ( input_unit, ncol, mxtype, ...
    nnzero, neltvl, ptrcrd, ptrfmt, indcrd, indfmt );
%
%  Read the matrix values.
%
  values = hb_values_read ( input_unit, valcrd, mxtype, nnzero, neltvl, ...
    valfmt );
%
%  Read the right hand sides.
%
  [ rhsval, rhsptr, rhsind ] = hb_rhs_read ( input_unit, nrow, nnzero, ...
    nrhs, nrhsix, rhscrd, ptrfmt, indfmt, rhsfmt, mxtype, rhstyp );
%
%  Read the starting guesses.
%
  guess = hb_guess_read ( input_unit, nrow, nrhs, rhscrd, rhsfmt, rhstyp );
%
%  Read the exact solutions.
%
  exact = hb_exact_read ( input_unit, nrow, nrhs, rhscrd, rhsfmt, rhstyp );

  return
end
function guess = hb_guess_read ( input_unit, nrow, nrhs, rhscrd, rhsfmt, rhstyp )

%*****************************************************************************80
%
%% HB_GUESS_READ reads the starting guess vectors in an HB file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992.
%
%  Parameters:
%
%    Input, integer INPUT_UNIT, the unit from which data is read.
%
%    Input, integer NROW, the number of rows or variables.
%
%    Input, integer NRHS, the number of right hand sides.
%
%    Input, integer RHSCRD, the number of lines in the file for
%    right hand sides.
%
%    Input, character ( len = 20 ) RHSFMT, the format for reading values
%    of the right hand side.
%
%    Input, character ( len = 3 ) RHSTYP, the right hand side type.
%    First character is F for full storage or M for same as matrix.
%    Second character is G if starting "guess" vectors are supplied.
%    Third character is X if exact solution vectors are supplied.
%    Ignored if NRHS = 0.
%
%    Output, real GUESS(NROW,NRHS), the starting guess vectors.
%
  guess = [];

  if ( 0 < rhscrd )

    if ( rhstyp(2) == 'G' )

      [ p, code, w, m ] = s_to_format ( rhsfmt );

      line_num = 1 + floor ( ( nrow - 1 ) / p );

      for irhs = 1 : nrhs

        jhi = 0;

        for i = 1 : line_num

          line = fgetl ( input_unit );
          jlo = jhi + 1;
          jhi = min ( jlo + p - 1, nrow );

          khi = 0;

          for j = jlo : jhi
            klo = khi + 1;
            khi = min ( klo + w - 1, length ( line ) );
            s = line(klo:khi);
            guess(j,irhs) = str2num ( s );
          end 

        end
      end

    end

  end

  return
end
function [ title, key, totcrd, ptrcrd, indcrd, valcrd, rhscrd, mxtype, ...
  nrow, ncol, nnzero, neltvl, ptrfmt, indfmt, valfmt, rhsfmt, rhstyp, ...
  nrhs, nrhsix ] = hb_header_read ( input_unit )

%*****************************************************************************80
%
%% HB_HEADER_READ reads the header of an HB file.
%
%  Discussion:
%
%    The user should already have opened the file, and positioned it
%    to the first record.
%
%    Thanks to Shahadat Hossain for pointing out an error in the determination
%    of INDFMT, on 24 June 2004.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992.
%
%  Parameters:
%
%    Input, integer INPUT_UNIT, the unit from which data is read.
%
%    Output, character ( len = 72 ) TITLE, a title for the matrix.
%
%    Output, character ( len = 8 ) KEY, an identifier for the matrix.
%
%    Output, integer TOTCRD, the total number of lines of data.
%
%    Output, integer PTRCRD, the number of input lines for pointers.
%
%    Output, integer INDCRD, the number of input lines for row indices.
%
%    Output, integer VALCRD, the number of input lines for numerical values.
%
%    Output, integer RHSCRD, the number of input lines for right hand sides.
%
%    Output, character ( len = 3 ) MXTYPE, the matrix type.
%    First character is R for Real, C for complex, P for pattern only.
%    Second character is S for symmetric, U for unsymmetric, H for
%      Hermitian, Z for skew symmetric, R for rectangular.
%    Third character is A for assembled and E for unassembled
%      finite element matrices.
%
%    Output, integer NROW, the number of rows or variables.
%
%    Output, integer NCOL, the number of columns or elements.
%
%    Output, integer NNZERO.  In the case of assembled sparse matrices,
%    this is the number of nonzeroes.  In the case of unassembled finite
%    element matrices, in which the right hand side vectors are also
%    stored as unassembled finite element vectors, this is the total
%    number of entries in a single unassembled right hand side vector.
%
%    Output, integer NELTVL, the number of finite element matrix entries,
%    set to 0 in the case of assembled matrices.
%
%    Output, character ( len = 16 ) PTRFMT, the format for reading pointers.
%
%    Output, character ( len = 16 ) INDFMT, the format for reading indices.
%
%    Output, character ( len = 20 ) VALFMT, the format for reading values.
%
%    Output, character ( len = 20 ) RHSFMT, the format for reading values
%    of the right hand side.
%
%    Output, character ( len = 3 ) RHSTYP, the right hand side type.
%    First character is F for full storage or M for same as matrix.
%    Second character is G if starting "guess" vectors are supplied.
%    Third character is X if exact solution vectors are supplied.
%
%    Output, integer NRHS, the number of right hand sides.
%
%    Output, integer NRHSIX, the number of entries of storage for right
%    hand side values, in the case where RHSTYP(1:1) = 'M' and
%    MXTYPE(3:3) = 'A'.
%

%
%  Read the header block.
%  Use FGETL rather that FGETS, because we don't want the line terminator character!
%  If fewer than 80 characters were read, you need to pad the line out.
%
  line = fgetl ( input_unit );

  if ( line == -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  I/O error reading header line 1.\n' );
    return;
  end

  line_num = length ( line );
  for i = line_num+1 : 80
    line(i) = ' ';
  end

  title = line(1:72);
  title = title(1:s_len_trim(title));

  key = line(73:80);
  key = key(1:s_len_trim(key));

  line = fgetl ( input_unit );

  if ( line == -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  I/O error reading header line 2.\n' );
    return;
  end

  line_num = length ( line );
  for i = line_num+1 : 80
    line(i) = ' ';
  end

  totcrd = str2num ( line( 1:14) );
  ptrcrd = str2num ( line(15:28) );
  indcrd = str2num ( line(29:42) );
  valcrd = str2num ( line(43:56) );
  rhscrd = str2num ( line(57:70) );

  line = fgetl ( input_unit );

  if ( line == -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  I/O error reading header line 3.\n' );
    return;
  end

  line_num = length ( line );
  for i = line_num+1 : 80
    line(i) = ' ';
  end

  mxtype =           line( 1: 3);
  nrow   = str2num ( line(15:28) );
  ncol   = str2num ( line(29:42) );
  nnzero = str2num ( line(43:56) );
  neltvl = str2num ( line(57:70) );

  line = fgetl ( input_unit );

  if ( line == -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  I/O error reading header line 4.\n' );
    return;
  end

  line_num = length ( line );
  for i = line_num+1 : 80
    line(i) = ' ';
  end

  ptrfmt = line( 1:16);
  ptrfmt = ptrfmt(1:s_len_trim(ptrfmt));
  indfmt = line(17:32);
  indfmt = indfmt(1:s_len_trim(indfmt));
  valfmt = line(33:52);
  valfmt = valfmt(1:s_len_trim(valfmt));
  rhsfmt = line(53:72);
  rhsfmt = rhsfmt(1:s_len_trim(rhsfmt));

  if ( 0 < rhscrd ) 

    line = fgetl ( input_unit );

    if ( line == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'HB_HEADER_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error reading header line 5.\n' );
      return;
    end

    line_num = length ( line );
    for i = line_num+1 : 80
      line(i) = ' ';
    end

    rhstyp =           line( 1: 3);
    nrhs   = str2num ( line(15:28) );
    nrhsix = str2num ( line(29:42) );

  else

    rhstyp = ' ';
    nrhs = 0;
    nrhsix = 0;

  end

  return
end
function [ rhsval, rhsptr, rhsind ] = hb_rhs_read ( input_unit, nrow, ...
  nnzero, nrhs, nrhsix, rhscrd, ptrfmt, indfmt, rhsfmt, mxtype, rhstyp ) 

%*****************************************************************************80
%
%% HB_RHS_READ reads the right hand side information in an HB file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992.
%
%  Parameters:
%
%    Input, integer INPUT_UNIT, the unit from which data is read.
%
%    Input, integer NROW, the number of rows or variables.
%
%    Input, integer NNZERO.  In the case of assembled sparse matrices,
%    this is the number of nonzeroes.  In the case of unassembled finite
%    element matrices, in which the right hand side vectors are also
%    stored as unassembled finite element vectors, this is the total
%    number of entries in a single unassembled right hand side vector.
%
%    Input, integer NRHS, the number of right hand sides.
%
%    Input, integer NRHSIX, the number of entries of storage for right
%    hand side values, in the case where RHSTYP(1:1) = 'M' and
%    MXTYPE(3:3) = 'A'.
%
%    Input, integer RHSCRD, the number of lines in the file for
%    right hand sides.
%
%    Input, character ( len = 16 ) PTRFMT, the format for reading pointers.
%
%    Input, character ( len = 16 ) INDFMT, the format for reading indices.
%
%    Input, character ( len = 20 ) RHSFMT, the format for reading values
%    of the right hand side.
%
%    Input, character ( len = 3 ) MXTYPE, the matrix type.
%    First character is R for Real, C for complex, P for pattern only.
%    Second character is S for symmetric, U for unsymmetric, H for
%      Hermitian, Z for skew symmetric, R for rectangular.
%    Third character is A for assembled and E for unassembled
%      finite element matrices.
%
%    Input, character ( len = 3 ) RHSTYP, the right hand side type.
%    First character is F for full storage or M for same as matrix.
%    Second character is G if starting "guess" vectors are supplied.
%    Third character is X if exact solution vectors are supplied.
%    Ignored if NRHS = 0.
%
%    If RHSTYP(1:1) == 'F':
%
%      Output, integer RHSPTR(*), is not used.
%
%      Output, integer RHSIND(*), is not used.
%
%      Output, real RHSVAL(NROW,NRHS), contains NRHS dense right hand
%      side vectors.
%
%    If RHSTYP(1:1) = 'M' and MXTYPE(3:3) = 'A':
%
%      Output, integer RHSPTR(NRHS+1), RHSPTR(I) points to the location of
%      the first entry of right hand side I in the sparse right hand
%      side vector.
%
%      Output, integer RHSIND(NRHSIX), indicates, for each entry of
%      RHSVAL, the corresponding row index.
%
%      Output, real RHSVAL(NRHSIX), contains the value of the right hand
%      side entries.
%
%    If RHSTYP(1:1) = 'M' and MXTYPE(3:3) = 'E':
%
%      Output, integer RHSPTR(*), is not used.
%
%      Output, integer RHSIND(*), is not used.
%
%      Output, real RHSVAL(NNZERO,NRHS), contains NRHS unassembled
%      finite element vector right hand sides.
%
  rhsptr = [];
  rhsind = [];
  rhsval = [];
%
%  Read the right hand sides.
%    case F                             = "full" or "dense";
%    case not F + matrix storage is "A" = sparse pointer RHS
%    case not F + matrix storage is "E" = finite element RHS
%
  if ( 0 < rhscrd )
%
%  Dense right hand sides:
%
    if ( rhstyp(1) == 'F' )

      [ p, code, w, m ] = s_to_format ( rhsfmt );

      line_num = 1 + floor ( ( nrow - 1 ) / p );

      for irhs = 1 : nrhs

        jhi = 0;

        for i = 1 : line_num

          line = fgetl ( input_unit );
          jlo = jhi + 1;
          jhi = min ( jlo + p - 1, nrow );

          khi = 0;

          for j = jlo : jhi
            klo = khi + 1;
            khi = min ( klo + w - 1, length ( line ) );
            s = line(klo:khi);
            rhsval(j,irhs) = str2num ( s );
          end 
        end
      end
%
%  Sparse right-hand sides stored like the matrix.
%  Read pointer array, indices, and values.
%
    elseif ( rhstyp(1) == 'M' )

      if ( mxtype(3) == 'A' )

        [ p, code, w, m ] = s_to_format ( ptrfmt );

        line_num = 1 + floor ( ( nrhs + 1 - 1 ) / p );

        jhi = 0;

        for i = 1 : line_num

          line = fgetl ( input_unit );
          jlo = jhi + 1;
          jhi = min ( jlo + p - 1, nrhs + 1 );

          khi = 0;

          for j = jlo : jhi
            klo = khi + 1;
            khi = min ( klo + w - 1, length ( line ) );
            s = line(klo:khi);
            rhsptr(j) = str2num ( s );
          end 
        end

        [ p, code, w, m ] = s_to_format ( indfmt );

        line_num = 1 + floor ( ( nrhsix - 1 ) / p );

        jhi = 0;

        for i = 1 : line_num

          line = fgetl ( input_unit );
          jlo = jhi + 1;
          jhi = min ( jlo + p - 1, nrhsix );

          khi = 0;

          for j = jlo : jhi
            klo = khi + 1;
            khi = min ( klo + w - 1, length ( line ) );
            s = line(klo:khi);
            rhsind(j) = str2num ( s );
          end 
        end

        [ p, code, w, m ] = s_to_format ( rhsfmt );

        line_num = 1 + floor ( ( nrhsix - 1 ) / p );

        jhi = 0;

        for i = 1 : line_num

          line = fgetl ( input_unit );
          jlo = jhi + 1;
          jhi = min ( jlo + p - 1, nrhsix );

          khi = 0;

          for j = jlo : jhi
            klo = khi + 1;
            khi = min ( klo + w - 1, length ( line ) );
            s = line(klo:khi);
            rhsval(j) = str2num ( s );
          end 
        end
%
%  Sparse right hand sides in finite element format.
%
      elseif ( mxtype(3) == 'E' )

        [ p, code, w, m ] = s_to_format ( rhsfmt );

        line_num = 1 + floor ( ( nnzero - 1 ) / p );

        for irhs = 1 : nrhs

          jhi = 0;

          for i = 1 : line_num

            line = fgetl ( input_unit );
            jlo = jhi + 1;
            jhi = min ( jlo + p - 1, nnzero );

            khi = 0;

            for j = jlo : jhi
              klo = khi + 1;
              khi = min ( klo + w - 1, length ( line ) );
              s = line(klo:khi);
              rhsval(j,irhs) = str2num ( s );
            end 
          end
        end

      else

        fprintf ( 1, '\n' );
        fprintf ( 1, 'HB_RHS_READ - Fatal error!\n' );
        fprintf ( 1, '  Illegal value of MXTYPE(3) = ''%c''!\n', mxtype(3) );
        error ( 'HB_RHS_READ - Fatal error!' );

      end
%
%  0 < RHSCARD, but RHSTYP not recognized.
%
    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'HB_RHS_READ - Fatal error!\n' );
      fprintf ( 1, '  Illegal value of RHSTYP(1) = ''%c''!\n', rhstyp(1) );
      error ( 'HB_RHS_READ - Fatal error!' );

    end

  end

  return
end
function [ colptr, rowind ] = hb_structure_read ( input_unit, ncol, mxtype, ...
  nnzero, neltvl, ptrcrd, ptrfmt, indcrd, indfmt )

%*****************************************************************************80
%
%% HB_STRUCTURE_READ reads the structure of an HB matrix.
%
%  Discussion:
%
%    The user should already have opened the file, and positioned it
%    to just after the header records.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992.
%
%  Parameters:
%
%    Input, integer INPUT_UNIT, the unit from which data is read.
%
%    Input, integer NCOL, the number of columns.
%
%    Input, string MXTYPE(3), the matrix type.
%    First character is R for Real, C for complex, P for pattern only.
%    Second character is S for symmetric, U for unsymmetric, H for
%      Hermitian, Z for skew symmetric, R for rectangular.
%    Third character is A for assembled and E for unassembled
%      finite element matrices.
%
%    Input, integer NNZERO.  In the case of assembled sparse matrices,
%    this is the number of nonzeroes.  In the case of unassembled finite
%    element matrices, in which the right hand side vectors are also
%    stored as unassembled finite element vectors, this is the total
%    number of entries in a single unassembled right hand side vector.
%
%    Input, integer NELTVL, the number of finite element matrix entries,
%    set to 0 in the case of assembled matrices.
%
%    Input, integer PTRCRD, the number of pointer records.
%
%    Input, string PTRFMT(16), the format for reading pointers.
%
%    Input, integer INDCRD, the number of index records.
%
%    Input, string INDFMT(16), the format for reading indices.
%
%    Output, integer COLPTR(NCOL+1), COLPTR(I) points to the location of
%    the first entry of column I in the sparse matrix structure.
%
%    Output, integer ROWIND(NNZERO) or ROWIND(NELTVL), the row index of
%    each item.
%
  [ p, code, w, m ] = s_to_format ( ptrfmt );

  if ( mxtype(3) == 'A' )
    line_num = 1 + floor ( ( ( ncol + 1 ) - 1 ) / p );
  else
    line_num = 1 + floor ( ( ( ncol     ) - 1 ) / p );
  end

  jhi = 0;

  for i = 1 : line_num

    line = fgetl ( input_unit );
    jlo = jhi + 1;

    if ( mxtype(3) == 'A' )
      jhi = min ( jlo + p - 1, ncol + 1 );
    else
      jhi = min (  jlo + p - 1, ncol );
    end

    khi = 0;

    for j = jlo : jhi
      klo = khi + 1;
      khi = min ( klo + w - 1, length ( line ) );
      s = line(klo:khi);
      colptr(j) = str2num ( s );
    end 

  end

  if ( mxtype(3) == 'A' )

    [ p, code, w, m ] = s_to_format ( indfmt );

    line_num = 1 + floor ( ( nnzero - 1 ) / p );

    jhi = 0;

    for i = 1 : line_num

      line = fgetl ( input_unit );
      jlo = jhi + 1;
      jhi = min ( jlo + p - 1, nnzero );

      khi = 0;

      for j = jlo : jhi
        klo = khi + 1;
        khi = min ( klo + w - 1, length ( line ) );
        s = line(klo:khi);
        rowind(j) = str2num ( s );
      end 

    end

  elseif ( mxtype(3) == 'E' )

    [ p, code, w, m ] = s_to_format ( indfmt );
    number = colptr(ncol) - colptr(1);
    line_num = 1 + floor ( ( number - 1 ) / p );

    jhi = 0;

    for i = 1 : line_num
      line = fgetl ( input_unit );
      jlo = jhi + 1;
      jhi = min ( jlo + p - 1, number );

      khi = 0;

      for j = jlo : jhi
        klo = khi + 1;
        khi = min ( klo + w - 1, length ( line ) );
        s = line(klo:khi);
        rowind(j) = str2num ( s );
      end 

    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_STRUCTURE_READ - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of MXTYPE(3) = ''%c''.\n', mxtype(3) );
    return

  end

  return
end
function values = hb_values_read ( input_unit, valcrd, mxtype, nnzero, ...
  neltvl, valfmt )

%*****************************************************************************80
%
%% HB_VALUES_READ reads the values of an HB matrix.
%
%  Discussion:
%
%    The user should already have opened the file, and positioned it
%    to just after the header and structure records.
%
%    Values are contained in an HB file if the VALCRD parameter
%    is nonzero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992.
%
%  Parameters:
%
%    Input, integer INPUT_UNIT, the unit from which data is read.
%
%    Input, integer VALCRD, the number of input lines for numerical values.
%
%    Input, character ( len = 3 ) MXTYPE, the matrix type.
%    First character is R for Real, C for complex, P for pattern only.
%    Second character is S for symmetric, U for unsymmetric, H for
%      Hermitian, Z for skew symmetric, R for rectangular.
%    Third character is A for assembled and E for unassembled
%      finite element matrices.
%
%    Input, integer NNZERO.  In the case of assembled sparse matrices,
%    this is the number of nonzeroes.  In the case of unassembled finite
%    element matrices, in which the right hand side vectors are also
%    stored as unassembled finite element vectors, this is the total
%    number of entries in a single unassembled right hand side vector.
%
%    Input, integer NELTVL, the number of finite element matrix entries,
%    set to 0 in the case of assembled matrices.
%
%    Input, character ( len = 20 ) VALFMT, the format for reading values.
%
%    Output, real VALUES(NNZERO) or VALUES(NELTVL), the nonzero values
%    of the matrix.
%
  [ p, code, w, m ] = s_to_format ( valfmt );
%
%  Read the matrix values.
%    case "A" = assembled;
%    case "E" = unassembled finite element matrices.
%
  if ( 0 < valcrd )

    if ( mxtype(3:3) == 'A' )

      line_num = 1 + floor ( ( nnzero - 1 ) / p );

      jhi = 0;

      for i = 1 : line_num

        line = fgetl ( input_unit );
        jlo = jhi + 1;
        jhi = min ( jlo + p - 1, nnzero );

        khi = 0;

        for j = jlo : jhi
          klo = khi + 1;
          khi = min ( klo + w - 1, length ( line ) );
          s = line(klo:khi);
          values(j) = str2num ( s );
        end 

      end

    elseif ( mxtype(3) == 'E' )

      line_num = 1 + floor ( ( neltvl - 1 ) / p );

      jhi = 0;

      for i = 1 : line_num

        line = fgetl ( input_unit );
        jlo = jhi + 1;
        jhi = min ( jlo + p - 1, neltvl );

        khi = 0;

        for j = jlo : jhi
          klo = khi + 1;
          khi = min ( klo + w - 1, length ( line ) );
          s = line(klo:khi);
          values(j) = str2num ( s );
        end 

      end

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'HB_VALUES_READ - Fatal error!\n' );
      fprintf ( 1, '  Illegal value of MXTYPE(3).\n' );
      error ( 'HB_VALUES_READ - Fatal error!' );

    end

  end

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
function [ r, code, w, m ] = s_to_format ( s )

%*****************************************************************************80
%
%% S_TO_FORMAT reads a FORTRAN format from a string.
%
%  Discussion:
%
%    This routine will read as many characters as possible until it reaches
%    the end of the string, or encounters a character which cannot be
%    part of the format.  This routine is limited in its ability to
%    recognize FORTRAN formats.  In particular, we are only expecting
%    a single format specification, and cannot handle extra features
%    such as 'ES' and 'EN' codes, '5X' spacing, and so on.
%
%    Legal input is:
%
%       0 nothing
%       1 blanks
%       2 optional '('
%       3 blanks
%       4 optional repeat factor R
%       5 blanks
%       6 CODE ( 'A', 'B', 'E', 'F', 'G', 'I', 'L', 'O', 'Z', '*' )
%       7 blanks
%       8 width W
%       9 optional decimal point
%      10 optional mantissa M
%      11 blanks
%      12 optional ')'
%      13 blanks
%
%  Example:
%
%    S                 R   CODE   W    M
%
%    'I12              1   I      12   0
%    'E8.0'            1   E       8   0
%    'F10.5'           1   F      10   5
%    '2G14.6'          2   G      14   6
%    '*'               1   *      -1  -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string containing the
%    data to be read.  Reading will begin at position 1 and
%    terminate at the end of the string, or when no more
%    characters can be read.
%
%    Output, integer R, the repetition factor, which defaults to 1.
%
%    Output, character CODE, the format code.
%
%    Output, integer W, the field width.
%
%    Output, integer M, the mantissa width.
%
  LEFT = 1;
  RIGHT = -1;

  state = 0;
  paren_sum = 0;
  pos = 0;
  s_length = s_len_trim ( s );

  r = 0;
  w = 0;
  code = '?';
  m = 0;

  while ( pos < s_length )

    pos = pos + 1;
    c = s(pos);
%
%  BLANK character:
%
    if ( c == ' ' )

      if ( state == 4 )
        state = 5;
      elseif ( state == 6 )
        state = 7;
      elseif ( state == 10 )
        state = 11;
      elseif ( state == 12 )
        state = 13;
      end
%
%  LEFT PAREN
%
    elseif ( c == '(' )

      if ( state < 2 )
        paren_sum = paren_sum + LEFT;
      else
        state = -1;
        break;
      end
%
%  DIGIT (R, F, or W)
%
    elseif ( ch_is_digit ( c ) )

      if ( state <= 3 )
        state = 4;
        r = ch_to_digit ( c );
      elseif ( state == 4 )
        d = ch_to_digit ( c );
        r = 10 * r + d;
      elseif ( state == 6 | state == 7 )
        if ( code == '*' )
          state = -1;
          break;
        end
        state = 8;
        w = ch_to_digit ( c );
      elseif ( state == 8 )
        d = ch_to_digit ( c );
        w = 10 * w + d;
      elseif ( state == 9 )
        state = 10;
        m = ch_to_digit ( c );
      elseif ( state == 10 )
        d = ch_to_digit ( c );
        m = 10 * m + d;
      else
        state = -1;
        break;
      end
%
%  DECIMAL POINT
%
    elseif ( c == '.' )

      if ( state == 8 )
        state = 9;
      else
        state = -1;
        break;
      end
%
%  RIGHT PAREN
%
    elseif ( c == ')' )

      paren_sum = paren_sum + RIGHT;

      if ( paren_sum ~= 0 )
        state = -1;
        break;
      end

      if ( state == 6 & code == '*' )
        state = 12;
      elseif ( 6 <= state )
        state = 12;
      else
        state = -1;
        break;
      end
%
%  Code
%
    elseif ( ch_is_format_code ( c ) )

      if ( state < 6 )
        state = 6;
        code = c;
      else
        state = -1;
        break;
      end
%
%  Unexpected character
%
    else

      state = -1;
      break;

    end

  end

  if ( paren_sum ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'S_TO_FORMAT - Fatal error!\n' );
    fprintf ( 1, '  Parentheses mismatch.\n' );
    error ( 'S_TO_FORMAT - Fatal error!' );
  end

  if ( state < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'S_TO_FORMAT - Fatal error!\n' );
    fprintf ( 1, '  Parsing error.\n' );
    error ( 'S_TO_FORMAT - Fatal error!' );
  end

  if ( r == 0 )
    r = 1;
  end

  return
end
function ival = s_to_i4 ( s )

%*****************************************************************************80
%
%% S_TO_I4 reads an integer value from a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, a string to be examined.
%
%    Output, integer IVAL, the integer value read from the string.
%
  sgn = 1;
  state = 0;
  ival = 0;
  s_len = length ( s );

  if ( s_len == 0 )
    ival = 0;
    return;
  end

  i = 0;

  while ( i < s_len )

    i = i + 1;
    c = s(i);

    if ( state == 0 )

      if ( c == ' ' )

      elseif ( c == '-' )
        state = 1;
        sgn = -1;
      elseif ( c == '+' )
        state = 1;
        sgn = +1;
      elseif ( '0' <= c & c <= '9' )
        state = 2;
        ival = c - '0';
      else
        fprintf ( '\n' );
        fprintf ( 'S_TO_I4 - Fatal error!\n' );
        fprintf ( '  Illegal character ''%c'' while in state %d.\n', c, state );
        fprintf ( '  Input string was "%s"\n', s );
        error ( 'S_TO_I4 - Fatal error!\n' );
        return;
      end
%
%  Have read the sign, now expecting the first digit.
%
    elseif ( state == 1 )

      if ( c == ' ' )

      elseif ( '0' <= c & c <= '9' )
        state = 2;
        ival = c - '0';
      else
        fprintf ( '\n' );
        fprintf ( 'S_TO_I4 - Fatal error!\n' );
        fprintf ( '  Illegal character ''%c'' while in state %d.\n', c, state );
        fprintf ( '  Input string was "%s"\n', s );
        error ( 'S_TO_I4 - Fatal error!\n' );
        return
      end
%
%  Have read at least one digit, expecting more.
%
    elseif ( state == 2 )

      if ( '0' <= c & c <= '9' )
        ival = 10 * ival + c - '0';
      else
        ival = sgn * ival;
        return;
      end

    end

  end
%
%  If we read all the characters in the string, see if we're OK.
%
  if ( state ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'S_TO_I4 - Fatal error!\n' );
    fprintf ( 1, '  Did not read enough information to define an integer!\n' );
    fprintf ( 1, '  Input string was "%s"\n', s );
    error ( 'S_TO_I4 - Fatal error!\n' );
    return;
  end

  ival = sgn * ival;

  return
end
function [ r, lchar, ierror ] = s_to_r8 ( s )

%*****************************************************************************80
%
%% S_TO_R8 reads an R8 from a string.
%
%  Discussion:
%
%    This routine will read as many characters as possible until it reaches
%    the end of the string, or encounters a character which cannot be
%    part of the real number.
%
%    Legal input is:
%
%       1 blanks,
%       2 '+' or '-' sign,
%       2.5 spaces
%       3 integer part,
%       4 decimal point,
%       5 fraction part,
%       6 'E' or 'e' or 'D' or 'd', exponent marker,
%       7 exponent sign,
%       8 exponent integer part,
%       9 exponent decimal point,
%      10 exponent fraction part,
%      11 blanks,
%      12 final comma or semicolon.
%
%    with most quantities optional.
%
%  Example:
%
%    S                 R
%
%    '1'               1.0
%    '     1   '       1.0
%    '1A'              1.0
%    '12,34,56'        12.0
%    '  34 7'          34.0
%    '-1E2ABCD'        -100.0
%    '-1X2ABCD'        -1.0
%    ' 2E-1'           0.2
%    '23.45'           23.45
%    '-4.2E+2'         -420.0
%    '17d2'            1700.0
%    '-14e-2'         -0.14
%    'e2'              100.0
%    '-12.73e-9.23'   -12.73 * 10.0**(-9.23)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string containing the
%    data to be read.  Reading will begin at position 1 and
%    terminate at the end of the string, or when no more
%    characters can be read to form a legal real.  Blanks,
%    commas, or other nonnumeric data will, in particular,
%    cause the conversion to halt.
%
%    Output, real R, the value that was read from the string.
%
%    Output, integer LCHAR, the number of characters of S that were used to form R.
%
%    Output, integer IERROR, is 0 if no error occurred.
%
  s_length = s_len_trim ( s );
  ierror = 0;
  r = 0.0;
  lchar = -1;
  isgn = 1;
  rtop = 0.0;
  rbot = 1.0;
  jsgn = 1;
  jtop = 0;
  jbot = 1;
  ihave = 1;
  iterm = 0;

  while ( 1 )

    lchar = lchar + 1;
    c = s(lchar+1);
%
%  Blank character.
%
    if ( c == ' ' )

      if ( ihave == 2 )

      elseif ( ihave == 6 | ihave == 7 )
        iterm = 1;
      elseif ( 1 < ihave )
        ihave = 11;
      end
%
%  Comma.
%
    elseif ( c == ',' | c == ';' )

      if ( ihave ~= 1 )
        iterm = 1;
        ihave = 12;
        lchar = lchar + 1;
      end
%
%  Minus sign.
%
    elseif ( c == '-' )

      if ( ihave == 1 );
        ihave = 2;
        isgn = -1;
      elseif ( ihave == 6 )
        ihave = 7;
        jsgn = -1;
      else
        iterm = 1;
      end
%
%  Plus sign.
%
    elseif ( c == '+' )

      if ( ihave == 1 )
        ihave = 2;
      elseif ( ihave == 6 )
        ihave = 7;
      else
        iterm = 1;
      end
%
%  Decimal point.
%
    elseif ( c == '.' )

      if ( ihave < 4 )
        ihave = 4;
      elseif ( 6 <= ihave & ihave <= 8 )
        ihave = 9;
      else
        iterm = 1;
      end
%
%  Exponent marker.
%
    elseif ( ch_eqi ( c, 'E' ) | ch_eqi ( c, 'D' ) )

      if ( ihave < 6 )
        ihave = 6;
      else
        iterm = 1;
      end
%
%  Digit.
%
    elseif ( ihave < 11 & ch_is_digit ( c ) )

      if ( ihave <= 2 )
        ihave = 3;
      elseif ( ihave == 4 )
        ihave = 5;
      elseif ( ihave == 6 | ihave == 7 )
        ihave = 8;
      elseif ( ihave == 9 )
        ihave = 10;
      end

      d = ch_to_digit ( c );

      if ( ihave == 3 )
        rtop = 10.0 * rtop + d;
      elseif ( ihave == 5 )
        rtop = 10.0 * rtop + d;
        rbot = 10.0 * rbot;
      elseif ( ihave == 8 )
        jtop = 10 * jtop + d;
      elseif ( ihave == 10 )
        jtop = 10 * jtop + d;
        jbot = 10 * jbot;
      end
%
%  Anything else is regarded as a terminator.
%
    else
      iterm = 1;
    end
%
%  If we haven't seen a terminator, and we haven't examined the
%  entire string, go get the next character.
%
    if ( iterm == 1 | s_length <= lchar + 1 )
      break;
    end

  end
%
%  If we haven't seen a terminator, and we have examined the
%  entire string, then we're done, and LCHAR is equal to S_LENGTH.
%
  if ( iterm ~= 1 & lchar + 1 == s_length )
    lchar = s_length;
  end
%
%  Number seems to have terminated.  Have we got a legal number?
%  Not if we terminated in states 1, 2, 6 or 7!
%
  if ( ihave == 1 | ihave == 2 | ihave == 6 | ihave == 7 )
    ierror = ihave;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'S_TO_R8 - Fatal error!\n' );
    fprintf ( 1, '  IHAVE = %d\n', ihave );
    error ( 'S_TO_R8 - Fatal error!' );
  end
%
%  Number seems OK.  Form it.
%
  if ( jtop == 0 )
    rexp = 1.0;
  else

    if ( jbot == 1 )
      rexp = 10.0^( jsgn * jtop );
    else
      rexp = jsgn * jtop;
      rexp = rexp / jbot;
      rexp = 10.0^rexp;
    end

  end

  r = isgn * rexp * rtop / rbot;

  return
end

