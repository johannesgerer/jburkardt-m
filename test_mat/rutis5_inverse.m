function a = rutis5_inverse ( )

%*****************************************************************************80
%
%% RUTIS5_INVERSE returns the inverse of the RUTIS5 matrix.
%
%  Example:
%
%     105  167 -304  255
%     167  266 -484  406
%    -304 -484  881 -739
%     255  406 -739  620
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Todd,
%    Basic Numerical Mathematics, Volume 2: Numerical Algebra,
%    Academic Press, 1977.
%
%  Parameters:
%
%    Output, real A(4,4), the matrix.
%

%
%  Note that the matrix entries are listed by row.
%
  a(1:4,1:4) = [ ...
    105.0,  167.0, -304.0,  255.0; ...
    167.0,  266.0, -484.0,  406.0; ...
   -304.0, -484.0,  881.0, -739.0; ...
    255.0,  406.0, -739.0,  620.0  ];

  return
end
