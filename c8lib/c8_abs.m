function value = c8_abs ( z )

%*****************************************************************************80
%
%% C8_ABS evaluates the absolute value of a C8.
%
%  Discussion:
%
%    A C8 is a complex value.
%
%    MATLAB supports the absolute value of a C8 with the ABS function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex Z, the argument.
%
%    Output, real VALUE, the function value.
%
  value = sqrt ( ( real ( z ) ).^2 ...
               + ( imag ( z ) ).^2 );

  return
end
