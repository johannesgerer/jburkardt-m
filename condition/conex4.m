function a = conex4 ( )

%*****************************************************************************80
%
%% CONEX4 returns the CONEX4 matrix.
%
%  Discussion:
%
%    7  10   8   7
%    6   8  10   9
%    5   7   9  10
%    5   7   6   5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(4,4), the matrix.
%
  a = [ ...
     7.0,  6.0,  5.0,  5.0;
    10.0,  8.0,  7.0,  7.0;
     8.0, 10.0,  9.0,  6.0;
     7.0,  9.0, 10.0,  5.0 ]';

  return
end
