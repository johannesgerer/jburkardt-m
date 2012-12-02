function [ ntri, tri ] = points_delaunay_naive_2d ( n, p )

%*****************************************************************************80
%
%% POINTS_DELAUNAY_NAIVE_2D is a naive Delaunay triangulation scheme.
%
%  Discussion:
%
%    This routine is only suitable as a demonstration code for small
%    problems.  Its running time is of order N**4.  Much faster
%    algorithms are available.
%
%    Given a set of nodes in the plane, a triangulation is set of
%    triples of distinct nodes, forming triangles, so that every
%    point within the convex hull of the set of nodes is either
%    one of the nodes, or lies on an edge of one or more triangles,
%    or lies within exactly one triangle.
%
%    A Delaunay triangulation is a triangulation with additional
%    properties.
%
%  Modified:
%
%    05 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Joseph O'Rourke,
%    Computational Geometry,
%    Cambridge University Press,
%    Second Edition, 1998, page 187.
%
%  Parameters:
%
%    Input, integer N, the number of nodes.  N must be at least 3.
%
%    Input, real P(2,N), the nodes.
%
%    Output, integer NTRI, the number of triangles in the triangulation.
%
%    Output, integer TRI(3,MAXTRI), the indices of the triangle nodes.
%
  ndim = 2;

  ntri = 0;

  if ( n < 3 )
    tri = [];
    return
  end
%
%  Compute Z = X*X + Y*Y.
%
  z(1:n) = p(1,1:n).^2 + p(2,1:n).^2;
%
%  For each triple (I,J,K):
%
  for i = 1 : n-2
    for j = i+1 : n
      for k = i+1 : n

        if ( j ~= k )

          xn = ( p(2,j) - p(2,i) ) * ( z(k) - z(i) ) ...
             - ( p(2,k) - p(2,i) ) * ( z(j) - z(i) );

          yn = ( p(1,k) - p(1,i) ) * ( z(j) - z(i) ) ...
             - ( p(1,j) - p(1,i) ) * ( z(k) - z(i) );

          zn = ( p(1,j) - p(1,i) ) * ( p(2,k) - p(2,i) ) ...
             - ( p(1,k) - p(1,i) ) * ( p(2,j) - p(2,i) );

          flag = ( zn < 0.0 );

          if ( flag )
            for m = 1 : n
              flag = flag & ...
                ( ( p(1,m) - p(1,i) ) * xn ...
                + ( p(2,m) - p(2,i) ) * yn ...
                + ( z(m)   - z(i) )   * zn <= 0.0 );
            end
          end

          if ( flag )
            ntri = ntri + 1;
            tri(1:3,ntri) = [ i, j, k ]';
          end

        end

      end
    end
  end

  return
end
