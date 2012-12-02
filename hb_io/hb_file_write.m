function hb_file_write ( output_unit, title, key, totcrd, ptrcrd, indcrd, ...
  valcrd, rhscrd, mxtype, nrow, ncol, nnzero, neltvl, ptrfmt, indfmt, ...
  valfmt, rhsfmt, rhstyp, nrhs, nrhsix, colptr, rowind, values, ...
  rhsval, rhsptr, rhsind, rhsvec, guess, exact )

%*****************************************************************************80
%
%% HB_FILE_WRITE writes an HB file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2003
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
%    Input, integer OUTPUT_UNIT, the unit to which data is written.
%
%    Input, character ( len = 72 ) TITLE, a title for the matrix.
%
%    Input, character ( len = 8 ) KEY, an identifier for the matrix.
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
%    Input, character ( len = 3 ) MXTYPE, the matrix type.
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
%    Input, character ( len = 16 ) PTRFMT, the format for reading pointers.
%
%    Input, character ( len = 16 ) INDFMT, the format for reading indices.
%
%    Input, character ( len = 20 ) VALFMT, the format for reading values.
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
%    Input, integer NRHS, the number of right hand sides.
%
%    Input, integer NRHSIX, the number of row indices (set to 0
%    in the case of unassembled matrices.)  Ignored if NRHS = 0.
%
%    Input, integer COLPTR(NCOL+1), COLPTR(I) points to the location of
%    the first entry of column I in the sparse matrix structure.
%
%    Input, integer ROWIND(NNZERO) or ROWIND(NELTVL), the row index of
%    each item.
%
%    Input, real VALUES(NNZERO) or VALUES(NELTVL), the nonzero values
%    of the matrix.
%
%    If RHSTYP(1:1) == 'F':
%
%      Input, real RHSVAL(NROW,NRHS), contains NRHS dense right hand
%      side vectors.
%
%      Input, integer RHSPTR(*), is not used.
%
%      Input, integer RHSIND(*), is not used.
%
%      Input, real RHSVEC(*), is not used.
%
%    If RHSTYP(1:1) = 'M' and MXTYPE(3:3) = 'A':
%
%      Input, real RHSVAL(NROW,NRHS), is not used.
%
%      Input, integer RHSPTR(NRHS+1), RHSPTR(I) points to the location of
%      the first entry of right hand side I in the sparse right hand
%      side vector.
%
%      Input, integer RHSIND(NRHSIX), indicates, for each entry of
%      RHSVAL, the corresponding row index.
%
%      Input, real RHSVEC(NRHSIX), contains the value of the right hand
%      side entries.
%
%    If RHSTYP(1:1) = 'M' and MXTYPE(3:3) = 'E':
%
%      Input, real RHSVAL(NNZERO,NRHS), contains NRHS unassembled
%      finite element vector right hand sides.
%
%      Input, integer RHSPTR(*), is not used.
%
%      Input, integer RHSIND(*), is not used.
%
%      Input, real RHSVEC(*), is not used.
%
%    Input, real GUESS(NROW,NRHS), the starting guess vectors.
%
%    Input, real EXACT(NROW,NRHS), the exact solution vectors.
%

%
%  Write the header block.
%
  hb_header_write ( output_unit, title, key, totcrd, ptrcrd, indcrd, ...
    valcrd, rhscrd, mxtype, nrow, ncol, nnzero, neltvl, ptrfmt, indfmt, ...
    valfmt, rhsfmt, rhstyp, nrhs, nrhsix );
%
%  Write the matrix structure.
%
  hb_structure_write ( output_unit, ncol, mxtype, nnzero, neltvl, ...
    ptrfmt, indfmt, colptr, rowind );
%
%  Write the matrix values.
%
  hb_values_write ( output_unit, valcrd, mxtype, nnzero, neltvl, ...
    valfmt, values );
%
%  Write the right hand sides.
%
  hb_rhs_write ( output_unit, nrow, nnzero, nrhs, nrhsix, ...
    rhscrd, ptrfmt, indfmt, rhsfmt, mxtype, rhstyp, rhsval, ...
    rhsind, rhsptr, rhsvec );
%
%  Write the starting guesses.
%
  hb_guess_write ( output_unit, nrow, nrhs, rhscrd, rhsfmt, rhstyp, ...
    guess );
%
%  Write the exact solutions.
%
  hb_exact_write ( output_unit, nrow, nrhs, rhscrd, rhsfmt, rhstyp, ...
    exact );

  return
end
