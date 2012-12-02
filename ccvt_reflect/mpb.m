function generator = mpb ( ndim, n, generator, npp )

%*****************************************************************************80
%
%% MPB projects generators onto the boundary of the region.
%
%  Discussion:
%
%    The number NPP sets the number of subintervals into which we subdivide
%    the boundary.  It does NOT specify how many points will be pulled onto
%    the boundary.  The reason for this is that, after the first boundary
%    subinterval has had a generator pulled into it, on every subsequent
%    subinterval the nearest generator is likely to be the one in the
%    previous subinterval!  Unless an interior generator is closer than
%    some small distance, this process will simply drag some unfortunate
%    generator onto the boundary, and then around from interval to interval
%    for a considerable time.
%
%    The algorithm could be changed, if desired, so that points snapped
%    to the boundary are guaranteed not to move, at least not twice in
%    one application of this routine!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 December 2004
%
%  Author:
%
%    Lili Ju
%
%  Parameters:
%
%    Input, integer NDIM, the spatial dimension.
%
%    Input, integer N, the number of generators.
%
%    Input, real GENERATOR(NDIM,N), the coordinates of
%    the generators.  On output, some generators will have been moved.
%
%    Input, integer NPP, the number of subintervals into which the
%    perimeter is divided.
%
%    Output, real GENERATOR(NDIM,N), the updated coordinates of the generators.
%
  dx = 1.0;
  dy = 1.0;
%
%  HH is the length of an individual segment of the perimeter of the region.
%
%  U is set in such a way that on step I, it measures the distance from
%  the lower left corner of the box to the midpoint of the I-th subinterval
%  on the perimeter of the box.
%
  hh = 2.0 * ( dx + dy ) / npp;

  u = -0.5 * hh;

  for i = 1 : npp

    u = u + hh;
%
%  The portion of the bottom perimeter from (0,0) to (1,0).
%
    if ( u < dx )
      sample(1:2,1) = [ u, 0.0 ]';
      nearest = find_closest ( ndim, n, 1, sample, generator );
      generator(2,nearest(1)) = 0.0;
%
%  The portion of the right perimeter from (1,0) to (1,1).
%
    elseif ( dx < u & u < dx + dy )
      sample(1:2,1) = [ 1.0, ( u - dx ) ]';
      nearest = find_closest ( ndim, n, 1, sample, generator );
      generator(1,nearest(1)) = 1.0;
%
%  The portion of the top perimeter from (1,1) to (0,1).
%
    elseif ( dx + dy < u & u < dx + dy + dx )
      sample(1:2,1) = [ 1.0 - ( u - dx - dy ), 1.0 ]';
      nearest = find_closest ( ndim, n, 1, sample, generator );
      generator(2,nearest(1)) = 1.0;
%
%  The portion of the left perimeter from (0,1) to (0,0).
%
    elseif ( dx + dy + dx < u )
      sample(1:2,1) = [ 0.0, 1.0 - ( u - dx - dy - dx ) ]';
      nearest = find_closest ( ndim, n, 1, sample, generator );
      generator(1,nearest(1)) = 0.0;
    end

  end

  return
end
