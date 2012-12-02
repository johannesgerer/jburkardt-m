function hb_io_test07 ( input_file )

%*****************************************************************************80
%
%% HB_IO_TEST07 tests HB_RHS_READ, HB_GUESS_READ, HB_EXACT_READ;
%
%  Modified:
%
%    04 February 2005
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_IO_TEST07\n' );
  fprintf ( 1, '  HB_RHS_READ reads right hand sides from an HB file.\n' );
  fprintf ( 1, '  HB_GUESS_READ reads starting guesses from an HB file.\n' );
  fprintf ( 1, '  HB_EXACT_READ reads exact solutions from an HB file.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reading the file "%s".\n', input_file );

  input_unit = fopen ( input_file );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_IO_TEST07 - Fatal error!\n' );
    fprintf ( 1, '  Error opening the file.\n' );
    error ( 'HB_IO_TEST07 - Fatal error!' );
  end

  fprintf ( 1, '  Reading the header.\n' );

  [ title, key, totcrd, ptrcrd, indcrd, valcrd, rhscrd, mxtype, nrow, ...
    ncol, nnzero, neltvl, ptrfmt, indfmt, valfmt, rhsfmt, rhstyp, ...
    nrhs, nrhsix ] = hb_header_read ( input_unit );

  fprintf ( 1, '  Reading the structure.\n' );

  [ colptr, rowind ] = hb_structure_read ( input_unit, ncol, mxtype, ...
    nnzero, neltvl, ptrcrd, ptrfmt, indcrd, indfmt );

  fprintf ( 1, '  Reading the values.\n' );

  values = hb_values_read ( input_unit, valcrd, mxtype, nnzero, neltvl, ...
    valfmt );

  if ( 0 < rhscrd )
%
%  Read the right hand sides.
%
    if ( rhstyp(1) == 'F' )

      fprintf ( 1, '  Reading the right hand sides.\n' );

      rhsval = hb_rhs_read ( input_unit, nrow, nnzero, ...
        nrhs, nrhsix, rhscrd, ptrfmt, indfmt, rhsfmt, mxtype, rhstyp );

      r8mat_print_some ( nrow, nrhs, rhsval, 1, 1, 5, 5, '  Part of RHS' );

    elseif ( rhstyp(1) == 'M' & mxtype(3) == 'A' )

      fprintf ( 1, '  Reading the right hand sides.\n' );

      [ rhsind, rhsptr, rhsval ] = hb_rhs_read ( input_unit, nrow, ...
        nnzero, nrhs, nrhsix, rhscrd, ptrfmt, indfmt, rhsfmt, mxtype, ...
        rhstyp );
      
      r8vec_print_some ( nrhsix, rhsval, 10, '  Part of RHSVAL' );
      i4vec_print_some ( nrhs+1, rhsptr, 10, '  Part of RHSPTR' );
      i4vec_print_some ( nrhsix, rhsind, 10, '  Part of RHSIND' );

    elseif ( rhstyp(1) == 'M' & mxtype(3) == 'E' )

      fprintf ( 1, '  Reading the right hand sides.\n' );

      rhsval = hb_rhs_read ( input_unit, nrow, nnzero, nrhs, nrhsix, ...
        rhscrd, ptrfmt, indfmt, rhsfmt, mxtype, rhstyp );

      r8mat_print_some ( nnzero, nrhs, rhsval, 1, 1, 5, 5, '  Part of RHS' );

    end
%
%  Read the starting guesses.
%
    if ( rhstyp(2) == 'G' )

      fprintf ( 1, '  Reading the starting guesses.\n' );

      guess = hb_guess_read ( input_unit, nrow, nrhs, rhscrd, rhsfmt, rhstyp );

      r8mat_print_some ( nrow, nrhs, guess, 1, 1, 5, 5, '  Part of GUESS' );

    end
%
%  Read the exact solutions.
%
    if ( rhstyp(3) == 'X' )

      fprintf ( 1, '  Reading the exact solutions.\n' );

      exact = hb_exact_read ( input_unit, nrow, nrhs, rhscrd, rhsfmt, rhstyp );

      r8mat_print_some ( nrow, nrhs, exact, 1, 1, 5, 5, '  Part of EXACT' );

    end

  end

  fclose ( input_unit );

  return
end
