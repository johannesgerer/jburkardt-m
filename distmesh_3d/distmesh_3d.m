function [ p, t ] = distmesh_3d ( fd, fh, h0, box, iteration_max, pfix, varargin )

%*****************************************************************************80
%
%% DISTMESH_3D 3D Mesh Generator using Distance Functions.
%
%  Copyright:
%
%    (C) 2004 Per-Olof Persson. 
%    See COPYRIGHT.TXT for details.
%
%  Modified:
%
%    19 September 2005
%
%  Reference:
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, June 2004, pages 329-345.
%
%  Parameters:
%
%    Input, function FD, signed distance function d(x,y).
%
%    Input, function FH, scaled edge length function h(x,y).
%
%    Input, real H0, the initial smallest edge length.
%
%    Input, real BOX(3,2), a bounding box for the region.
%
%    Input, integer ITERATION_MAX, the maximum number of iterations.
%    The iteration might terminate sooner than this limit, if the program decides
%    that the mesh has converged.
%
%    Input, real PFIX(NFIX,3), the coordinates of nodes that are
%    required to be included in the mesh.
%
%    Input, VARARGIN, additional parameters that can be passed to FD
%
%    Output, real P(N,3), node coordinates.
%
%    Output, integer T(NT,4), tetrahedron indices.
%
  dim = 3;
  ptol = 0.001; 
  ttol = 0.1; 
  L0mult = 1 + 0.4 / 2^(dim-1); 
  deltat = 0.1; 

  geps = 0.1 * h0;
  
  deps = sqrt ( eps ) * h0;
  iteration = 0;
%
% 1. Create the initial distribution in the bounding box.
%
  cbox = cell(1,dim);
  for ii = 1 : dim
    cbox{ii} = box(1,ii) : h0 : box(2,ii);
  end

  pp = cell(1,dim);
  [pp{:}] = ndgrid(cbox{:});
  p = zeros(prod(size(pp{1})),dim);
  for ii = 1 : dim
    p(:,ii) = pp{ii}(:);
  end
%
% 2. Remove points outside the region, apply the rejection method.
%
  p = p ( feval(fd,p,varargin{:}) < geps, : );
  r0 = feval ( fh, p );
  p = p(rand(size(p,1),1)<min(r0)^dim./r0.^dim, : );
  p = [ pfix; p ];
%
%  If ITERATION_MAX is 0, we're almost done.
%  For just this case, do the triangulation, then exit.
%  (I am trying to see what the initial data looks like.)
%
  if ( iteration_max <= 0 )
    t = delaunayn ( p );
    return
  end

  N = size ( p, 1 );

  count = 0;
  p0 = inf;

  while ( iteration < iteration_max )
      
    iteration = iteration + 1;

    if ( mod ( iteration, 10 ) == 0 )
      fprintf ( 1, '%d iterations, %d triangulations.\n', iteration, count );
    end
%
% 3. Retriangulation is required if any point has moved "significantly".
%
    if ( ttol * h0 < max (sqrt(sum((p-p0).^2,2)) ) )

      p0 = p;
      t = delaunayn ( p );
%
%  Determine the centroid of each simplex.
%
      pmid = zeros(size(t,1),dim);
      for ii = 1 : dim+1
        pmid = pmid + p(t(:,ii),:) / (dim+1);
      end
%
%  Only keep those simplices in the new triangulation for which
%  the centroids is inside the region, or not too far outside.
%
      t = t ( feval ( fd, pmid, varargin{:} ) < -geps, : );
%
%  4. Describe each edge by a unique pair of nodes.
%
      pair = zeros(0,2);
      localpairs = nchoosek(1:dim+1,2);
      for ii = 1 : size(localpairs,1)
        pair = [pair;t(:,localpairs(ii,:))];
      end
      pair = unique(sort(pair,2),'rows');
%
% 5. Graphical output of the current mesh.
%
      if ( mod ( count, 5 ) == 0 )
        simp_plot_3d ( p, t, 'p(:,1)<3' );
%       title ( ['Retriangulation #', int2str(count) ] )
        drawnow
      end

      count = count + 1;
      
    end
%
% 6. Move mesh points based on edge lengths L and forces F.
%
    bars = p(pair(:,1),:)-p(pair(:,2),:);
    L = sqrt(sum(bars.^2,2));
    L0 = feval(fh,(p(pair(:,1),:)+p(pair(:,2),:))/2);
    L0 = L0*L0mult*(sum(L.^dim)/sum(L0.^dim))^(1/dim);
    F = max(L0-L,0);
    Fbar = [bars,-bars].*repmat(F./L,1,2*dim);
    dp = full(sparse(pair(:,[ones(1,dim),2*ones(1,dim)]), ...
                 ones(size(pair,1),1)*[1:dim,1:dim], ...
                 Fbar,N,dim));
    dp(1:size(pfix,1),:) = 0;
    p = p + deltat * dp;
%
%  6.9  Suitable for CUBE only!
%
    if ( 0 )
      p(:,:) = max ( p(:,:), 0.0 );
      p(:,:) = min ( p(:,:), 1.0 );
    end
%
% 7. Bring outside points back to the boundary.
%
%  Note that this is simply a gradient step.
%  Taking more than one gradient step can improve the
%  projection properties, reduce the number of bad simplices,
%  and reduce the number of retriangulations.  Here, we
%  have changed from the program's original one step to 2.
%
    for steps = 1 : 2
        
      d = feval ( fd, p, varargin{:} );
      ix = ( 0 < d );
      gradd = zeros ( sum(ix), dim );

      for ii = 1 : dim
        a = zeros(1,dim);
        a(ii) = deps;
        d1x = feval ( fd, p(ix,:)+ones(sum(ix),1)*a, varargin{:} );
        gradd(:,ii) = ( d1x - d(ix) ) / deps;
      end

      p(ix,:) = p(ix,:) - d(ix) * ones(1,dim) .* gradd;
    
    end
%
% 8. Termination criterion.
%
    maxdp = max ( deltat * sqrt ( sum(dp(d < -geps, : ).^2, 2 ) ) );

    if ( maxdp < ptol * h0 )
      break;
    end
    
  end

  return
end
