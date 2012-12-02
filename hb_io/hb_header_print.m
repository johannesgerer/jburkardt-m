function hb_header_print ( title, key, totcrd, ptrcrd, indcrd, valcrd, ...
  rhscrd, mxtype, nrow, ncol, nnzero, neltvl, ptrfmt, indfmt, valfmt, ...
  rhsfmt, rhstyp, nrhs, nrhsix )

%*****************************************************************************80
%
%% HB_HEADER_PRINT prints the header of an HB file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 November 2003
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
%
%    Input, integer NRHS, the number of right hand sides.
%
%    Input, integer NRHSIX, the number of entries of storage for right
%    hand side values, in the case where RHSTYP(1:1) = 'M' and
%    MXTYPE(3:3) = 'A'.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  TOTCRD = %6d\n', totcrd );
  fprintf ( 1, '  PTRCRD = %6d\n', ptrcrd );
  fprintf ( 1, '  INDCRD = %6d\n', indcrd );
  fprintf ( 1, '  VALCRD = %6d\n', valcrd );
  fprintf ( 1, '  RHSCRD = %6d\n', rhscrd );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  KEY =    "%s".\n', key );
  fprintf ( 1, '  MXTYPE = "%s".\n', mxtype );
  fprintf ( 1, '  RHSTYP = "%s".\n', rhstyp );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NROW   = %6d\n', nrow );
  fprintf ( 1, '  NCOL   = %6d\n', ncol );
  fprintf ( 1, '  NNZERO = %6d\n', nnzero );
  fprintf ( 1, '  NELTVL = %6d\n', neltvl );
  fprintf ( 1, '  NRHS   = %6d\n', nrhs );
  fprintf ( 1, '  NRHSIX = %6d\n', nrhsix );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PTRFMT =    "%s".\n', ptrfmt );
  fprintf ( 1, '  INDFMT =    "%s".\n', indfmt );
  fprintf ( 1, '  VALFMT =    "%s".\n', valfmt );
  fprintf ( 1, '  RHSFMT =    "%s".\n', rhsfmt );

  return
end
