function value = r4_cas ( x )

%*****************************************************************************80
%
%% R4_CAS returns the "casine" of a number.
%
%  Definition:
%
%    The "casine", used in the discrete Hartley transform, is abbreviated
%    CAS(X), and defined by:
%
%      CAS(X) = cos ( X ) + sin( X )
%             = sqrt ( 2 ) * sin ( X + pi/4 )
%             = sqrt ( 2 ) * cos ( X - pi/4 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number whose casine is desired.
%
%    Output, real VALUE, the casine of X, which will be between
%    plus or minus the square root of 2.
%
  value = cos ( x ) + sin ( x );

  return
end
