function h = p11_h ( n, x )

%*****************************************************************************80
%
%% P11_H evaluates the Hessian for problem 11.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2000
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

  for i = 1 : 20

    c = i / 5.0;

    f1 = x(1) + c * x(2) - exp ( c );
    f2 = x(3) + sin ( c ) * x(4) - cos ( c );

    df1dx1 = 1.0;
    df1dx2 = c;
    df2dx3 = 1.0;
    df2dx4 = sin ( c );

    h(1,1) = h(1,1) + 12.0 * f1 * f1 * df1dx1 * df1dx1 ...
                    +  4.0 * f2 * f2 * df1dx1 * df1dx1;
    h(1,2) = h(1,2) + 12.0 * f1 * f1 * df1dx1 * df1dx2 ...
                    +  4.0 * f2 * f2 * df1dx1 * df1dx2;
    h(1,3) = h(1,3) +  8.0 * f1 * f2 * df1dx1 * df2dx3;
    h(1,4) = h(1,4) +  8.0 * f1 * f2 * df1dx1 * df2dx4;

    h(2,1) = h(2,1) + 12.0 * f1 * f1 * df1dx2 * df1dx1 ...
                    +  4.0 * f2 * f2 * df1dx2 * df1dx1;
    h(2,2) = h(2,2) + 12.0 * f1 * f1 * df1dx2 * df1dx2 ...
                    +  4.0 * f2 * f2 * df1dx2 * df1dx1;
    h(2,3) = h(2,3) +  8.0 * f1 * f2 * df1dx2 * df2dx3;
    h(2,4) = h(2,4) +  8.0 * f1 * f2 * df1dx2 * df2dx4;

    h(3,1) = h(3,1) +  8.0 * f1 * f2 * df2dx3 * df1dx1;
    h(3,2) = h(3,2) +  8.0 * f1 * f2 * df2dx3 * df1dx2;
    h(3,3) = h(3,3) +  4.0 * f1 * f1 * df2dx3 * df2dx3 ...
                    + 12.0 * f2 * f2 * df2dx3 * df2dx3;
    h(3,4) = h(3,4) +  4.0 * f1 * f1 * df2dx4 * df2dx3 ...
                    + 12.0 * f2 * f2 * df2dx3 * df2dx4;

    h(4,1) = h(4,1) +  8.0 * f1 * f2 * df2dx4 * df1dx1;
    h(4,2) = h(4,2) +  8.0 * f1 * f2 * df2dx4 * df1dx2;
    h(4,3) = h(4,3) +  4.0 * f1 * f1 * df2dx3 * df2dx4 ...
                    + 12.0 * f2 * f2 * df2dx4 * df2dx3;
    h(4,4) = h(4,4) +  4.0 * f1 * f1 * df2dx4 * df2dx4 ...
                    + 12.0 * f2 * f2 * df2dx4 * df2dx4;

  end

  return
end
