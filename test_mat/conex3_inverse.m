function a = conex3_inverse ( n )

%*****************************************************************************80
%
%% CONEX3_INVERSE returns the inverse of the CONEX3 matrix.
%
%  Example:
%
%    N = 5
%
%     1  0  0  0  0
%     1  1  0  0  0
%     2  1  1  0  0
%     4  2  1  1  0
%    -8 -4 -2 -1 -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan Cline, RK Rew,
%    A set of counterexamples to three condition number estimators,
%    SIAM Journal on Scientific and Statistical Computing,
%    Volume 4, 1983, pages 602-611.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      if ( i < n )
      
        if ( j < i )
          a(i,j) = 2.0^(i-j-1);
        elseif ( i == j )
          a(i,j) = 1.0;
        else
          a(i,j) = 0.0;
        end
    
      elseif ( i == n )
      
        if ( j < i )
          a(i,j) = - 2.0^(i-j-1);
        else
          a(i,j) = -1.0;
        end

      end
      
    end
  end

  return
end
