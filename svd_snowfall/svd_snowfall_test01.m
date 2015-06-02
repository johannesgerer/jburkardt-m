function x = svd_snowfall_test01 ( )

%*****************************************************************************80
%
%% SVD_SNOWFALL_TEST01 reads and processes the snowfall data.
%
%  Discussion:
%
%    The data file contains monthly snowfall records from 1890 to 2012.
%    Column 1 is the year, columns 2 through 9 are the snowfall for
%    October, November, December, January, February, March, April, May,
%    and column 10 is the total snowfall for that season.
%
%    After the LOAD command is executed, the data is stored as
%    8 rows and 122 columns, with the first column of X the
%    1890 data, and the last column is 2012!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real X(8,123), the snowfall data.
%
  filename = 'snowfall.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_SNOWFALL_TEST01\n' );
  fprintf ( 1, ...
    '  Read, process, and return snowfall data in "%s".\n', filename );

  x = load ( filename );

  [ m, n ] = size ( x );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial data rows    M = %d\n', m );
  fprintf ( 1, '  Initial data columns N = %d\n', n );
%
%  Remove columns 1 (year) and 10 (total snowfall).
%
  x = x(:,2:9);
%
%  Transpose.
%
  x = x';

  [ m, n ] = size ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  After removing columns 1 and 10,\n' );
  fprintf ( 1, '  and transposing the matrix, we have:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Revised data rows    M = %d\n', m );
  fprintf ( 1, '  Revised data columns N = %d\n', n );

  return
end

