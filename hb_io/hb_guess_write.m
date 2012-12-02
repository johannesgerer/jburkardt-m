function hb_guess_write ( output_unit, nrow, nrhs, rhscrd, rhsfmt, rhstyp, ...
  guess )

%*****************************************************************************80
%
%% HB_GUESS_WRITE writes the starting guess vectors to an HB file.
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
%    Input, integer NRHS, the number of right hand sides.
%
%    Input, integer RHSCRD, the number of lines in the file for
%    right hand sides.
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
%    Input, real GUESS(NROW,NRHS), the starting guess vectors.
%

  if ( 0 < rhscrd )

    if ( rhstyp(2:2) == 'G' )
%
%  From the FORTRAN format string RHSFMT, determine the number of
%  values per line, and their width.
%
      line = rhsfmt(2:length(rhsfmt));
      [ rhs_nperline, count, errmsg, nextindex ] = sscanf ( line, '%d' );
      line = line(nextindex+1:length(line));
      [ rhs_len, count, errmsg, nextindex ] = sscanf ( line, '%d' );
      s = int2str ( rhs_len );
      rhs_format = [ '%' s 'f' ];

      k = 0;
      for j = 1 : nrhs
        for i = 1 : nrow
          fprintf ( output_unit, rhs_format, guess(i,j) );
          k = k + 1;
          if ( mod ( k, rhs_nperline ) == 0 ) 
            fprintf ( output_unit, '\n' );
          end
        end
      end

      if ( mod ( nrow * nrhs, rhs_nperline ) ~= 0 )
        fprintf ( output_unit, '\n' );
      end

    end

  end

  return
end
