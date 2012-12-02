function h = p14_h ( n, x )

%*****************************************************************************80
%
%% P14_H evaluates the Hessian for problem 14.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2000
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

  for j = 1 : n

    if ( mod ( j, 2 ) == 1 )
      h(j,j) = 2.0;
    else
      h(j,j) = 200.0;
      h(j,j-1) = - 400.0 * x(j-1);
      h(j-1,j) = h(j-1,j) - 400.0 * x(j-1);
      h(j-1,j-1) = h(j-1,j-1) - 400.0 * ( x(j) - 3.0 * x(j-1) * x(j-1) );
    end

  end

  return
end
