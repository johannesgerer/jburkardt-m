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
%    Input, integer PTRCRD, the number of pointer records.
%
%    Input, character ( len = 16 ) PTRFMT, the format for reading pointers.
%
%    Input, integer INDCRD, the number of index records.
%
%    Input, character ( len = 16 ) INDFMT, the format for reading indices.
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
      colptr(j) = s_to_i4 ( s );
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
        rowind(j) = s_to_i4 ( s );
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
        rowind(j) = s_to_i4 ( s );
      end 

    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_STRUCTURE_READ - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of MXTYPE(3).\n' );
    return

  end

  return
end
