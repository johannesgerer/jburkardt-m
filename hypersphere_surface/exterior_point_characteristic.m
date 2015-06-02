function xe = exterior_point_characteristic ( m, x0, theta, characteristic )

%*****************************************************************************80
%
%% EXTERIOR_POINT_CHARACTERISTIC seeks a point X such that F(X) = 0.
%
%  Discussion:
%
%    An object in M-dimensional space has been described by a characteristic
%    function F() such that F(X) = 1 for all points inside the object, and
%    F(X) = 0 for all points outside the object.
%
%    Given that the point X0 is INSIDE the object, we are asked to find a 
%    point XE which is "outside" the object.  Moreover, we want it to lie
%    in the direction from X0 specified by the angles THETA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, real X0(M,1), a base point inside the object.
%
%    Input, real THETA(M-1,1), the direction angles, which are fixed.
%
%    Input, real y = CHARACTERISTIC ( m, n, x ), the handle for a function which
%    evaluates the characteristic for the object at N M-dimensional points X,
%    returning a 1 for points inside the object, and 0 for points outside.
%
%    Output, real XE(M,1), a point in the exterior, lying in the direction
%    specified by THETA.
%

%
%  If X0 or THETA is input as a row vector, we can easily convert them
%  to column vectors.
%
  x0 = x0(:);
  theta = theta(:);
%
%  We are testing just one point.
%
  n = 1;
%
%  Start the search with a step of length R=1 from the base point X0.
%
  r = 1.0;
  r_log = 0;

  while ( 1 )
%
%  Convert (R,THETA) to Cartesian coordinates XE.
%
    xe = hypersphere_to_cartesian ( m, n, x0, r, theta );
%
%  Evaluate the characteristic function at XE.
%
    ye = characteristic ( m, n, xe );
%
%  If the characteristic is 0, we have found an exterior point.
%
    if ( ye == 0 )
      break
    end
%
%  Otherwise, try a point twice as far from the base point.
%
    r = r * 2.0;
    r_log = r_log + 1;
%
%  Ridiculously large values of R are most likely an indication of error.
%
    if ( 20 < r_log )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'EXTERIOR_POINT_CHARACTERISTIC - Fatal error!\n' );
      fprintf ( 1, '  Twenty doublings have not produced a result.\n' );
      error ( 'EXTERIOR_POINT_CHARACTERISTIC - Fatal error!' );
    end

  end

  return
end

