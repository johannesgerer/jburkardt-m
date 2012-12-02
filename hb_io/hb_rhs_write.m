function hb_rhs_write ( output_unit, nrow, nnzero, nrhs, nrhsix, ...
  rhscrd, ptrfmt, indfmt, rhsfmt, mxtype, rhstyp, rhsval, ...
  rhsind, rhsptr, rhsvec )

%*****************************************************************************80
%
%% HB_RHS_WRITE writes the right hand side information to an HB file.
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
    if ( rhstyp(1:1) == 'F' )

      line = rhsfmt(2:length(rhsfmt));
      [ rhs_nperline, count, errmsg, nextindex ] = sscanf ( line, '%d' );
      line = line(nextindex+1:length(line));
      [ rhs_len, count, errmsg, nextindex ] = sscanf ( line, '%d' );
      s = int2str ( rhs_len );
      rhs_format = [ '%' s 'f' ];

      k = 0;
      for j = 1 : nrhs
        for i = 1 : nrow
          fprintf ( output_unit, rhs_format, rhsval(i,j) );
          k = k + 1;
          if ( mod ( k, rhs_nperline ) == 0 ) 
            fprintf ( output_unit, '\n' );
          end
        end
      end

      if ( mod ( nrow * nrhs, rhs_nperline ) ~= 0 )
        fprintf ( output_unit, '\n' );
      end
%
%  Sparse right-hand sides stored like the matrix.
%  Read pointer array, indices, and values.
%
    elseif ( rhstyp(1:1) == 'M' )

      if ( mxtype(3:3) == 'A' )

        line = ptrfmt(2:length(ptrfmt));
        [ ptr_nperline, count, errmsg, nextindex ] = sscanf ( line, '%d' );
        line = line(nextindex+1:length(line));
        [ ptr_len, count, errmsg, nextindex ] = sscanf ( line, '%d' );
        s = int2str ( ptr_len );
        ptr_format = [ '%' s 'f' ];

        line = indfmt(2:length(indfmt));
        [ ind_nperline, count, errmsg, nextindex ] = sscanf ( line, '%d' );
        line = line(nextindex+1:length(line));
        [ ind_len, count, errmsg, nextindex ] = sscanf ( line, '%d' );
        s = int2str ( ind_len );
        ind_format = [ '%' s 'f' ];

        line = rhsfmt(2:length(rhsfmt));
        [ rhs_nperline, count, errmsg, nextindex ] = sscanf ( line, '%d' );
        line = line(nextindex+1:length(line));
        [ rhs_len, count, errmsg, nextindex ] = sscanf ( line, '%d' );
        s = int2str ( rhs_len );
        rhs_format = [ '%' s 'f' ];

        for i = 1 : nrhs + 1
          fprintf ( output_unit, ptr_format, rhsptr(i) );
          if ( mod ( i, ptr_nperline ) == 0 ) 
            fprintf ( output_unit, '\n' );
          end
        end

        if ( mod ( nrhs + 1, ptr_nperline ) ~= 0 )
          fprintf ( output_unit, '\n' );
        end

        for i = 1 : nrhsix
          fprintf ( output_unit, ind_format, rhsind(i) );
          if ( mod ( i, ind_nperline ) == 0 ) 
            fprintf ( output_unit, '\n' );
          end
        end

        if ( mod ( nrhsix, ind_nperline ) ~= 0 )
          fprintf ( output_unit, '\n' );
        end

        for i = 1 : nrhsix
          fprintf ( output_unit, rhs_format, rhsval(i) );
          if ( mod ( i, rhs_nperline ) == 0 ) 
            fprintf ( output_unit, '\n' );
          end
        end

        if ( mod ( nrhsix, rhs_nperline ) ~= 0 )
          fprintf ( output_unit, '\n' );
        end
%
%  Sparse right hand sides in finite element format.
%
      elseif ( mxtype(3:3) == 'E' )

        line = rhsfmt(2:length(rhsfmt));
        [ rhs_nperline, count, errmsg, nextindex ] = sscanf ( line, '%d' );
        line = line(nextindex+1:length(line));
        [ rhs_len, count, errmsg, nextindex ] = sscanf ( line, '%d' );
        s = int2str ( rhs_len );
        rhs_format = [ '%' s 'f' ];

        k = 0;
        for j = 1 : nrhs
          for i = 1 : nnzero
            fprintf ( output_unit, rhs_format, rhsval(i,j) );
            k = k + 1;
            if ( mod ( k, rhs_nperline ) == 0 ) 
              fprintf ( output_unit, '\n' );
            end
          end
        end

        if ( mod ( nnzero * nrhs, rhs_nperline ) ~= 0 )
          fprintf ( output_unit, '\n' );
        end

      else

        fprintf ( 1, '\n' );
        fprintf ( 1, 'HB_RHS_WRITE - Fatal error!\n' );
        fprintf ( 1, '  Illegal value of MXTYPE(3:3)!\n' );
        return;

      end

    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_RHS_WRITE - Fatal error%\n' );
    fprintf ( 1, '  Illegal value of RHSTYP(1:1)!\n' );
    return;

  end

  return
end
