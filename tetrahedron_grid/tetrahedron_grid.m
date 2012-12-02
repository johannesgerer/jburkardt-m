function tg = tetrahedron_grid ( n, t, ng )

%*****************************************************************************80
%
%% TETRAHEDRON_GRID computes points on a tetrahedral grid.
%
%  Discussion:
%
%    The grid is defined by specifying the coordinates of an enclosing
%    tetrahedron T, and the number of subintervals each edge of the 
%    tetrahedron should be divided into.
%
%    Choosing N = 10, for instance, breaks each side into 10 subintervals,
%    and produces a grid of ((10+1)*(10+2)*(10+3))/6 = 286 points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of subintervals.
%
%    Input, real T(3,4), the vertices of the tetrahedron.
%
%    Input, integer NG, the number of grid points.
%
%    Output, real TG(3,NG), the tetrahedron grid points.
%
  tg = zeros ( 3, ng );

  p = 0;

  for i = 0 : n
    for j = 0 : n - i
      for k = 0 : n - i - j
        l = n - i - j - k;
        p = p + 1;
        tg(1:3,p) = ( i * t(1:3,1) + j * t(1:3,2) ...
                    + k * t(1:3,3) + l * t(1:3,4) ) / n;
      end
    end
  end

  return
end
