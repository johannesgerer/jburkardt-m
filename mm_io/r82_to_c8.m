function z = r82_to_c8 ( x, y )

%*****************************************************************************80
%
%% R82_TO_C8 makes a complex number from two real values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the real and imaginary parts.
%
%    Output, complex Z, the value of ( A + B*i).
%
  z = x + y * i;
  
  return
end
