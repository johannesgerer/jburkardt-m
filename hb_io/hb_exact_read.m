function exact = hb_exact_read ( input_unit, nrow, nrhs, rhscrd, rhsfmt, rhstyp )

%*****************************************************************************80
%
%% HB_EXACT_READ reads the exact solution vectors in an HB file.
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
%    Output, real EXACT(NROW,NRHS), the exact solution vectors.
%
  exact = [];

  if ( 0 < rhscrd )

    if ( rhstyp(3) == 'X' ) 

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
            exact(j,irhs) = s_to_r8 ( s );
          end 
        end
      end

    end

  end

  return
end
