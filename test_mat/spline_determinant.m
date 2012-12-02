function determ = spline_determinant ( n, x )

%*****************************************************************************80
%
%% SPLINE_DETERMINANT computes the determinant of the SPLINE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 June 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real X(N-1), the parameters.
%
%    Output, real DETERM, the determinant.
%
  determ_nm1 = 2.0 * x(n-1);

  if ( n == 1 )
    determ = determ_nm1;
    return
  end

  determ_nm2 = determ_nm1;
  if ( n == 2 )
    determ_nm1 = 4.0 *            x(n-1)   * x(n-1) - x(n-1) * x(n-1);
  else
    determ_nm1 = 4.0 * ( x(n-2) + x(n-1) ) * x(n-1) - x(n-1) * x(n-1);
  end

  if ( n == 2 )
    determ = determ_nm1;
    return
  end

  for i = n - 2 : -1 : 1

    if ( i == 1 )
      determ = 2.0 *            x(i)   * determ_nm1 - x(i) * x(i) * determ_nm2;
    else
      determ = 2.0 * ( x(i-1) + x(i) ) * determ_nm1 - x(i) * x(i) * determ_nm2;
    end

    determ_nm2 = determ_nm1;
    determ_nm1 = determ;
    
  end

  return
end
