function hb_io_test08 ( )

%*****************************************************************************80
%
%% HB_IO_TEST08 tests HB_RHS_WRITE, HB_GUESS_WRITE, HB_EXACT_WRITE;
%
  neltvl = 0;
  nnzero = 126;
  nrhs = 1;
  nrhsix = 0;
  nrow = 32;

  exact = [ ...
    1.0,   2.0,   3.0,   4.0,   5.0,   6.0,   7.0,   8.0,   9.0,  10.0, ...
   11.0,  12.0,  13.0,  14.0,  15.0,  16.0,  17.0,  18.0,  19.0,  20.0, ...
   21.0,  22.0,  23.0,  24.0,  25.0,  26.0,  27.0,  28.0,  29.0,  30.0, ...
   31.0,  32.0 ]';
  guess = [ ...
    1.0,   1.0,   1.0,   1.0,   1.0,   1.0,   1.0,   1.0,   1.0,   1.0, ...
    1.0,   1.0,   1.0,   1.0,   1.0,   1.0,   1.0,   1.0,   1.0,   1.0, ...
    1.0,   1.0,   1.0,   1.0,   1.0,   1.0,   1.0,   1.0,   1.0,   1.0, ...
    1.0,   1.0 ]';
  indfmt = '(16I5)';
  mxtype = 'RUA';
  output_file = 'rua_32_rhs.txt';
  ptrfmt = '(16I5)';
  rhscrd = 12;
  rhsfmt = '(10F7.1)';
  rhsind = 0;
  rhsptr = 0;
  rhsval = [ ...
    101.0, 102.0, 103.0, 104.0, 107.0, 126.0, 201.0, 202.0, 209.0, 221.0, ...
    228.0, 302.0, 303.0, 306.0, 308.0, 309.0, 329.0, 403.0, 404.0, 405.0, ...
    412.0, 503.0, 505.0, 523.0, 527.0, 601.0, 606.0, 616.0, 703.0, 707.0, ...
    714.0, 721.0 ]';
  rhsvec = 0;
  rhstyp = 'FGX';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_IO_TEST08\n' );
  fprintf ( 1, '  HB_RHS_WRITE writes right hand sides to an HB file.\n' );
  fprintf ( 1, '  HB_GUESS_WRITE writes starting guesses to an HB file.\n' );
  fprintf ( 1, '  HB_EXACT_WRITE writes exact solutions to an HB file.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Writing the file "%s".\n', output_file );

  output_unit = fopen (output_file, 'wt' );

  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_IO_TEST08 - Fatal error!\n' );
    fprintf ( 1, '  Error opening the file.\n' );
    return;
  end
%
%  Write the right hand sides.
%
  hb_rhs_write ( output_unit, nrow, nnzero, nrhs, nrhsix, ...
    rhscrd, ptrfmt, indfmt, rhsfmt, mxtype, rhstyp, rhsval, ...
    rhsind, rhsptr, rhsvec );
%
%  Write the right hand sides.
%
  hb_guess_write ( output_unit, nrow, nrhs, rhscrd, rhsfmt, rhstyp, ...
    guess );
%
%  Write the right hand sides.
%
  hb_exact_write ( output_unit, nrow, nrhs, rhscrd, rhsfmt, rhstyp, ...
    exact );

  fclose ( output_unit );

  return
end
