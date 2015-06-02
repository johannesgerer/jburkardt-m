function scale = p31_scale ( neqn )

%*****************************************************************************80
%
%% P31_SCALE returns scale factors for problem p31.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NEQN, the number of equations.
%
%    Output, real SCALE(NEQN), the scaling factors.
%
  a = p31_param ( 'GET', 'A' );
  b = p31_param ( 'GET', 'B' );
  c = p31_param ( 'GET', 'C' );
  d = p31_param ( 'GET', 'D' );
  if ( c ~= 0.0 & d ~= 0.0 )
    scale(1:neqn,1) = [ d / c; a / b ];
  else
    scale(1:neqn,1) = [ 1.0; 1.0 ];
  end

  return
end
