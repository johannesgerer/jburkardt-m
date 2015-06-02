function u = u_function ( time )

%*****************************************************************************80
%
%% U_FUNCTION evaluates the time-dependent boundary values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TIME, the current time.
%
%    Output, real U(2), the boundary values at the left and right endpoints.
%
  ua =   sin ( pi * time );
  ub = - sin ( pi * time );

  u = [ ua; ub ];

  return
end
