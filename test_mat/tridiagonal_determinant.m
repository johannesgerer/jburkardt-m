function determ = tridiagonal_determinant ( n, a )

%*****************************************************************************80
%
%% TRIDIAGONAL_DETERMINANT computes the determinant of a tridiagonal matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the matrix.
%
%    Output, real DETERM, the determinant.
%
  determ_nm1 = a(n,n);

  if ( n == 1 )
    determ = determ_nm1;
    return
  end

  determ_nm2 = determ_nm1;
  determ_nm1 = a(n-1,n-1) * a(n,n) - a(n-1,n) * a(n,n-1);

  if ( n == 2 )
    determ = determ_nm1;
    return
  end

  for i = n - 2 : -1 : 1

    determ = a(i,i) * determ_nm1 - a(i,i+1) * a(i+1,i) * determ_nm2;

    determ_nm2 = determ_nm1;
    determ_nm1 = determ;
    
  end

  return
end
