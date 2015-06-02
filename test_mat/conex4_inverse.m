function a = conex4_inverse ( )

%*****************************************************************************80
%
%% CONEX4_INVERSE returns the inverse of the CONEX4 matrix.
%
%  Discussion:
%
%   -41  -17   10   68
%    25   10   -6  -41
%    10    5   -3  -17
%    -6   -3    2   10
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(4,4), the matrix.
%

%
%  Note that the matrix entries are listed by row.
%
  a = [ ...
   -41.0,  -17.0,   10.0,   68.0; ...
    25.0,   10.0,   -6.0,  -41.0; ...
    10.0,    5.0,   -3.0,  -17.0; ...
    -6.0,   -3.0,    2.0,   10.0 ];

  return
end
