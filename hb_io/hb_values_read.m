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
          values(j) = s_to_r8 ( s );
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
          values(j) = s_to_r8 ( s );
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
