function a = ill3_inverse ( )

%*****************************************************************************80
%
%% ILL3_INVERSE returns the inverse of the ILL3 matrix.
%
%  Formula:
%
%      69     68/3   70
%    -439/2 -433/6 -224
%       9/2    3/2    5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(3,3), the matrix.
%

%
%  Note that the matrix entries are listed by row.
%
  a = [   69.0,         68.0 / 3.0,   70.0; ...
        -439.0 / 2.0, -433.0 / 6.0, -224.0; ...
           4.5,          1.5,          5.0 ];

  return
end
