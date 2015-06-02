function dlap_io_test01 ( )

%*****************************************************************************80
%
%% DLAP_IO_TEST01 tests DLAP_FILE_WRITE.
%
%  Discussion:
%
%    The matrix is:
%
%      11  12   0   0  15
%      21  22   0   0   0
%       0   0  33   0  35
%       0   0   0  44   0
%      51   0  53   0  55
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
  nelt = 11;

  a = [ 51.0, 12.0, 11.0, 33.0, 15.0, ...
        53.0, 55.0, 22.0, 35.0, 44.0, ...
        21.0 ];
  ia = [ 5,  1,  1,  3,  1,  5,  5,  2,  3,  4,  2 ];
  irhs = 1;
  isoln = 1;
  isym = 0;
  output_filename = 'a5by5.dlap';
  ja = [ 1,  2,  1,  3,  5,  3,  5,  2,  5,  4,  1 ];
  rhs = [ 110.0, 65.0, 274.0, 176.0, 485.0 ];
  soln = [ 1.0, 2.0, 3.0, 4.0, 5.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DLAP_IO_TEST01\n' );
  fprintf ( 1, '  DLAP_FILE_WRITE writes a matrix in SLAP Triad format\n' );
  fprintf ( 1, '  to a DLAP sparse matrix file.\n' );

  dlap_file_print ( n, nelt, isym, irhs, isoln, ia, ja, a, rhs, ...
    soln, '  The DLAP data to be written to the file.' );

  output = fopen ( output_filename, 'wt' );

  dlap_file_write ( n, nelt, isym, irhs, isoln, ia, ja, a, rhs, soln, output );

  fclose ( output );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the matrix data to "%s"\n', output_filename );

  return
end