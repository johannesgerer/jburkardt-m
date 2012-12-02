function automobile_plot ( )

%*****************************************************************************80
%
%% AUTOMOBILE_PLOT reads the automobile dataset and makes a scatterplot.
%
%  Discussion:
%
%    The hardest part of this exercise was reading the comma-separated data file,
%    which contains integer, real and string data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    A Frank, A Asuncion,
%    UCI Machine Learning Repository,
%    http://archive.ics.uci.edu/ml,
%    School of Information and Computer Science,
%    University of California, Irvine, California.
%

%
%  Read the data from the file.
%
  auto_cell = automobile_read ( 'automobile.txt' );
%
%  Price and weight are specific columns of the cell array.
%  Extract them, and convert them to numeric vectors.
%
  price = auto_cell(:,26);
  price = cell2mat ( price );
  weight = auto_cell(:,14);
  weight = cell2mat ( weight );
%
%  Ignore missing data.
%
  index = ( ( price ~= -1 ) & ( weight ~= -1 ) );
%
%  Create a scatter plot.
%
  figure ( 1 )
  clf

  plot ( price(index), weight(index), 'bo', 'MarkerSize', 5 )
  grid on
  xlabel ( 'Price in 1985 Dollars' );
  ylabel ( 'Curb weight in pounds' );
  title ( 'Scatter plot of price versus weight.' );

  return
end

