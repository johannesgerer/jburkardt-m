function m = i4mat_shortest_path ( n, m )

%*****************************************************************************80
%
%% I4MAT_SHORTEST_PATH computes the shortest distance between all pairs of points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Floyd,
%    Algorithm 97, Shortest Path,
%    Communications of the ACM,
%    Volume 5, Number 6, June 1962, page 345.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input/output, integer M(N,N).
%    On input, M(I,J) contains the length of the direct link between 
%    nodes I and J, or Inf if there is no direct link.
%    On output, M(I,J) contains the distance between nodes I and J,
%    that is, the length of the shortest path between them.  If there
%    is no such path, then M(I,J) will remain Inf.
%
  for i = 1 : n
    for j = 1 : n
      if ( m(j,i) < Inf )
        for k = 1 : n
          if ( m(i,k) < Inf )
            s = m(j,i) + m(i,k);
            if ( s < m(j,k) )
              m(j,k) = s;
            end
          end
        end
      end
    end
  end

  return
end
