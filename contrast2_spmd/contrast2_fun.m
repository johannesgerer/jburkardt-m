function y = contrast2_fun ( x )

%*****************************************************************************80
%
%% CONTRAST2_FUN demonstrates MATLAB's SPMD command for parallel programming.
%
%  Discussion:
%
%    The black and white image X is input.
%
%    A copy of X is distributed across the workers.
%
%    Each worker applies a contrast enhancement filter to its local part.
%
%    The client combines the results and returns them.
%
%    In this example, we make sure that neighboring workers can share
%    their data, and eliminate the bands that would otherwise show up
%    because of artificial boundaries.
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
%    Output, image Y, the contrast-enhanced black and white image.
%

%
%  Since the image is black and white, it is a 2D array.
%  Hence, it will be distributed by columns.
%
  xd = distributed ( x );
%
%  Have each worker enhance the contrast in its portion of the picture.
%
%  You will see lots of meaningless error messages, because NLFILTER
%  wants to put out a "waitbar" telling you to wait.  But the workers
%  don't have an associated display.
%
  spmd

    xl = getLocalPart ( xd );
%
%  In order to use LABSENDRECEIVE, we need to reference the previous
%  and next labindex.
%
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
%  Now do the enhancement.
%  We can only do a 3x3 neighborhood, because we're only sending
%  one column to the left and right.
%
    xl = nlfilter ( xl, [3,3], @contrast_enhance );
%
%  Now strip off the extra columns.
%
    if ( 1 < labindex )
      xl = xl(:,2:end);
    end

    if ( labindex < numlabs )
      xl = xl(:,1:end-1);
    end

    xl = uint8 ( xl );

  end
%
%  We are working with a black and white image, so we can simply
%  concatenate the submatrices to get the whole object.
%
  y = [ xl{:} ];

  return
end
