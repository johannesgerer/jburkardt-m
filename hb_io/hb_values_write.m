function hb_values_write ( output_unit, valcrd, mxtype, nnzero, neltvl, ...
  valfmt, values )

%*****************************************************************************80
%
%% HB_VALUES_WRITE writes the values of an HB matrix.
%
%  Discussion:
%
%    If the user is creating an HB file, then the user should already
%    have opened the file, and written the header and structure records.
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
%    Input, real VALUES(NNZERO) or VALUES(NELTVL), the nonzero values
%    of the matrix.
%
  if ( 0 < valcrd )
%
%  From the FORTRAN format string VALFMT, determine the number of
%  values per line, and their width.
%
    line = valfmt(2:length(valfmt));
    [ val_nperline, count, errmsg, nextindex ] = sscanf ( line, '%d' );
    line = line(nextindex+1:length(line));
    [ val_len, count, errmsg, nextindex ] = sscanf ( line, '%d' );
    s = int2str ( val_len );
    val_format = [ '%' s 'f' ];

    if ( mxtype(3:3) == 'A' )

      for j = 1 : nnzero
        fprintf ( output_unit, val_format, values(j) );
        if ( mod ( j, val_nperline ) == 0 ) 
          fprintf ( output_unit, '\n' );
        end
      end

      if ( mod ( nnzero, val_nperline ) ~= 0 )
        fprintf ( output_unit, '\n' );
      end

    elseif ( mxtype(3:3) == 'E' )

      for j = 1 : neltvl
        fprintf ( output_unit, val_format, values(j) );
        if ( mod ( j, val_nperline ) == 0 ) 
          fprintf ( output_unit, '\n' );
        end
      end

      if ( mod ( neltvl, val_nperline ) ~= 0 )
        fprintf ( output_unit, '\n' );
      end

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'HB_VALUES_WRITE - Fatal error!\n' );
      fprintf ( 1, '  Illegal value of MXTYPE(3:3).\n' );
      stop

    end

  end

  return
end
