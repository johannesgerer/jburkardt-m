function determ = leslie_determinant ( b, di, da )

%*****************************************************************************80
%
%% LESLIE_DETERMINANT returns the determinant of the LESLIE matrix.
%
%  Discussion:
%
%    DETERM = a(4,4) * ( 
%        a(1,1) * a(2,2) * a(3,3)
%      + a(1,3) * a(2,1) * a(3,2) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real B, DI, DA, the birth rate, infant mortality rate,
%    and aged mortality rate.  These should be positive values.
%    The mortality rates must be between 0.0 and 1.0.  Reasonable
%    values might be B = 0.025, DI = 0.010, and DA = 0.100
%
%    Output, real A(4,4), the matrix.
%
  determ = 9.0 * ( 1.0 - da ) / 10.0 * ...
  ( ...
      5.0 * ( 1.0 - di ) / 6.0 ...
    * 13.0 / 14.0 ...
    * 39.0 / 40.0 ...
  +   b ...
    * ( 1.0 - di ) / 6.0 ...
    * 1.0 / 14.0 ...
   );

  return
end
