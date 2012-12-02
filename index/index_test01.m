function index_test01 ( )

%*****************************************************************************80
%
%% INDEX_TEST01 tests INDEX0 and INDEX1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 November 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'INDEX_TEST01\n' );
  fprintf ( 1, '  INDEX0 indexes a 1D array with zero base,\n' );
  fprintf ( 1, '  INDEX1 indexes a 1D array with  unit base.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             Min Index   Max\n' );
  fprintf ( 1, '\n' );

  i_min = 1;
  i = 3;
  i_max = 5;
  fprintf ( 1, '  1D Index  %4d  %4d  %4d\n', i_min,     i,     i_max );

  value = index0 ( i_min, i, i_max );
  index_min = 0;
  index_max = index_min + i_max - i_min;
  fprintf ( 1, '  Index0:   %4d  %4d  %4d\n', index_min, value, index_max );

  value = index1 ( i_min, i, i_max );
  index_min = 1;
  index_max = index_min + i_max - i_min;
  fprintf ( 1, '  Index1:   %4d  %4d  %4d\n', index_min, value, index_max );

  return
end

