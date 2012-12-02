function z = r82_to_c8 ( a, b )

%*****************************************************************************80
%
%% R82_TO_C8 makes a complex number from two R8's.
%
%  Discussion:
%
%    It is extremely unnatural for a programmer to find that
%    "i" is, by default, the imaginary unit in MATLAB. 
%
%    So the only safe thing to do, in my opinion, is to hide
%    it somewhere, as in this function!
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
%    Input, real A, B, the real and imaginary parts.
%
%    Output, complex Z, the value of ( A + B * i ).
%
  z = a + b * i;
  
  return
end
