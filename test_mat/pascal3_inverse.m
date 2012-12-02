function a = pascal3_inverse ( n, alpha )

%*****************************************************************************80
%
%% PASCAL3_INVERSE returns the inverse of the PASCAL3 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real ALPHA, the parameter.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( i == 1 )

        if ( j == 1 )
          a(i,j) = 1.0;
        else
          a(i,j) = 0.0;
        end

      elseif ( j == 1 )

        a(i,j) = - alpha * a(i-1,j);

      else

        a(i,j) = a(i-1,j-1) - alpha * a(i-1,j);

      end

    end
  end

  return
end
