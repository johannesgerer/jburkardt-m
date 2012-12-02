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

  totcrd = s_to_i4 ( line( 1:14) );
  ptrcrd = s_to_i4 ( line(15:28) );
  indcrd = s_to_i4 ( line(29:42) );
  valcrd = s_to_i4 ( line(43:56) );
  rhscrd = s_to_i4 ( line(57:70) );

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
  nrow   = s_to_i4 ( line(15:28) );
  ncol   = s_to_i4 ( line(29:42) );
  nnzero = s_to_i4 ( line(43:56) );
  neltvl = s_to_i4 ( line(57:70) );

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
    nrhs   = s_to_i4 ( line(15:28) );
    nrhsix = s_to_i4 ( line(29:42) );

  else

    rhstyp = ' ';
    nrhs = 0;
    nrhsix = 0;

  end

  return
end
