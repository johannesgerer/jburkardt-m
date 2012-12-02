function value = r8_sign_match ( r1, r2 )

%*****************************************************************************80
%
%% R8_SIGN_MATCH is TRUE if two R8's are of the same sign.
%
%  Discussion:
%
%    This test could be coded numerically as
%
%      if ( 0 <= r1 * r2 ) then ...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R1, R2, the values to check.
%
%    Output, logical VALUE, is TRUE if ( R1 <= 0 and R2 <= 0 )
%    or ( 0 <= R1 and 0 <= R2 ).
%
  value = ( r1 <= 0.0 && r2 <= 0.0 ) || ( 0.0 <= r1 && 0.0 <= r2 );

  return
end
