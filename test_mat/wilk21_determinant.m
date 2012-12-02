function determ = wilk21_determinant ( n )

%*****************************************************************************80
%
%% WILK21_DETERMINANT computes the determinant of the WILK21 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2007
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
  for i = 1 : n
    d(i) = round ( abs ( i - ( n + 1 ) / 2 ) );
  end

  determ_nm1 = d(n);

  if ( n == 1 )
    determ = determ_nm1;
    return
  end

  determ_nm2 = determ_nm1;
  determ_nm1 = d(n-1) * d(n) - 1.0;

  if ( n == 2 )
    determ = determ_nm1;
    return
  end

  for i = n - 2 : -1 : 1

    determ = d(i) * determ_nm1 - determ_nm2;

    determ_nm2 = determ_nm1;
    determ_nm1 = determ;

  end

  return
end
