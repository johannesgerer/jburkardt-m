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
