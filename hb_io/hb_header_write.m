function hb_header_write ( output_unit, title, key, totcrd, ptrcrd, indcrd, ...
  valcrd, rhscrd, mxtype, nrow, ncol, nnzero, neltvl, ptrfmt, indfmt, ...
  valfmt, rhsfmt, rhstyp, nrhs, nrhsix )

%*****************************************************************************80
%
%% HB_HEADER_WRITE writes the header of an HB file.
%
%  Discussion:
%
%    The user should already have opened the file, and positioned it
%    to the first record.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 November 2003
%
%  Author:
%
%    John Burkardt
%
%    Xiaoye Li
%    UC Berkeley. 
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992.
%
%  Parameters:
%
%    Input, file pointer OUTPUT_UNIT, the unit to which data is written.
%
%    Input, string TITLE, a title for the matrix, up to 72 characters.
%
%    Input, string KEY, an identifier for the matrix, up to 8 characters.
%
%    Input, integer TOTCRD, the total number of lines of data.
%
%    Input, integer PTRCRD, the number of input lines for pointers.
%
%    Input, integer INDCRD, the number of input lines for row indices.
%
%    Input, integer VALCRD, the number of input lines for numerical values.
%
%    Input, integer RHSCRD, the number of input lines for right hand sides.
%
%    Input, string MXTYPE, the matrix type, up to 3 characters
%    First character is R for Real, C for complex, P for pattern only.
%    Second character is S for symmetric, U for unsymmetric, H for
%      Hermitian, Z for skew symmetric, R for rectangular.
%    Third character is A for assembled and E for unassembled
%      finite element matrices.
%
%    Input, integer NROW, the number of rows or variables.
%
%    Input, integer NCOL, the number of columns or elements.
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
%    Input, string PTRFMT, the format for reading pointers,
%    up to 16 characters.
%
%    Input, string INDFMT, the format for reading indices,
%    up to 16 characters.
%
%    Input, string VALFMT, the format for reading values,
%    up to 20 characters.
%
%    Input, string RHSFMT, the format for reading values
%    of the right hand side, up to 20 characters.
%
%    Input, string RHSTYP, the right hand side type, up to 3 characters.
%    First character is F for full storage or M for same as matrix.
%    Second character is G if starting "guess" vectors are supplied.
%    Third character is X if exact solution vectors are supplied.
%    Ignored if NRHS = 0.
%
%    Input, integer NRHS, the number of right hand sides.
%
%    Input, integer NRHSIX, the number of row indices (set to 0
%    in the case of unassembled matrices.)  Ignored if NRHS = 0.
%

%
%  Line 1.
%
  t = title; 
  m = size ( t, 2 );
  for i = m + 1 : 72;
    t = [t ' ']; 
  end;
  fprintf ( output_unit, '%72s', t );

  t = key; 
  m = size ( t, 2 );
  for i = m+1 : 8
    t = [t ' ']; 
  end;
  fprintf ( output_unit, '%8s\n', t );
%
%  Line 2.
%
  fprintf ( output_unit, '%14d%14d%14d%14d%14d\n', ...
    totcrd, ptrcrd, indcrd, valcrd, rhscrd );
%
%  Line 3.
%
  t = mxtype; 
  m = size ( t, 2 );
  for i = m+1 : 14
    t = [t ' ']; 
  end;
  fprintf ( output_unit, '%14s', t );
  fprintf ( output_unit, '%14i%14i%14i%14i\n', nrow, ncol, nnzero, neltvl );
%
%  Line 4.
%
  t = ptrfmt; 
  m = size ( t, 2 );
  for i = m + 1 : 16
    t = [ t ' ' ]; 
  end;
  fprintf ( output_unit, '%16s', t );

  t = indfmt; 
  m = size ( t, 2 );
  for i = m + 1 : 16
    t = [ t ' ' ]; 
  end;
  fprintf ( output_unit, '%16s', t );

  t = valfmt;
  m = size ( t, 2 );
  for i = m + 1 : 20
    t = [t ' '];
  end;
  fprintf ( output_unit, '%20s', t );

  t = rhsfmt;
  m = size ( t, 2 );
  for i = m + 1 : 20
    t = [t ' '];
  end;
  fprintf ( output_unit, '%20s\n', t );
%
%  (Optional) Line 5.
%
  if ( 0 < rhscrd )

    t = rhstyp; 
    m = size ( t, 2 );
    for i = m + 1 : 14
      t = [ t ' ' ]; 
    end;

    fprintf ( output_unit, '%16s', t );
    fprintf ( output_unit, '%14i%14i\n', nrhs, nrhsix );

  end

  return
end
