function a = dorr_inverse ( alpha, n )

%*****************************************************************************80
%
%% DORR_INVERSE returns the inverse of the DORR matrix.
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
%  Reference:
%
%    CM daFonseca, J Petronilho,
%    Explicit Inverses of Some Tridiagonal Matrices,
%    Linear Algebra and Its Applications,
%    Volume 325, 2001, pages 7-21.
%
%  Parameters:
%
%    Input, real ALPHA, the parameter.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the inverse of the matrix.
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
%  Now evaluate the inverse.
%
  a = zeros ( n, n );

  d = zeros ( n, 1 );
  e = zeros ( n, 1 );

  d(n) = y(n);
  for i = n - 1 : -1 : 1
    d(i) = y(i) - x(i) * z(i) / d(i+1);
  end

  e(1) = y(1);
  for i = 2 : n
    e(i) = y(i) - x(i-1) * z(i-1) / e(i-1);
  end

  for i = 1 : n
    for j = 1 : i
      a(i,j) = r8_mop ( i + j ) * prod ( x(j:i-1) ) ...
        * prod ( d(i+1:n) ) / prod ( e(j:n) );
    end
    for j = i + 1 : n
      a(i,j) = r8_mop ( i + j ) * prod ( z(i:j-1) ) ...
        * prod ( d(j+1:n) ) / prod ( e(i:n) );
    end
  end

  return
end
