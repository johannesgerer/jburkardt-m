function sparse_display_test02 ( )

%*****************************************************************************80
%
%% SPARSE_DISPLAY_TEST02 tests SPY_FILE in cases where the indices are in a file.
%
%  Discussion:
%
%    The files used in this example actually use negative column indices
%    because they were output by DEAL.II and intended to be passed directly
%    into GNUPLOT without any clever commands.
%
%    So my own "SPY_FILE" is currently set up to deal exactly with such
%    files, and hence, given sensible data will actually show a spy plot
%    that is transposed - still readable and all, but wrong way round.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_DISPLAY_TEST02\n' );
  fprintf ( 1, '  SPY_FILE generates a sparsity plot for a matrix for\n' );
  fprintf ( 1, '  which there exists a file containing all the pairs\n' );
  fprintf ( 1, '  (I,J) corresponding to nonzero entries.\n' );

  header = 'before';
  filename = 'before_data.txt';

  spy_file ( header, filename );

  header = 'after';
  filename = 'after_data.txt';

  spy_file ( header, filename );

  return
end