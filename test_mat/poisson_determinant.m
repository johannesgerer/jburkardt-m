function determ = poisson_determinant ( nrow, ncol )

%*****************************************************************************80
%
%% POISSON_DETERMINANT returns the determinant of the POISSON matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NROW, NCOL, the number of rows and columns 
%    in the grid.
%
%    Output, real DETERM, the determinant.
%
  cr = zeros ( nrow, 1 );
  for i = 1 : nrow
    angle = i * pi / ( nrow + 1 );
    cr(i) = cos ( angle );
  end

  cc = zeros ( ncol, 1 );
  for i = 1 : ncol
    angle = i * pi / ( ncol + 1 );
    cc(i) = cos ( angle );
  end

  determ = 1.0;

  for i = 1 : nrow
    for j = 1 : ncol
      determ = determ * ( 4.0 - 2.0 * cr(i) - 2.0 * cc(j) );
    end
  end

  return
end
