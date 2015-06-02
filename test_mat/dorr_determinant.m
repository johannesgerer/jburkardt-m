function value = dorr_determinant ( alpha, n )

%*****************************************************************************80
%
%% DORR_DETERMINANT computes the determinant of the DORR matrix.
%
%  Discussion:
%
%    The DORR matrix is a special case of the TRIV matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the parameter.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real VALUE, the determinant.
%

%
%  Form the three diagonals.
%
  x = zeros ( n - 1, 1 );
  y = zeros ( n,     1 );
  z = zeros ( n - 1, 1 );

  for i = 1 : n
    for j = 1 : n

      if ( i <= floor ( ( n + 1 ) / 2 ) )

        if ( j == i - 1 )
          x(i-1) = - alpha * ( n + 1 )^2;
        elseif ( j == i )
          y(i) = 2.0 * alpha * ( n + 1 )^2 + 0.5 * ( n + 1 ) - i;
        elseif ( j == i + 1 )
          z(i) = - alpha * ( n + 1 )^2 - 0.5 * ( n + 1 ) + i;
        end

      else

        if ( j == i - 1 )
          x(i-1) = - alpha * ( n + 1 )^2 + 0.5 * ( n + 1 ) - i;
        elseif ( j == i )
          y(i) = 2.0 * alpha * ( n + 1 )^2 - 0.5 * ( n + 1 ) + i;
        elseif ( j == i + 1 )
          z(i) = - alpha * ( n + 1 )^2;
        end

      end

    end
  end
%
%  Now evaluate the determinant.
%
  determ_nm1 = y(n);

  if ( n == 1 )
    value = determ_nm1;
    return
  end

  determ_nm2 = determ_nm1;
  determ_nm1 = y(n-1) * y(n) - z(n-1) * x(n-1);

  if ( n == 2 )
    value = determ_nm1;
    return
  end

  for i = n - 2 : -1 : 1

    value = y(i) * determ_nm1 - z(i) * x(i) * determ_nm2;

    determ_nm2 = determ_nm1;
    determ_nm1 = value;
    
  end

  return
end
