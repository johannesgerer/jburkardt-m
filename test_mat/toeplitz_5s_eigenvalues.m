function lambda = toeplitz_5s_eigenvalues ( row_num, col_num, alpha, beta, ...
  gamma )

%*****************************************************************************80
%
%% TOEPLITZ_5S_EIGENVALUES returns the eigenvalues of the TOEPLITZ_5S matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969, page 10, 
%    LC: QA263.G68.
%
%  Parameters:
%
%    Input, integer ROW_NUM, the block order of A.
%
%    Input, integer COL_NUM, the order of the subblocks of A.
%
%    Input, real ALPHA, BETA, GAMMA the scalars that define A.
%
%    Output, real LAMBDA(ROW_NUM*COL_NUM,1), the eigenvalues.
%
  lambda = zeros ( row_num * col_num, 1 );

  k = 0;

  for i = 1 : col_num

    angle_i = pi * i / ( col_num + 1 );

    for j = 1 :row_num

      angle_j = pi * j / ( row_num + 1 );

      k = k + 1 ;

      lambda(k,1) = alpha + 2.0 * beta  * cos ( angle_i ) ...
                          + 2.0 * gamma * cos ( angle_j );

    end
  end

  return
end
