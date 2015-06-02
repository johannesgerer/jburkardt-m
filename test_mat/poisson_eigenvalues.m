function lambda = poisson_eigenvalues ( nrow, ncol )

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
%    Output, real LAMBDA(NROW*NCOL,1), the eigenvalues.
%
  lambda = zeros ( nrow * ncol, 1 );

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

  k = 0;
  for i = 1 : nrow
    for j = 1 : ncol
      k = k + 1;
      lambda(k,1) = 4.0 - 2.0 * cr(i,1) - 2.0 * cc(j,1);
    end
  end

  return
end
