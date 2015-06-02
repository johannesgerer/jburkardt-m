function a = bodewig_inverse ( )

%*****************************************************************************80
%
%% BODEWIG_INVERSE returns the inverse of the BODEWIG matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(4,4), the matrix.
%

%
%  Note that the matrix entries are listed by row.
%
  a(1:4,1:4) = [ ...
    -139.0,  165.0,  79.0,  111.0; ...
     165.0, -155.0, -57.0,   -1.0; ...
      79.0,  -57.0,  45.0,  -59.0; ...
     111.0,   -1.0, -59.0,  -11.0  ];

  a(1:4,1:4) = a(1:4,1:4) / 568.0;

  return
end
