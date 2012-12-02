function hb_io_test02 ( )

%*****************************************************************************80
%
%% HB_IO_TEST02 tests HB_HEADER_WRITE;
%
  indcrd = 8;
  indfmt = '(16I5)';
  key = 'RUA_32';
  mxtype = 'PUA';
  ncol = 32;
  neltvl = 0;
  nnzero = 126;
  nrhs = 0;
  nrhsix = 0;
  nrow = 32;
  output_file = 'rua_32_header.txt';
  ptrcrd = 3;
  ptrfmt = '(16I5)';
  rhscrd = 0;
  rhsfmt = ' ';
  rhstyp = '   ';
  title = '1Real unsymmetric assembled matrix based on IBM32';
  totcrd = 11;
  valcrd = 0;
  valfmt = ' ';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_IO_TEST02\n' );
  fprintf ( 1, '  HB_HEADER_WRITE writes the header of an HB file.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Writing the file "%s".\n', output_file );

  output_unit = fopen ( output_file, 'wt' );

  if ( output_unit < 0 )
    error ( ['Can''t open file "' output_file '" for writing.'] ); 
  end

  hb_header_write ( output_unit, title, key, totcrd, ptrcrd, indcrd, ...
    valcrd, rhscrd, mxtype, nrow, ncol, nnzero, neltvl, ptrfmt, indfmt, ...
    valfmt, rhsfmt, rhstyp, nrhs, nrhsix );

  fclose ( output_unit );

  return
end
