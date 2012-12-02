function hb_io_test09 ( input_file )

%*****************************************************************************80
%
%% HB_IO_TEST09 tests HB_FILE_READ;
%
%  Modified:
%
%    04 February 2005
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_IO_TEST09\n' );
  fprintf ( 1, '  HB_FILE_READ reads all the data in an HB file.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reading the file "%s".\n', input_file );

  input_unit = fopen ( input_file );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_IO_TEST09 - Fatal error!\n' );
    fprintf ( 1, '  Error opening the file.\n' );
    error ( 'HB_IO_TEST09 - Fatal error!' );
  end

  [ title, key, totcrd, ptrcrd, indcrd, valcrd, rhscrd, mxtype, ...
    nrow, ncol, nnzero, neltvl, ptrfmt, indfmt, valfmt, rhsfmt, rhstyp, ...
    nrhs, nrhsix, colptr, rowind, values, rhsval, rhsptr, rhsind, guess, ...
    exact ] = hb_file_read ( input_unit );
%
%  Print out the header information.
%
  hb_header_print ( title, key, totcrd, ptrcrd, indcrd, valcrd, ...
    rhscrd, mxtype, nrow, ncol, nnzero, neltvl, ptrfmt, indfmt, valfmt, ...
    rhsfmt, rhstyp, nrhs, nrhsix );
%
%  Print the structure information.
%
  hb_structure_print ( ncol, mxtype, nnzero, neltvl, colptr, rowind );
%
%  Print the values.
%
  hb_values_print ( ncol, colptr, mxtype, nnzero, neltvl, values );

  if ( 0 < rhscrd )
%
%  Print a bit of the right hand sides.
%
    if ( rhstyp(1) == 'F' )

      r8mat_print_some ( nrow, nrhs, rhsval, 1, 1, 5, 5, '  Part of RHS' );

    elseif ( rhstyp(1) == 'M' & mxtype(3) == 'A' )

      i4vec_print_some ( nrhs+1, rhsptr, 10, '  Part of RHSPTR' );
      i4vec_print_some ( nrhsix, rhsind, 10, '  Part of RHSIND' );
      r8vec_print_some ( nrhsix, rhsvec, 10, '  Part of RHSVEC' );

    elseif ( rhstyp(1) == 'M' & mxtype(3) == 'E' )

      r8mat_print_some ( nnzero, nrhs, rhsval, 1, 1, 5, 5, '  Part of RHS' );

    end
%
%  Print a bit of the starting guesses.
%
    if ( rhstyp(2) == 'G' )

      r8mat_print_some ( nrow, nrhs, guess, 1, 1, 5, 5, '  Part of GUESS' )

    end
%
%  Print a bit of the exact solutions.
%
    if ( rhstyp(3) == 'X' )

      r8mat_print_some ( nrow, nrhs, exact, 1, 1, 5, 5, '  Part of EXACT' );

    end

  end

  fclose ( input_unit );

  return
end
