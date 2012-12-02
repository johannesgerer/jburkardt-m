function determ = idem_random_determinant ( n, rank )

%*****************************************************************************80
%
%% IDEM_RANDOM_DETERMINANT returns the determinant of the IDEM_RANDOM matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, integer RANK, the rank of A.
%
%    Output, real DETERM, the determinant.
%
  if ( rank == n )
    determ = 1.0;
  else
    determ = 0.0;
  end

  return
end
