function x = rosser1_null ( )

%*****************************************************************************80
%
%% ROSSER1_NULL returns a null vector of the ROSSER1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real X(8), the null vector.
%
  x(1:8) = [ ...
    1.0,  ...
    2.0,  ...
   -2.0,  ...
   -1.0,  ...
   14.0,  ...
   14.0,  ...
    7.0,  ...
    7.0 ];

  return
end
