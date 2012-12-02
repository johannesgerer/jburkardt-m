function determ = r8mat_gedet ( a, n, pivot )

%*****************************************************************************80
%
%% R8MAT_GEDET computes the determinant of a matrix factored by R8MAT_GEFA.
%
%  Discussion:
%
%    This is a modified version of the LINPACK routine DGEDI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Cleve Moler, Jim Bunch, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, real A(N,N), the LU factors computed by R8MAT_GEFA.
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer PIVOT(N), as computed by R8MAT_GEFA.
%
%    Output, real DETERM, the determinant of the matrix.
%
  diag = r8mat_diag_get_vector ( n, a );

  determ = prod ( diag(1:n) );

  for i = 1 : n
    if ( pivot(i) ~= i )
      determ = - determ;
    end
  end

  return
end
