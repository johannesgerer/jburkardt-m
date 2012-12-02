function y = contrast_fun ( x )

%*****************************************************************************80
%
%% CONTRAST_FUN demonstrates MATLAB's SPMD command for parallel programming.
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
%    This example shows what happens when a big job is broken
%    into smaller ones, without taking care that individual small jobs
%    may need to share some data.
%
%    In this case, processing an image as 4 subimages is fine, except along
%    the interfaces between subimages.  Since each processor doesn't see the
%    data in the neighboring processor, the resulting image has bands.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 March 2010
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
    xl = nlfilter ( xl, [3,3], @contrast_enhance );
    xl = uint8 ( xl );
  end
%
%  We are working with a black and white image, so we can simply
%  concatenate the submatrices to get the whole object.
%
  y = [ xl{:} ];

  return
end
