function lambda = poisson_eigenvalues ( nrow, ncol, n )

%*****************************************************************************80
%
%% POISSON_EIGENVALUES returns the eigenvalues of the Poisson matrix.
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
%    Output, real LAMBDA(NROW*NCOL), the eigenvalues.
%
  for i = 1 : nrow
    angle = i * pi / ( nrow + 1 );
    cr(i) = cos ( angle );
  end

  for i = 1 : ncol
    angle = i * pi / ( ncol + 1 );
    cc(i) = cos ( angle );
  end

  k = 0;
  for i = 1 : nrow
    for j = 1 : ncol
      k = k + 1;
      lambda(k) = 4.0 - 2.0 * cr(i) - 2.0 * cc(j);
    end
  end

  return
end
