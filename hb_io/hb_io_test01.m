function hb_io_test01 ( input_file )

%*****************************************************************************80
%
%% HB_IO_TEST01 tests HB_HEADER_READ;
%
%  Modified:
%
%    08 April 2004
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_IO_TEST01\n' );
  fprintf ( 1, '  HB_HEADER_READ reads the header of an HB file.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reading the file "%s".\n', input_file );

  input_unit = fopen ( input_file );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_IO_TEST01 - Fatal error!\n' );
    fprintf ( 1, '  Error opening the file.\n' );
    return;
  end
%
%  Read the header.
%
  [ title, key, totcrd, ptrcrd, indcrd, valcrd, rhscrd, mxtype, nrow, ...
    ncol, nnzero, neltvl, ptrfmt, indfmt, valfmt, rhsfmt, rhstyp, ...
    nrhs, nrhsix ] = hb_header_read ( input_unit );

  fclose ( input_unit );
%
%  Print the  header.
%
  hb_header_print ( title, key, totcrd, ptrcrd, indcrd, valcrd, ...
    rhscrd, mxtype, nrow, ncol, nnzero, neltvl, ptrfmt, indfmt, valfmt, ...
    rhsfmt, rhstyp, nrhs, nrhsix );

  return
end
