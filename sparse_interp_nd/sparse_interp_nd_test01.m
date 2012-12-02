function sparse_interp_nd_test01 ( m, sparse_max )

%*****************************************************************************80
%
%% SPARSE_INTERP_ND_TEST01: sequence of sparse interpolants to an M-dimensional function.
%
%  Discussion:
%
%    We have functions that can generate a Lagrange interpolant to data
%    in M dimensions, with specified order or level in each dimension.
%
%    We use the Lagrange function as the inner evaluator for a sparse
%    grid procedure. 
%
%    The procedure computes sparse interpolants of levels 0 to SPARSE_MAX
%    to a given function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Local, integer M, the spatial dimension.
%
%    Input, integer SPARSE_MAX, the maximum sparse grid level to try.
%
%  Local Parameters:
%
%    Local, real A(M), B(M), the upper and lower variable limits in each dimension.
%
%    Local, real APP_ERROR, the averaged Euclidean norm of the difference between
%    the sparse interpolant and the exact function at the interpolation points.
%
%    Local, integer C(L_MAX+1), the sparse grid coefficient vector.
%    Results at level L are weighted by C(L+1).
%
%    Local, integer IND(M), the 1D indices defining a Lagrange grid.
%    Each entry is a 1d "level" that specifies the order of a 
%    Clenshaw Curtis 1D grid.
%
%    Local, integer L, the current Lagrange grid level.
%
%    Local, integer L_MAX, the current sparse grid level.
%
%    Local, integer MORE, used to control the enumeration of all the
%    Lagrange grids at a current grid level.
%
%    Local, integer ND, the number of points used in a Lagrange grid.
%
%    Local, integer ND_TOTAL, the total number of points used in all the
%    Lagrange interpolants for a given sparse interpolant; points that occur
%    in more than one Lagrange grid are counted multiple times.
%
%    Local, integer NI, the number of interpolant evaluation points.
%
%    Local, integer SPARSE_MIN, the minimum sparse grid level to try.
%
%    Local, real XD(M,ND), the data points for a Lagrange grid.
%
%    Local, real XI(M,NI), the interpolant evaluation points.
%
%    Local, real ZD(ND), the data values for a Lagrange grid.
%
%    Local, real ZE(NI), the exact function values at XI.
%
%    Local, real ZI(NI), the sparse interpolant values at XI.
%
%    Local, real ZPI(NI), one set of Lagrange interpolant values at XI.
%
  tic

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_INTERP_ND_TEST01:\n' );
  fprintf ( 1, '  Sparse interpolation for a function f(x) of M-dimensional argument.\n' );
  fprintf ( 1, '  Use a sequence of sparse grids of levels 0 through SPARSE_MAX.\n' );
  fprintf ( 1, '  Invoke a general Lagrange interpolant function to do this.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compare the exact function and the interpolants at a grid of points.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The "order" is the sum of the orders of all the product grids\n' );
  fprintf ( 1, '  used to make a particular sparse grid.\n' );
%
%  User input.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
  fprintf ( 1, '  Maximum sparse grid level = %d\n', sparse_max );
%
%  Define the region.
%
  a(1:m,1) = 0.0;
  b(1:m,1) = 1.0;
%
%  Define the interpolation evaluation information.
%
  ni = 100;
  seed = 123456789;
  [ xi, seed ] = r8mat_uniform_abvec ( m, ni, a, b, seed );

  fprintf ( 1, '  Number of interpolation points is NI = %d\n', ni );

  ze = f_sinr ( m, ni, xi );
%
%  Compute a sequence of sparse grid interpolants of increasing level.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '   L     Order    ApproxError\n' );
  fprintf ( 1, '\n' );

  sparse_min = 0;

  for l_max = sparse_min : sparse_max

    [ c, ~ ] = smolyak_coefficients ( l_max, m );
    zi = zeros ( ni, 1 );
    nd_total = 0;

    for l = max ( l_max + 1 - m, 0 ) : l_max

      ind = [];
      more = 0;
      h = [];
      t = [];

      while ( 1 )
%
%  Define the next product grid.
%
        [ ind, more, h, t ] = comp_next ( l, m, ind, more, h, t );
%
%  Count the grid, find its points, evaluate the data there.
%
        nd = lagrange_interp_nd_size2 ( m, ind );
        xd = lagrange_interp_nd_grid2 ( m, ind, a, b, nd );
        zd = f_sinr ( m, nd, xd );
%
%  Use the grid to evaluate the interpolant.
%
        zpi = lagrange_interp_nd_value2 ( m, ind, a, b, nd, zd, ni, xi );
%
%  Weighted the interpolant values and add to the sparse grid interpolant.
%
        nd_total = nd_total + nd;
        zi(1:ni,1) = zi(1:ni,1) + c(l+1) * zpi(1:ni);

        if ( ~more )
          break
        end

      end

    end
%
%  Compare sparse interpolant and exact function at interpolation points.
%
    app_error = norm ( zi - ze ) / ni;
    fprintf ( 1, '  %2d  %8d  %e\n', l, nd_total, app_error );

  end

  fprintf ( 1, '\n' );
  toc

  return
end
