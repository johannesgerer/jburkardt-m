function value = f_r_2d ( x, y )

%*****************************************************************************80
%
%% F_R_2D evaluates the function R in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the arguments.
%
%    Output, real F_R_2D, the value of the function.
%
  value = sqrt ( x * x + y * y );

  return
end
