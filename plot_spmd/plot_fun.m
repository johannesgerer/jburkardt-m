function [ X, Y ] = plot_fun ( )

%*****************************************************************************80
%
%% PLOT_FUN demonstrates MATLAB's SPMD command for parallel programming.
%
%  Discussion:
%
%    Each worker computes X and Y data for a portion of a sine curve.
%
%    The client patches the composite data into numeric arrays and
%    returns that as the function output.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real X(N,100), Y(N,100), the data, stored as N vectors.
%

%
%  Set a list of colors that will be cycled through with each
%  plot command.
%
  spmd
    a = 2 * pi * ( labindex - 1 ) / numlabs;
    b = 2 * pi *   labindex       / numlabs;
    x = linspace ( a, b, 100 );
    y = sin ( x );
    fprintf ( 1, '  Lab %d works on [%f,%f].\n', labindex, a, b );
  end
%
%  Copy the composite data from the workers, and
%  convert it into numeric arrays.
%
%  (Only client data can be returned as output arguments!)
%
  n = matlabpool ( 'size' );

  X = [];
  Y = [];

  for i = 1 : n
    X = [ X; x{i} ];
    Y = [ Y; y{i} ];
  end

  return
end
