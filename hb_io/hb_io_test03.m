function hb_io_test03 ( input_file )

%*****************************************************************************80
%
%% HB_IO_TEST03 tests HB_STRUCTURE_READ;
%
%  Modified:
%
%    08 April 2004
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_IO_TEST03\n' );
  fprintf ( 1, '  HB_STRUCTURE_READ reads the structure of an HB file.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reading the file "%s".\n', input_file );

  input_unit = fopen ( input_file );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_IO_TEST03 - Fatal error!\n' );
    fprintf ( 1, '  Error opening the file.\n' );
    return;
  end

  fprintf ( 1, '  Reading the header.\n' );

  [ title, key, totcrd, ptrcrd, indcrd, valcrd, rhscrd, mxtype, nrow, ...
    ncol, nnzero, neltvl, ptrfmt, indfmt, valfmt, rhsfmt, rhstyp, ...
    nrhs, nrhsix ] = hb_header_read ( input_unit );

  fprintf ( 1, '  Reading the structure.\n' );

  [ colptr, rowind ] = hb_structure_read ( input_unit, ncol, mxtype, ...
    nnzero, neltvl, ptrcrd, ptrfmt, indcrd, indfmt );

  fclose ( input_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '  KEY =    "%s".\n', key );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NROW =   %d\n', nrow );
  fprintf ( 1, '  NCOL =   %d\n', ncol );
  fprintf ( 1, '  NNZERO = %d\n', nnzero );
  fprintf ( 1, '  NELTVL = %d\n', neltvl );

  hb_structure_print ( ncol, mxtype, nnzero, neltvl, colptr, rowind );

  return
end
