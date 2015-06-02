function dlap_io_test03 ( )

%*****************************************************************************80
%
%% DLAP_IO_TEST03 tests DLAP_FILE_WRITE.
%
%  Discussion:
%
%    The symmetric matrix is:
%
%      11   0  31   0  51
%       0  22   0   0   0
%      31   0  33  43   0
%       0   0  43  44  54
%      51   0   0  54  55
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
  n = 5;
  nelt = 9;

  a = [ 11.0, 31.0, 51.0, 22.0, 33.0, ...
        43.0, 44.0, 54.0, 55.0 ];
  ia = [ 1, 3, 5, 2, 3, 4, 4, 5, 5  ];
  irhs = 1;
  isoln = 1;
  isym = 1;
  output_filename = 'a5by5_sym.dlap';
  ja = [ 1, 1, 1, 2, 3, 3, 4, 4, 5 ];
  rhs = [ 359.0, 44.0, 302.0, 575.0, 542.0 ];
  soln = [ 1.0, 2.0, 3.0, 4.0, 5.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DLAP_IO_TEST03\n' );
  fprintf ( 1, '  DLAP_FILE_WRITE writes a matrix in SLAP Triad format\n' );
  fprintf ( 1, '  to a DLAP sparse matrix file.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, symmetric storage is used.\n' );

  dlap_file_print ( n, nelt, isym, irhs, isoln, ia, ja, a, rhs, ...
    soln, '  The DLAP data to be written to the file.' );

  output = fopen ( output_filename, 'wt' );

  dlap_file_write ( n, nelt, isym, irhs, isoln, ia, ja, a, rhs, soln, output );

  fclose ( output );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the matrix data to "%s"\n', output_filename );

  return
end
