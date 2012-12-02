function range = p04_range ( )

%*****************************************************************************80
%
%% P04_RANGE returns an interval bounding the root for problem 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real RANGE(2), the minimum and maximum values of
%    an interval containing the root.
%
  range(1) =  0.00001;
  range(2) = 20.0;

  return
end
