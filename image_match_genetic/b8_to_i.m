function value = b8_to_i ( b8 )

%*****************************************************************************80
%
%% B8_TO_I converts a string of 8 binary digits to an integer.
%
%  Discussion:
%
%       B      VALUE
%    --------  -----
%    00000000      0
%    00000001      1
%    00000010      2
%    ...
%    11111111    255
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Nick Berry,
%    A "Practical" Use for Genetic Programming,
%    http://www.datagenetics.com/blog.html
%
%  Parameters:
%
%    Input, integer B8(8), the binary string of 0's and 1's.
%
%    Output, integer VALUE, the value of the string as an integer.
%
  value = 0;
  for i = 1 : 8
    value = 2 * value + b8(i);
  end

  return
end

  
