function geom ( )

%% GEOM sets up geometric information using piecewise quadratic elements.
%
%  Modified:
%
%    24 May 2006
%
  global area
  global indx
  global m
  global nel
  global neqn
  global nnodes  
  global node
  global nq
  global nunk
  global xc
  global xl
  global xr 

  nt = nx - 1;
  nx2 = nx+nx-1 
  node = zeros(nt,3);
  indx = zeros(nx2,1);
  xc = zeros(nx2,1); 
  area = zeros(nt,1);

  hx = 1.0 / ( nx - 1 ); 
  xx = xl - hx / 2.0;
  np = 0;
  nel = 0;
  nunk = 0;

  for ic = 1 : nx2

    xx = xx + hx / 2.0; 
    ix = mod ( ic, 2 ); 
    np = np + 1;
%
%  Map points to nonuniform grid
%
    if ( ic <= nx )

      xval = gridx ( xx );
      xc(np) = xval; 
 
    elseif ( nx < ic )

      if ( ic < nx2 )
        xval =gridx ( xr - xx );
        xc(np) = xr - xval; 
      elseif ( ic == nx2 ) 
        xc(np) = xr; 
      end

    end
%
%  Set node array if not at midpoint node or right boundary
%
    if ( ix == 1 )

      if ( ic ~= nx2 )
        nel = nel + 1;   
        node(nel,1) = np;
        node(nel,2) = np + 1;
        node(nel,3) = np + 2;
      end 

    end 
%
%  Set indx array to give global node number assuming homogenous Neumann BC 
%
    nunk = nunk + 1; 
    indx(np) = nunk;

  end 
% 
%  Set quadrature information for 3 point Gauss rule
%
  nq = 3; 
% 
%  Reset midpoints  and compute area of elements.
%
  for it = 1 : nel
    ip1 = node(it,1); 
    ip3 = node(it,3);  
    x1 = xc(ip1);
    x3 = xc(ip3); 
    xc(ip1+1) = 0.5 * ( x1 + x3 ); 
    area(it) = abs ( x3 - x1 ); 
  end 
%
%  Print the values.
%
  xc

  return
end
