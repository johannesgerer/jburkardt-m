function h = p20_h ( n, x )

%*****************************************************************************80
%
%% P20_H evaluates the Hessian for problem 20.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real H(N,N), the N by N Hessian matrix.
%
  h = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        if ( i == 1 )
          h(i,j) = 2.0;
        else
          h(i,j) = 4.0;
        end
      elseif ( i == j + 1 || i == j - 1 )
        h(i,j) = - 2.0;
      else
        h(i,j) = 0.0;
      end

    end
  end

  return
end
