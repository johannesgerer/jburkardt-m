function f = p01_f ( m, n, x )

%*****************************************************************************80
%
%% P01_F evaluates the objective function for problem 01.
%
%  Discussion:
%
%    The function is continuous, convex, and unimodal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Hugues Bersini, Marco Dorigo, Stefan Langerman, Gregory Seront,
%    Luca Gambardella,
%    Results of the first international contest on evolutionary optimisation,
%    In Proceedings of 1996 IEEE International Conference on Evolutionary
%    Computation,
%    IEEE Press, pages 611-615, 1996.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of arguments.
%
%    Input, real X(M,N), the arguments.
%
%    Output, real F(N), the function evaluated at the arguments.
%  
  f = zeros ( n, 1 );

  for j = 1 : n
    f(j) = sum ( ( x(1:m,j) - 1.0 ).^2 );
  end

  return
end
