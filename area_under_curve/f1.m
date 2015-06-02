function value = f1 ( x )

%*****************************************************************************80
%
%% F1 is an example of a function whose "area under the curve" is to be plotted.
%
%  Discussion:
%
%    This function should be written in such a way that it can accept
%    an input X that is a vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the value of the function.
%
  value = 0.75 * ( 1.0 - x.^2 );

  return
end

