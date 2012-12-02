function gray = pgma_example ( nrow, ncol )

%*****************************************************************************80
%
%% PGMA_EXAMPLE returns sample gray data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NROW, NCOL, the dimensions of the array.
%
%    Output, GRAY(NROW,NCOL), an array of gray scale data.
%
  periods = 3;

  gray = zeros ( nrow, ncol );

  for i = 1 : nrow
    y = 2 * ( i - 1 ) / ( nrow - 1 ) - 1;
    for j = 1 : ncol
      x = 2 * pi * periods * ( j - 1 ) / ( ncol - 1 );
      gray(i,j) = fix ( 20 * ( sin ( x ) - y + x ) );
    end 
  end

  return
end

