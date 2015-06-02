function value = toeplitz_5s_determinant ( row_num, col_num, alpha, beta, ...
  gamma )

%*****************************************************************************80
%
%% TOEPLITZ_5S_DETERMINANT returns the determinant of the TOEPLITZ_5S matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ROW_NUM, the block order of A.
%
%    Input, integer COL_NUM, the order of the subblocks of A.
%
%    Input, real ALPHA, BETA, GAMMA the scalars that define A.
%
%    Output, real VALUE, the determinant.
%
  lambda = toeplitz_5s_determinant ( row_num, col_num, alpha, beta, gamma );

  value = prod ( lambda(1:row_num*col_num) );

  return
end
