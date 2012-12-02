function value = r8_sign_match_strict ( r1, r2 )

%*****************************************************************************80
%
%% R8_SIGN_MATCH_STRICT is TRUE if two R8's are of the same strict sign.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R1, R2, the values to check.
%
%    Output, logical VALUE, is TRUE if the signs match.
%
  value = ( r1 <  0.0 && r2 <  0.0 ) || ...
          ( r1 == 0.0 && r2 == 0.0 ) || ...
          ( 0.0 <  r1 && 0.0 <  r2 );

  return
end
