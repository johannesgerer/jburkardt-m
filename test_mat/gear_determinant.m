function determ = gear_determinant ( ii, jj, n )

%*****************************************************************************80
%
%% GEAR_DETERMINANT returns the determinant of the GEAR matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer II, JJ, define the two special entries.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real DETERM, the determinant.
%
  lambda = gear_eigenvalues ( ii, jj, n );

  determ = prod ( lambda(1:n) );

  return
end

