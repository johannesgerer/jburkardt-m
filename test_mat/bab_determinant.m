function determ = bab_determinant ( n, alpha, beta )

%*****************************************************************************80
%
%% BAB_DETERMINANT computes the determinant of the BAB matrix.
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
%    Input, real ALPHA, BETA, parameters that define the matrix.
%
%    Output, real DETERM, the determinant.
%
  determ_nm1 = alpha;

  if ( n == 1 )
    determ = determ_nm1;
    return
  end

  determ_nm2 = determ_nm1;
  determ_nm1 = alpha * alpha - beta * beta;

  if ( n == 2 )
    determ = determ_nm1;
    return
  end

  for i = n - 2 : -1 : 1

    determ = alpha * determ_nm1 - beta * beta * determ_nm2;

    determ_nm2 = determ_nm1;
    determ_nm1 = determ;
    
  end

  return
end
