function x = circle_unit_van_der_corput ( )

%*****************************************************************************80
%
%% CIRCLE_UNIT_VAN_DER_CORPUT picks a van der Corput point on the unit circle.
%
%  Discussion:
%
%    This routine computes the "next" van der Corput number U, converts it
%    to an angle between 0 and 2 PI, and determines the corresponding
%    X and Y coordinates on the circle.
%
%    You can get or set the van der Corput seed, which determines the next
%    value, by calling VAN_DER_CORPUT_SEED_GET or VAN_DER_CORPUT_SEED_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real X(2), the next van der Corput point
%    on the circle.
%
  u = van_der_corput ( );

  angle = 2.0 * pi * u;

  x(1) = cos ( angle );
  x(2) = sin ( angle );

  return
end
