function value = r8_sign_opposite ( r1, r2 )

%*****************************************************************************80
%
%% R8_SIGN_OPPOSITE is TRUE if two R8's are not of the same sign.
%
%  Discussion:
%
%    This test could be coded numerically as
%
%      if ( r1 * r2 <= 0.0 ) then ...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R1, R2, the values to check.
%
%    Output, logical VALUE, is TRUE if ( R1 <= 0 and 0 <= R2 )
%    or ( R2 <= 0 and 0 <= R1 ).
%
  value = ( r1 <= 0.0 && 0.0 <= r2 ) || ( r2 <= 0.0 && 0.0 <= r1 );

  return
end
