function determ = tridiagonal_determinant ( n, x, y, z )

%*****************************************************************************80
%
%% TRIV_DETERMINANT computes the determinant of the TRIV matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real X(N-1), Y(N), Z(N-1), the vectors that define
%    the subdiagonal, diagonal, and superdiagonal of A.
%
%    Output, real DETERM, the determinant.
%
  determ_nm1 = y(n);

  if ( n == 1 )
    determ = determ_nm1;
    return
  end

  determ_nm2 = determ_nm1;
  determ_nm1 = y(n-1) * y(n) - z(n-1) * x(n-1);

  if ( n == 2 )
    determ = determ_nm1;
    return
  end

  for i = n - 2 : -1 : 1

    determ = y(i) * determ_nm1 - z(i) * x(i) * determ_nm2;

    determ_nm2 = determ_nm1;
    determ_nm1 = determ;
    
  end

  return
end
