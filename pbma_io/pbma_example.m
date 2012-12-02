function bitmap = pbma_example ( nrow, ncol )

%*****************************************************************************80
%
%% PBMA_EXAMPLE returns sample bitmap data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 August 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NROW, NCOL, the number of rows and columns to use.
%
%    Output, integer BITMAP(NROW,NCOL), an array of bitmap data.
%
  bitmap = zeros ( nrow, ncol );

  xc = nrow / 2;
  yc = ncol / 2;
  r = min ( nrow, ncol ) / 3;

  for i = 1 : nrow
    y = i;
    for j = 1 : ncol
      x = j;
      if ( abs ( r - sqrt ( ( x - xc )^2 + 0.75 * ( y - yc )^2 ) ) <= 3 )
        bitmap(i,j) = 1;
      else
        bitmap(i,j) = 0;
      end
    end 
  end

  return
end
