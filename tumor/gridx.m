function xval = gridx ( x )

%*****************************************************************************80
%
%% GRIDX maps a uniform grid into a nonuniform grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 November 2005
%
  xval = 0.5 / sqrt ( 0.5 ) * sqrt ( x );

  return
end
