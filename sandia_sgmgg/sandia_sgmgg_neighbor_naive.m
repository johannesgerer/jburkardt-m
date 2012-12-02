function neighbor = sandia_sgmgg_neighbor_naive ( dim_num, point_num, ...
  sparse_index )

%*****************************************************************************80
%
%% SANDIA_SGMGG_NEIGHBOR_NAIVE returns the immediate forward neighbor vector.
%
%  Discussion:
%
%    A sparse grid index vector is a list of DIM_NUM nonnegative indices.
%
%    An immediate forward L-neighbor of a sparse grid index vector I is a
%    sparse grid index vector J with the property that all entries of J
%    are equal to those of I except for the L-the entry, which is greater by 1.
%
%    A forward neighbor of a sparse grid index vector I is a sparse
%    grid index vector K with the property that every entry of K is
%    equal to or greater by 1 than the corresponding entry of I.
%
%    This function is given a collection of sparse grid index vectors,
%    and returns information defining, for every such vector, the entire
%    set of its immediate forward neighbors.  This is done with a
%    "NEIGHBOR" array of dimension DIM_NUM.  For sparse grid vector I,
%    entry L of NEIGHBOR is 1 if I has an immediate forward L-neighbor,
%    and 0 otherwise.
%
%    This implementation of the procedure is inefficient, and is provided
%    solely for demonstration on small problems.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    An Anisotropic Sparse Grid Stochastic Collocation Method for Partial
%    Differential Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2411-2442.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the vector.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer SPARSE_INDEX(DIM_NUM,POINT_NUM),
%    the indices that define the points.
%
%    Output, integer NEIGHBOR(DIM_NUM,POINT_NUM), the
%    immediate forward neighbor array.
%
  neighbor = zeros ( dim_num, point_num );

  for j1 = 1 : point_num

    for j2 = 1 : point_num

      l = - 1;

      for i = 1 : dim_num
%
%  If the entries are not equal...
%
        if ( sparse_index(i,j2) ~= sparse_index(i,j1) )
%
%  ...and we haven't already found a difference...
%
          if ( l ~= -1 )
            l = - 1;
            break
          end
%
%  ...and this difference is +1...
%
          if ( sparse_index(i,j2) ~= sparse_index(i,j1) + 1 )
            break
          end
%
%  ...then remember this index.
%
          l = i;

        end

      end
%
%  If a single unit difference was found, record the direction.
%
      if ( l ~= - 1 )
        neighbor(l,j1) = 1;
      end

    end

  end

  return
end
