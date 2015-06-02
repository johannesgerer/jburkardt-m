function dlap_io_test04 ( )

%*****************************************************************************80
%
%% DLAP_IO_TEST04 tests DLAP_FILE_READ.
%
%  Discussion:
%
%    In this example, a matrix in symmetric storage will be read.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2014
%
%  Author:
%
%    John Burkardt
%
  n_max = 5;
  nelt_max = 11;
  input_filename = 'a5by5_sym.dlap';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DLAP_IO_TEST04\n' );
  fprintf ( 1, '  DLAP_FILE_READ reads a matrix from a SLAP sparse\n' );
  fprintf ( 1, '  matrix file into DLAP Triad format.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, symmetric storage is used.\n' );

  input = fopen ( input_filename, 'rt' );

  [ n, nelt, isym, irhs, isoln, ia, ja, a, rhs, soln ] = ...
    dlap_file_read ( n_max, nelt_max, input );

  fclose ( input );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the matrix data from "%s"\n', input_filename );

  dlap_file_print ( n, nelt, isym, irhs, isoln, ia, ja, a, rhs, ...
    soln, '  The DLAP data read from the file.' );

  return
end

