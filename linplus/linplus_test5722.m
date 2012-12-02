function linplus_test5722 ( )

%*****************************************************************************80
%
%% TEST5722 tests R8SP_PRINT.
%
%  Discussion:
%
%    Because MATLAB seems to allow a R8SP matrix to store the same index
%    several times, presumably with the matrix entry being the SUM of
%    these occurrences, I modified R8SP_PRINT to handle this situation
%    (I hope).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 7;
  nz_num = 12;
  a = [ ...
    21.0,  51.0, 12.0, 52.0, 14.0, ...
    24.0,  34.0, 45.0, 46.0, 17.0, ...
   100.0, 200.0 ];
  col = [ 1, 1, 2, 2, 4, 4, 4, 5, 6, 7, 2, 4 ];
  row = [ 2, 5, 1, 5, 1, 2, 3, 4, 4, 1, 1, 3 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST5722\n' );
  fprintf ( 1, '  R8SP_PRINT prints a R8SP matrix;\n' );
  fprintf ( 1, '  In this example, we have listed several matrix\n' );
  fprintf ( 1, '  locations TWICE.  R8SP_PRINT should compute the\n' );
  fprintf ( 1, '  sum of these values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In particular, we want A(1,2) = 112 and A(3,4) = 234.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );
  fprintf ( 1, '  Matrix nonzeros =  %d\n', nz_num );

  r8sp_print ( m, n, nz_num, row, col, a, '  The R8SP matrix:' );

  return
end
