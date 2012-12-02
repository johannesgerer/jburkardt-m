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
            rhsval(j,irhs) = s_to_r8 ( s );
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
            rhsptr(j) = s_to_i4 ( s );
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
            rhsind(j) = s_to_i4 ( s );
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
            rhsval(j) = s_to_r8 ( s );
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
              rhsval(j,irhs) = s_to_r8 ( s );
            end 
          end
        end

      else

        fprintf ( 1, '\n' );
        fprintf ( 1, 'HB_RHS_READ - Fatal error!\n' );
        fprintf ( 1, '  Illegal value of MXTYPE(3)!\n' );
        error ( 'HB_RHS_READ - Fatal error!' );

      end
%
%  0 < RHSCARD, but RHSTYP not recognized.
%
    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'HB_RHS_READ - Fatal error!\n' );
      fprintf ( 1, '  Illegal value of RHSTYP(1)!\n' );
      error ( 'HB_RHS_READ - Fatal error!' );

    end

  end

  return
end
