function determ = poisson_determinant ( nrow, ncol, n )

%*****************************************************************************80
%
%% POISSON_DETERMINANT returns the determinant of the Poisson matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
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
%    Input, integer ( kind = 4 ) N, the order of the matrix.  It must be the case
%    that N = NROW * NCOL.
%
%    Output, real DETERM, the determinant.
%
  for i = 1 : nrow
    angle = i * pi / ( nrow + 1 );
    cr(i) = cos ( angle );
  end

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
