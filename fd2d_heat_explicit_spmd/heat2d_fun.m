function y = heat2d_fun ( x )

%*****************************************************************************80
%
%% HEAT2D_FUN demonstrates MATLAB's SPMD command for parallel programming.
%
%  Discussion:
%
%    A black and white image X is input.
%
%    A copy of X is distributed across the workers.
%
%    The pixels are regarded as numeric temperatures.
%
%    Each worker applies the explicit heat equation stencil to the pixels
%    in its local part.
%
%    The client combines the results and displays them.
%
%    100 "time" steps are taken, using a CFL coefficient of 0.20.
%    (For this problem, CFL should not be more than 0.25!)
%
%    In this example, we make sure that neighboring workers can share
%    their data, and eliminate the bands that would otherwise show up
%    because of artificial boundaries.
%
%    This is a very artificial calculation, but by using an interesting
%    initial condition, we can make the point that the heat equation "blurs"
%    data, and that by treating the interfaces correctly, we can solve a
%    big problem as a connected set of small problems.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 April 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, image X, the initial black and white image.
%
%    Output, image Y, the black and white image after 100 "time" steps of blurring.
%

%
%  CFL is the Courant-Friedrichs-Loewy coefficient, which for this 2D problem
%  should not be larger than 0.25.
%
  cfl = 0.20;
%
%  Since the image is black and white, it is a 2D array.
%  Hence, it will be distributed by columns.
%
  xd = distributed ( x );
%
%  Each worker retrieves its portion of the distributed picture,
%  turn it into a numerical array, and compute the previous and
%  next worker.
%
%  We only need to do these operations once, so do them OUTSIDE the time loop.
%
  spmd

    xl = getLocalPart ( xd );

    xl = double ( xl );

    if ( labindex ~= 1 )
      previous = labindex - 1;
    else
      previous = numlabs;
    end

    if ( labindex ~= numlabs )
      next = labindex + 1;
    else
      next = 1;
    end
%
%  Do 100 steps of blurring.
%
  for i = 1 : 100

    spmd
%
%  Each worker sends its first column to the previous worker,
%  and receives corresponding data from the next worker.
%
      column = labSendReceive ( previous, next, xl(:,1) );

      if ( labindex < numlabs )
        xl = [ xl, column ];
      end
%
%  Each worker sends its last column to the next worker,
%  and receives corresponding data from the previous worker.
%
      column = labSendReceive ( next, previous, xl(:,end) );

      if ( 1 < labindex )
        xl = [ column, xl ];
      end
%
%  Now apply the stencil for the explicit heat equation 
%  on the interior points.
%
%  Here, we are modeling:
%
%    dH/dt = - d/dx k ( dH/dx )
%
      [ nr, nc ] = size ( xl );

      c1 = 2:nr-1;
      c2 = 2:nc-1;

      xl(c1,c2) = ( 1 - 4 * cfl ) * xl(c1,c2) ...
        + cfl * ( xl(c1-1,c2) + xl(c1+1,c2) ...
                + xl(c1,c2-1) + xl(c1,c2+1)  );
%
%  West boundary conditions on lab #1.
%
      if ( labindex == 1 )
        xl(:,1) = xl(:,2);
      end
%
%  North and south boundary conditions occur on every lab.
%
      xl(1,:) = xl(2,:);
      xl(end,:) = xl(end-1,:);
%
%  East boundary conditions on last lab.
%
      if ( labindex == numlabs )
        xl(:,end) = xl(:,end-1);
      end
%
%  Now strip off the extra columns.
%
      if ( 1 < labindex )
        xl = xl(:,2:end);
      end

      if ( labindex < numlabs )
        xl = xl(:,1:end-1);
      end
%
%  Convert to unsigned short ints so we can make an image.
%
      yl = uint8 ( xl );

    end
%
%  We are working with a black and white image, so we can simply
%  concatenate the submatrices to get the whole object.
%
    y = [ yl{:} ];
    imshow ( y )
    pause

  end

  return
end
