function determ = hankel_n_determinant ( n )

%*****************************************************************************80
%
%% HANKEL_N_DETERMINANT returns the determinant of the HANKEL_N matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real DETERM, the determinant.
%
  determ = r8_mop ( floor ( n / 2 ) ) * n ^ n;

  return
end
